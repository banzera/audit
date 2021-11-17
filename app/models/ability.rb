class Ability
  include CanCan::Ability

  def initialize(user)
    alias_actions!

    user ||= User.new

    can [:read], :all

    # can(:manage, :all) if user.is_admin?

    can [
      :update,
      :receive,
    ], PurchaseOrder

    can [
      :receive,
    ], PurchaseOrderItem

    can [
      :lookup,
      :search,
      :receive,
    ], Sku

    # user.permissions.each do |permission|
    #   conditions = permission.conditions.present? ? JSON.parse(permission.conditions) : {}

    #   # if the noun represents a Class, it will be able to constantize
    #   # otherwise, we have to turn it to a symbol
    #   begin
    #     can permission.verb.to_sym, permission.noun.constantize, conditions
    #   rescue NameError
    #     can permission.verb.to_sym, permission.noun.to_sym, conditions
    #   end
    # end
  end

  private

  def alias_actions!
    alias_action :view,                                      to: :read
    alias_action :update, :destroy, :delete_modal, :delete,  to: :modify
  end
end
