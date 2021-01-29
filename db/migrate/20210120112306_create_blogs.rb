class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.time :read_time
      t.string :image
      t.text :body
      t.references :category, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
