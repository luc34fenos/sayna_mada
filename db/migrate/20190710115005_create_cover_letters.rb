class CreateCoverLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_letters do |t|
      t.belongs_to :cv, index: true
      t.text :content

      t.timestamps
    end
  end
end
