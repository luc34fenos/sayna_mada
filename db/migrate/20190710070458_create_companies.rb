class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :start_date
      t.string :address
      t.string :legal_status
      t.string :phone
      t.string :activity_area
      t.string :siret
      t.text :other
      t.references :user, index: true
      t.boolean :is_activated?, default: false
      t.timestamps
    end
  end
end
