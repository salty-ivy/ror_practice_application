class Article < ApplicationRecord
  # belongs_to :user
  has_many :comments
  # validates :user, presence: true
  validates :title, :presence => true
  validates :body, presence: true
  validates :likes, numericality: {only_integer: true, greater_than_or_equal_to:0}
end
