class Place < ActiveRecord::Base
  hierarchy_container_for(:user)
end
