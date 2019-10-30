class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|

      t.text :text
      t.text :image
      t.references :user,            null: false, froeign_key: true
      t.references :name,            null: true, froeign_key: true
      t.timestamps null: false
    end
  end
end
