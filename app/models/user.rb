class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :confirm_password, :presence => true
  validates :password, confirmation: true
  validates_length_of :password, :in => 6..20, :on => :create
end
