FactoryGirl.define do
  sequence :email do |n|
    "somebody#{n}@example.com"
  end

  sequence :title do |n|
    "Title ##{n}"
  end

  sequence :content do |n|
    "Lorem ipsum #{n}"
  end
end
