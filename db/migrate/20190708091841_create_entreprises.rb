class CreateEntreprises < ActiveRecord::Migration[5.2]
  def change
    create_table :entreprises do |t|
      t.string :name
      t.string :description
      t.string :langague
      t.string :adress
      t.references :user, index: true
      t.timestamps
    end
  end
end
