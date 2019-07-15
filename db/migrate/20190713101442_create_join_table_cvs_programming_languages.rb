class CreateJoinTableCvsProgrammingLanguages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cvs, :programming_languages do |t|
      t.index :cv_id
      t.index :programming_language_id
    end
  end
end
