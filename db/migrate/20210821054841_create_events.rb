class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,            null: false
      t.integer :gender_id,      null: false
      t.date :anniversary_date,  null: false
      t.integer :category_id,    null: false
      t.string :anniversary_name
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end