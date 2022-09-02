class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :content
      t.integer :authorId
      t.string :image
      t.string :tag

      t.timestamps
    end
  end
end
