FactoryGirl.define do 
  factory :user do |f|
    f.provider "facebook"
    f.name "test user"
  end
  # trait :with_invitaion do
  #   after :create do |post|
  #     FactoryGirl.create_list :invitation, 1, :post => post
  #   end
  # end
end