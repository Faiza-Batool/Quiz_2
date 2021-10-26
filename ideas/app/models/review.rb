class Review < ApplicationRecord
  #ASSOCIATIONS
  belongs_to :idea
  belongs_to :user

  #VALIDATIONS
  validates :body, length: { minimum: 2, maximum: 200 }
end
