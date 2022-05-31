class CreateProspects < ActiveRecord::Migration[6.1]
  def change
    create_table :clinic_types do |t|
      t.string :name
    end

    create_table :prospects do |t|

      t.string :office_name
      t.integer :clinic_type_id
      t.string :status
      t.integer :assigned_to_id

      t.string :contact_phone
      t.string :alt_phone

      t.text :doctors_names
      t.text :notes

      t.timestamps
    end

    create_table :contacts do |t|
    end

  end
end
