class CreateAsks < ActiveRecord::Migration[6.0]
  def change
    create_table :asks do |t|
      t.string :title,        null: false
      t.text :text,        null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
