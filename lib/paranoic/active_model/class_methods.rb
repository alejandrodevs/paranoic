module Paranoic
  module ActiveModel
    module ClassMethods

      def define_include_method(name)
        method = "include_#{name}?".to_sym

        INCLUDE_METHODS[name] = method if paranoic_valid_attr?(name)

        unless method_defined?(method)
          define_method method do
            paranoic_attribute_permissions.include?(name.to_sym)
          end
        end
      end

    end
  end
end
