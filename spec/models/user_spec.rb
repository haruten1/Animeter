require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { FactoryBot.build(:user) }

    it 'should be valid' do
        expect(user).to be_valid
    end

    it 'is invalid with no name' do
        user.name = ' '
        expect(user).to be_invalid
    end

    it 'is invalid with no mail' do
        user.mail = ' '
        expect(user).to be_invalid
    end

    it 'is invalid with 51-letter names' do
        user.name = 'a' * 51
        expect(user).to be_invalid
    end

    it 'is invalid with 256-letter mails' do
        user.name = 'a' * 244 + 'example.com'
        expect(user).to be_invalid
    end

    it 'is valid with the correct email\'s format' do
        valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                            first.last@foo.jp alice+bob@baz.cn)
        valid_addresses.each do |valid_address|
            user.mail = valid_address
            expect(user).to be_valid 
        end
    end

    it 'is invalid with the wrong mail\'s format' do
        invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com)
        invalid_addresses.each do |invalid_address|
            user.mail = invalid_address
            expect(user).to be_invalid
        end
    end

    it "is invalid with registered mail" do
        duplicate_user = user.dup
        user.save
        expect(duplicate_user).to be_invalid
    end

    it "is invalid with registered mail" do
        duplicate_user = user.dup
        duplicate_user.mail = user.mail.upcase
        user.save
        expect(duplicate_user).to be_invalid
    end

    it 'is invalid with no password' do
        user.password = user.password_confirmation = ' ' * 6
        expect(user).to be_invalid
    end
    
    it 'is invalid with 5-letter passwords' do
        user.password = user.password_confirmation = 'a' * 5
        expect(user).to be_invalid
    end

    it 'is invalid with no Animeter_id' do
        user.Animeter_id = ' '
        expect(user).to be_invalid
    end

    it 'is invalid with 51-letter Animeter_id' do
        user.Animeter_id= 'a' * 51
        expect(user).to be_invalid
    end

    it "is invalid with registered Animeter_id" do
        duplicate_user = user.dup
        user.save
        expect(duplicate_user).to be_invalid
    end

    it "is invalid with registered Animeter_id" do
        duplicate_user = user.dup
        duplicate_user.Animeter_id = user.Animeter_id.upcase
        user.save
        expect(duplicate_user).to be_invalid
    end
end