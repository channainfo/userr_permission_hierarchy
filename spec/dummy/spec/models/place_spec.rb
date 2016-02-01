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

require 'rails_helper'

RSpec.describe Place, type: :model do
  describe "Place has many user" do
    it "response to #users" do
      place = Place.new
      expect(place).to respond_to(:users)
    end
  end
end
