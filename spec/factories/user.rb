FactoryBot.define do
    factory :user do
        sequence(:Animeter_id) { |n| "test#{n}" }
        name { "TestUser" }
        sequence(:mail) { |n| "test#{n}@example.com" } 
        password { "foobar" }
        password_confirmation { "foobar" }
        img {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/factories/img/test.jpeg"),"image/jpeg")}
    end
end