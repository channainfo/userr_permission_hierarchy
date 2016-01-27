module UserPermissionHierarchy
  module HierarchyUser
    extend ActiveSupport::Concern

    included do
    end

    

  end
end

class ActiveRecord::Base
  include UserPermissionHierarchy::HierarchyUser
end
