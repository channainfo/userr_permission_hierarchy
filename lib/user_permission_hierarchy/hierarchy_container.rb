module UserPermissionHierarchy
  module HierarchyContainer
    extend ActiveSupport::Concern

    module ClassMethods
      def hierarchy_container_for(user_name)
        user = user_name.to_s
        user_names = user.pluralize.to_sym
        place_name = self.to_s.underscore.to_sym

        user_class = user.classify.constantize
        place_class = self

        place_class.send :has_many, user_names
        place_class.send :has_ancestry

        user_class.send :belongs_to, place_name

        user_class.class_eval do
          define_method(:"has_permission?") do |place_object|
            place_hierarchy_object =  self.send(place_name)
            return true if place_hierarchy_object == place_object
            return true if place_object.path_ids.include?(place_hierarchy_object.id)
            return false
          end
        end
        include UserPermissionHierarchy::HierarchyContainer::LocalInstanceMethods
      end

    end

    module LocalInstanceMethods
      def allow?(user_object)
        user_object.has_permission?(self)
      end
    end
  end
end

ActiveRecord::Base.send(:include, UserPermissionHierarchy::HierarchyContainer)
