class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.belongs_to :user, index: true
      t.string :firstname
      t.string :lastname
      t.datetime :birthdate
      t.string :tel
      t.string :address
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
