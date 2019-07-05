class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
    	t.belongs_to :student, index: true
      t.string :name

      t.timestamps
    end
  end
end
