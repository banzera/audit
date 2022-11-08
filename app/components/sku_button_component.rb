# frozen_string_literal: true

class SkuButtonComponent < ViewComponent::Base

  def initialize(sku:)
    @sku = sku
  end

  def classes
    classes = %w(btn btn-sm btn-outline-secondary)
    classes << 'bg-danger' if @sku.has_issue?
    classes
  end


  def render?
    @sku.skuid.positive?
  end
end
