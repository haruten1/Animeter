class User < ApplicationRecord
    validates :Animeter_id, presence: true, length: { maximum: 20 },uniqueness:true
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, length: { maximum: 100 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
    has_secure_password 
    validates :password, presence: true, length: { minimum: 6 }
end
