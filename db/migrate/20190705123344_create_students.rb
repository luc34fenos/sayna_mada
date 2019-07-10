class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.datetime :birthdate
      t.string :tel
      t.text :summary
      t.text :hobbies
      t.string :city

      t.timestamps
    end
  end
end
