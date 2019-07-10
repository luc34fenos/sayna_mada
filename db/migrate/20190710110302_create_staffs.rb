class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :job
      t.string :email
      t.string :tel

      t.timestamps
    end
  end
end
