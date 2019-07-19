class CreateWebs < ActiveRecord::Migration[5.2]
  def change
    create_table :webs do |t|
    	t.references :cv,      foreign_key: true
    	t.references :company, foreign_key: true
      t.string :name
      t.string :link
      t.timestamps
    end
  end
end
