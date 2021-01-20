class Article < ApplicationRecord
    #one to many association
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    #validation
    validates :title, presence:true, length: { minimum:8,maximum:50 }
    validates :description, presence:true, length: { minimum:8,maximum:150 }    
end