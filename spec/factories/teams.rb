FactoryGirl.define do 
  factory :team do |f|
    f.name "testing team name"
  end
  # trait :with_invitaion do
  #   after :create do |post|
  #     FactoryGirl.create_list :invitation, 1, :post => post
  #   end
  # end
end