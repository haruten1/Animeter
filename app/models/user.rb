class User < ApplicationRecord
    validates :Animeter_id, presence: true, length: { maximum: 20 },uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
end
