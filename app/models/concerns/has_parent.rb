module HasParent
  extend ActiveSupport::Concern

  included do
    class_attribute :parent_rel

    def parent
      send parent_rel
    end

  end

  class_methods do

    def parent(rel)
      self.parent_rel = rel
    end

  end

end

