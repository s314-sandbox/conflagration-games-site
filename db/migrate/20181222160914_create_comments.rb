class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :contents
      t.belongs_to :article
      t.belongs_to :user

      t.timestamps
    end
  end
end
