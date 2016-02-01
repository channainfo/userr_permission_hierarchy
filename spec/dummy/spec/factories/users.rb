# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  username             :string(255)
#  name                 :string(255)
#  password_digest      :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  email                :string(255)
#  phone                :string(255)
#  role                 :string(255)
#  place_id             :integer
#  phone_without_prefix :string(255)
#  phd_id_id            :integer
#  phd_id               :integer
#  od_id                :integer
#  channels_count       :integer
#

FactoryGirl.define do
  factory :user do
    username "MyString"
    name "MyString"
    phone "MyString"
    place_id "MyString"
    email "MyString"
    password_digest "MyString"
  end

end
