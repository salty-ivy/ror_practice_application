class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive:false}, format:{with:VALID_EMAIL_REGEX}
  validates :password_digest, presence: true
  validates :confirm_password, :presence => true
  validates :password_digest, confirmation: true
  validates_length_of :password_digest, :in => 6..20, :on => :create
end
