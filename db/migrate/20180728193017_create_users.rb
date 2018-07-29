class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :email, null: false
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :profile_image_url, null: false, default: ""

      t.timestamps
    end

    add_index :users, %i(provider uid), unique: true
  end
end
