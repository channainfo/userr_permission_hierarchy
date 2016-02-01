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

class Place < ActiveRecord::Base
  hierarchy_container_for(:user)
end
