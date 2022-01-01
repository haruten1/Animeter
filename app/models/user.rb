class User < ApplicationRecord
    validates :Animeter_id, presence: true, length: { maximum: 20 },uniqueness:true
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, length: { maximum: 100 },format: { with: VALID_EMAIL_REGEX },uniqueness: true
    has_secure_password 
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    mount_uploader :img, ImgUploader
    has_one_attached :img
    validate :img_content_type, if: :was_attached?
    # validates :img, presence: true

    has_many :my_works

    def ranked_by?(work_id,user_id)
        works= MyWork.find_by(work_id: work_id, user_id:user_id)
        
        return works
    end

    def img_content_type
        extension = ['image/png', 'image/jpg', 'image/jpeg','image/heic']
        errors.add(:img,"ファイルを選んでください") unless img.content_type.in?(extension)
    end

    def was_attached?
        self.img?
    end

end
