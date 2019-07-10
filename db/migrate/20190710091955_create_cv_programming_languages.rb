class CreateCvProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :cv_programming_languages do |t|
		t.belongs_to :cv, 			index: true
    	t.belongs_to :programming_language, index: true
      t.timestamps
    end
  end
end
