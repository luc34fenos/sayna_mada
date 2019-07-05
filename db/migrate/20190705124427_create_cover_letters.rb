class CreateCoverLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_letters do |t|
    	t.belongs_to :student, index: true
      t.string :object
      t.text :content

      t.timestamps
    end
  end
end
