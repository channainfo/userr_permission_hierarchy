require 'rails_helper'

RSpec.describe Place, type: :model do
  describe "Place has many user" do
    it "response to #users" do
      place = Place.new
      expect(place).to respond_to(:users)
    end
  end

  
end
