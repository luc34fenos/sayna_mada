class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :name
      t.text :description
      t.string :target
      t.string :level
      t.string :link, default: "/"

      t.timestamps
    end
  end
end
