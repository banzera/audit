class AddPrimaryContactToProspects < ActiveRecord::Migration[6.1]
  def change
    add_column :prospects, :primary_contact, :string
  end
end
