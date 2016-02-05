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

require 'rails_helper'

RSpec.describe User, type: :model do

  it "belongs to a place" do
    user = create(:user)
    expect(user).to respond_to(:place)
  end

  describe "#has_permission?" do
    context "user belongs to that hierarchy" do
      it "return true" do
        place = create(:place, parent: nil)
        user  = create(:user, place: place)
        result = user.has_permission?(place)
        expect(result).to be_truthy
      end
    end

    context "user is under that hierarchy" do
      it "return true" do
        kandal = create(:place, name: 'Kandal',  parent: nil)
        ang_snourl = create(:place, name: 'Ang Snourl', parent: kandal)
        bekchan = create(:place, name: 'Bekchan', parent: ang_snourl)

        user = create(:user, place: kandal)
        result = user.has_permission?(ang_snourl)
        expect(result).to be_truthy
      end
    end

  end
end
