module HasBatch
  extend ActiveSupport::Concern

  included do
    class_attribute :batch_attribute
    class_attribute :batch_opts
    class_attribute :batch_serial_fx

    before_save :set_batch!, if: :batch_needs_update?

    def batch_string
      batch_string = [
        *batch_attrs,
        batch_date,
        batch_serial_number,
      ].compact.join('X')

      "#{batch_prefix}#{batch_string}"
    end

    def batch_prefix
      batch_opts[:prefix]
    end

    def batch_attrs
      Array(batch_opts[:attrs]).collect {|a| instance_eval(a) }
    end

    def batch_date
      public_send(self.class.batch_date_attr).to_s(:yymmdd)
    end

    def batch_serial_number
      last_batch = instance_exec(&batch_serial_fx) || '00'
      x = last_batch[-2..].to_i

      BATCH_SERIAL_NUMBER_FORMAT % (x+1)
    end

    def batch_needs_update?
      date_changed  = self.changed_attributes.include?(batch_opts[:date].to_s)
      attrs_changed = (self.changed_attributes.keys & batch_attribute_names).present?

      date_changed || attrs_changed
    end

    def set_batch!
      public_send("#{self.batch_attribute}=", batch_string)
    end

    private

    def batch_attribute_names
      syms = Array(batch_opts[:attrs]).collect {|a| a.split('.').first.to_sym }
      fks  = syms.collect {|a| association(a).options[:foreign_key].to_s }
    end
  end

  class_methods do
    BATCH_SERIAL_NUMBER_FORMAT = '%02d'.freeze

    def batch_date_attr
      date_attr = batch_opts[:date] || "#{self.name.downcase}date"
    end

    def has_batch_number(attr=:batch, batch_opts={}, &blk)
      self.batch_attribute = attr
      self.batch_opts      = batch_opts
      self.batch_serial_fx = blk

      validates_presence_of batch_date_attr, on: :create
    end

  end

end

