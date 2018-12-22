class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :contents, presence: true, length: { minimum: 10, maximum: 4000 }
  belongs_to :category
  belongs_to :author, class_name: 'User'
end
