module HasBatch
  extend ActiveSupport::Concern

  included do
    class_attribute :batch_attribute
    class_attribute :batch_opts
    class_attribute :batch_serial_fx

    before_create :set_batch!

    def to_s
      self.batch_attribute ? public_send(self.batch_attribute) : super
    end

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
      date_attr = batch_opts[:date] || "#{self.class.name.downcase}date"
      public_send(date_attr).to_s(:yymmdd)
    end

    def batch_serial_number
      x = instance_exec &batch_serial_fx
      BATCH_SERIAL_NUMBER_FORMAT % (x+1)
    end

    def set_batch!
      public_send("#{self.batch_attribute}=", batch_string)
    end
  end

  class_methods do
    BATCH_SERIAL_NUMBER_FORMAT = '%02d'.freeze

    def has_batch_number(attr=:batch, batch_opts={}, &blk)
      self.batch_attribute = attr
      self.batch_opts      = batch_opts
      self.batch_serial_fx = blk
    end

  end

end

