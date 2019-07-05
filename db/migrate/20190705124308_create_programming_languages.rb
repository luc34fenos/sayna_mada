class CreateProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :programming_languages do |t|
    	t.belongs_to :student, index: true
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
