class CreateQryInventoryCounts < ActiveRecord::Migration[6.1]
  def change
    create_view :qryInventoryCounts
  end
end
