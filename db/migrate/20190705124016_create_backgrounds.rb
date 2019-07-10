class CreateBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :backgrounds do |t|
    	t.belongs_to :student, index: true
      t.string :name
      t.text :description
      t.datetime :beginning
      t.datetime :ending

      t.timestamps
    end
  end
end
