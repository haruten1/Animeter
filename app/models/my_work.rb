class MyWork < ApplicationRecord
    belongs_to :user,optional: true
    belongs_to :works,optional: true
    validates :rank, presence: true

    def whats_work(work_id)
        my_work= Work.find_by(id:work_id)
        return my_work
    end
end
