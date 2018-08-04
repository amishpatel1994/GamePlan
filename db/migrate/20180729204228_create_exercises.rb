class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.string :description, null: false, default: ""
      t.string :video_embed_url, null: false, default: ""
      t.string :image_url, null: false
    end

    add_index :exercises, :name, unique: true
  end
end
