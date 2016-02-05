module UserPermissionHierarchy
  module HierarchyUser
    extend ActiveSupport::Concern
  end
end

class ActiveRecord::Base
  include UserPermissionHierarchy::HierarchyUser
end
