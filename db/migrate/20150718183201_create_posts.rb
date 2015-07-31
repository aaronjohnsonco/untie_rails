class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.date :pub_date
      t.boolean :favorite
      t.text :body

      t.timestamps
    end
  end
end
