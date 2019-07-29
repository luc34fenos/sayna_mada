class CreateCoverLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_letters do |t|
      t.belongs_to :cv, index: true
      t.text :content, 	default: "Veuillez créer une lettre de motivation ou importez-en une et copiez-la ici"

      t.timestamps
    end
  end
end
