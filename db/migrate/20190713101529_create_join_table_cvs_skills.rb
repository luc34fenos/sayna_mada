class CreateJoinTableCvsSkills < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cvs, :skills do |t|
      t.index :cv_id
      t.index :skill_id
    end
  end
end
