module Paranoic
  module ActsAsParanoic
    class Sanitizer

      def sanitize! user, params, resource, class_name
        # Gets params that will be sanitized.
        params = params[resource]

        # Deletes from resource suffixes like :attributes and :ids
        #class_name = get_resource_class(resource)

        # Returns an array with the allowed attributes for user and resource
        # that were passed by param.
        allowed_params = user.writable_attribute_permissions_for(class_name.to_s) rescue []

        if params.is_a?(Hash)
          sanitize_params_for(user, params, allowed_params)
        end

        if params.is_a?(Array)
          params.each do |params_item|
            if params_item.is_a?(Hash)
              sanitize_params_for(user, params_item, allowed_params)
            end
          end
        end
      end

      private

      # Removes the params that are not allowed. Removes keys that are not
      # included in attributes_allowed for the user.
      def sanitize_params_for user, params, allowed_params
        params.each do |key, val|
          #if allowed_params.include?(key)
            #sanitize!(user, params, key) if key =~ /_attributes|_ids$/
          #else
            #params.delete(key)
          #end
          params.delete(key) unless allowed_params.include?(key.to_sym)
        end
      end

      # Gets the class name to this resource. Removes 'attributes' and 'ids'.
      #def get_resource_class resource
        #resource_class = resource.to_s.gsub(/_attributes|_ids$/, "")
        #resource_class.singularize.camelcase
      #end

    end
  end
end
