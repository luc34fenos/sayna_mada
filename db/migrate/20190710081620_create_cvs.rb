class CreateCvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cvs do |t|
    	t.belongs_to :student, index: true
      t.text :hobbies
      t.text :summary

      t.timestamps
    end
  end
end
