class User < ApplicationRecord
    validates :Animeter_id, presence: true, length: { maximum: 20 },uniqueness:true
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, length: { maximum: 100 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
    has_secure_password 
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    has_many :my_works

    def ranked_by?(work_id,user_id)
        works= MyWork.find_by(work_id: work_id, user_id:user_id)
        
        return works
    end

end
