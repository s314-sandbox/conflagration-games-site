class Comment < ApplicationRecord
  validates :contents, presence: true
  belongs_to :article
  belongs_to :user
end
