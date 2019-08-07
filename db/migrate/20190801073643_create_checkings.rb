class CreateCheckings < ActiveRecord::Migration[5.2]
  def change
    create_table :checkings do |t|
      t.references :user, 			foreign_key: true
      t.references :notification, 	foreign_key: true
      t.boolean :seen, 				default: false

      t.timestamps
    end
  end
end
