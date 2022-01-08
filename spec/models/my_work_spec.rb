require 'rails_helper'

RSpec.describe MyWork, type: :model do
# associationで関連付けしているので、Userオブジェクトを自分で作らなくていい!!
    let(:my_work) { FactoryBot.create(:my_work) }

    it "is should be valid" do
        expect(my_work).to be_valid
    end

    it "is invalid with no rank" do
        my_work.rank = nil
        expect(my_work).to be_invalid
    end

    it "is invalid with no user_id" do
        my_work.user_id = nil
        expect(my_work).to be_invalid
    end

    it "is invalid with no work_id" do
        my_work.work_id = nil
        expect(my_work).to be_invalid
    end


end