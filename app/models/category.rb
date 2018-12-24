class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  has_many :articles
end
