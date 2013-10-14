module Paranoic
  module ActsAsParanoic
    class Sanitizer

      def sanitize! params, resource
        attributes_allowed = attributes_allowed_for(resource)

        params[resource].each do |key, val|
          params[resource].delete(key) unless attributes_allowed.include?(key)
        end
      end

      def attributes_allowed_for resource
      end

    end
  end
end
