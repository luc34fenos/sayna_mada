class CreateJoinTableCvsLanguages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cvs, :languages do |t|
      t.index :cv_id
      t.index :language_id
    end
  end
end
