class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.belongs_to :user,       index: true
      t.string :firstname
      t.string :lastname
      t.string :sexe,           default: "non spécifié"
      t.string :marital_status, default: "compliqué"
      t.datetime :birthdate
      t.string :tel
      t.string :address
      t.belongs_to :city,       index: true
      t.boolean :is_activated?, default: false

      t.timestamps
    end
  end
end
