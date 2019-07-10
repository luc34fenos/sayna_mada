class CreateCvLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :cv_languages do |t|
    	t.belongs_to :cv, 			index: true
    	t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
