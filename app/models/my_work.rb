class MyWork < ApplicationRecord
    belongs_to :user,optional: true
    belongs_to :works,optional: true
    validates :rank, presence: true

    def whats_work(work_id)
        my_work= Work.find_by(id:work_id)
        return my_work
    end

    def who_user(user_id)
        user=User.find_by(id:user_id)
        return user
    end
end
