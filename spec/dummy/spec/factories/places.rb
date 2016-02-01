# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  kind_of    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string(255)
#

FactoryGirl.define do
  factory :place do
    name "MyString"
code "MyString"
kind_of "MyString"
ancestry "MyString"
  end

end
