class Article < ApplicationRecord
    #one to many association
    belongs_to :user
    #validation
    validates :title, presence:true, length: { minimum:8,maximum:50 }
    validates :description, presence:true, length: { minimum:8,maximum:150 }    
end