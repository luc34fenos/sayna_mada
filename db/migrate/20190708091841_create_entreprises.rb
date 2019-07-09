class CreateEntreprises < ActiveRecord::Migration[5.2]
  def change
    create_table :entreprises do |t|
      t.string :name
      t.string :year
      t.string :adress
      t.string :person
      t.string :titre
      t.string :juridique
      t.string :phone
      t.string :email
      t.string :web
      t.string :ville1
      t.string :ville2
      t.string :country
      t.string :secteur
      t.string :other
      t.string :siret
      t.references :user, index: true
      t.boolean :check, default: false
      t.timestamps
    end
  end
end
