class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :contents, presence: true, length: { minimum: 10, maximum: 100_000 }
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :comments
end
