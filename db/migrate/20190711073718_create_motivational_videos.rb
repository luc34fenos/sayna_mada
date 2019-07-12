class CreateMotivationalVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :motivational_videos do |t|
      t.references :cv, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
