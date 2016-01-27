module UserPermissionHierarchy
  module HierarchyContainer
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def hierarchy_container_for(active_record_class)
        p "loading builder container: -------- #{active_record_class}"
        active_record_class = active_record_class.to_s

        refs_name = active_record_class.pluralize.to_sym
        container_name = self.to_s.underscore.to_sym
        p "reference refs: #{refs_name}, container: #{container_name} "

        ref_class = active_record_class.classify.constantize
        container_class = self

        p "current class: #{container_class} has many #{refs_name}"
        p "reference class: #{ref_class} belongs_to #{container_name}"

        container_class.send :has_many, refs_name
        container_class.send :has_ancestry

        ref_class.send :belongs_to, container_name

        ref_class.class_eval do
          def has_permission?(container_object)
            if self.send(container_name) == container_object
              return true
            else
              false
            end
          end
        end

      end
    end
  end
end

ActiveRecord::Base.send(:include, UserPermissionHierarchy::HierarchyContainer)
