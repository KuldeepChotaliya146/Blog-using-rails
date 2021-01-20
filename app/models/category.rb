class Category < ApplicationRecord
    validates :name, uniqueness: true , presence: true
    has_many :article_categories
    has_many :articles, through: :article_categories
end