class CreateWebs < ActiveRecord::Migration[5.2]
  def change
    create_table :webs do |t|
    	t.bigint :cv_id
    	t.bigint :company_id
      t.string :name
      t.string :link
      t.timestamps
    end
  end
end
