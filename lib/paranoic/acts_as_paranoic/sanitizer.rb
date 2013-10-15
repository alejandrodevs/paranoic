module Paranoic
  module ActsAsParanoic
    class Sanitizer

      def sanitize! user, params, resource
        # Gets params that will be sanitized.
        params = params[resource]

        # Deletes from resource suffixes like :attributes and :ids
        class_name = get_resource_class(resource)

        # Returns an array with the allowed attributes for user and resource
        # that were passed by param.
        params_allowed = attributes_allowed_for(user, class_name)

        if params.is_a?(Hash)
          sanitize_params_for(user, params, params_allowed)
        end

        if params.is_a?(Array)
          params.each do |params_item|
            sanitize_params_for(user, params_item, params_allowed)
          end
        end
      end

      private

      # Removes the params that are not allowed. Removes keys that are not
      # included in attributes_allowed for the user.
      def sanitize_params_for user, params, params_allowed
        params.each do |key, val|
          if params_allowed.include?(key)
            if [:ids, :attributes].include?(key.to_s.split("_").last.to_sym)
              sanitize!(user, params, key)
            end
          else
            params.delete(key)
          end
        end
      end

      # Gets the class name to this resource. Removes 'attributes' and 'ids'.
      def get_resource_class resource
      end

      # Gets the attributes allowed for the user and resource passed by param.
      # The attributes allowed should be in the attribute_permissions table in
      # the database.
      def attributes_allowed_for user, resource
      end

    end
  end
end
