module UserPermissionHierarchy
  module HierarchyContainer
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def hierarchy_container_for(active_record_class)
        active_record_class = active_record_class.to_s

        refs_name = active_record_class.pluralize.to_sym
        container_name = self.to_s.underscore.to_sym

        ref_class = active_record_class.classify.constantize
        container_class = self

        container_class.send :has_many, refs_name
        container_class.send :has_ancestry

        ref_class.send :belongs_to, container_name

        ref_class.class_eval do
          define_method(:"has_permission?") do |container_object|
            ref_hierarchy_object =  self.send(container_name)
            return true if ref_hierarchy_object == container_object
            return true if container_object.path_ids.include?(ref_hierarchy_object.id)
            return false
          end
        end

      end
    end
  end
end

ActiveRecord::Base.send(:include, UserPermissionHierarchy::HierarchyContainer)
