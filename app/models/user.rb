class User < ApplicationRecord
    #method to covnvert email to lowercase before save into DB.
    before_save { self.email = email.downcase }
    #one-to-many association
    has_many :articles, dependent: :destroy
    #validation of field
    validates :username, presence: true, uniqueness: { case_sensitive: false},length: { minimum: 3,maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false},length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}
    #to secure password
    has_secure_password
end