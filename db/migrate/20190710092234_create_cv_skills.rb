class CreateCvSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :cv_skills do |t|
    	t.belongs_to :cv, 			index: true
    	t.belongs_to :skill, index: true
      t.timestamps
    end
  end
end
