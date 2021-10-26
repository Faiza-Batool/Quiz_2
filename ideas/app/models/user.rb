class User < ApplicationRecord
    
    #ASSOCIATIONS
    has_secure_password
    has_many :ideas, dependent: :destroy
    has_many :reviews, dependent: :destroy
    
    has_many :likes, dependent: :destroy
    has_many :liked_ideas, through: :likes, source: :idea
    
    #VALIDATIONS
    validates :first_name, :last_name, :email, :password, presence:true

    def full_name
        "#{first_name} #{last_name}"
    end
end
