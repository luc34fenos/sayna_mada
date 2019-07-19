class CreateProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :programming_languages do |t|
      t.string :name
      t.integer :level, default: 3

      t.timestamps
    end
  end
end
