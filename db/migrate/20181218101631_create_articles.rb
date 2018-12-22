class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :contents
      t.belongs_to :category, index: true
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
