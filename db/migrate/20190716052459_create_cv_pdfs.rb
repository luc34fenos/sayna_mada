class CreateCvPdfs < ActiveRecord::Migration[5.2]
  def change
    create_table :cv_pdfs do |t|

      t.timestamps
    end
  end
end
