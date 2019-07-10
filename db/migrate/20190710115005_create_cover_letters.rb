class CreateCoverLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_letters do |t|
      t.text :content
      t.references :cv, foreign_key: true

      t.timestamps
    end
  end
end
