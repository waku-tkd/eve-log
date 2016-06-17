class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :location
      t.integer :headcount
      t.integer :budget
      t.string :url
      t.string :comment

      t.timestamps null: false
    end
  end
end
