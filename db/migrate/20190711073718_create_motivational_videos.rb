class CreateMotivationalVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :motivational_videos do |t|
      t.belongs_to :cv, index: true
      t.string :link

      t.timestamps
    end
  end
end
