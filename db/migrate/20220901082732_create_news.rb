class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.string :tag
    end
  end
end
