class Friend < ApplicationRecord
  validates :name, :gender, :phone, presence: true
  
  belongs_to :user
end
