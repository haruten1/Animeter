FactoryBot.define do
    factory :my_work do
        rank { "3" }
        user_id{"1"}
        work_id{"1"}
        # association :user
        # association :work
    end
end