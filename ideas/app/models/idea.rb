class Idea < ApplicationRecord

    #ASSOCIATIONS
    has_many :reviews, dependent: :destroy
    belongs_to :user
    
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user
    
    #VALIDATIONS
    validates :title, presence: {message: "must be provided"}, uniqueness: true
    validates :description, presence: true, length: { minimum: 2, maximum: 200 }

end
