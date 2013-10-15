module Paranoic
  module ActiveModel
    module Serializer

      def define_include_method(name)
        method = "include_#{name}?".to_sym

        INCLUDE_METHODS[name] = method if paranoic_valid_attr?(name)

        unless method_defined?(method)
          define_method method do
            true
          end
        end
      end

      private

      # THIS METHOD NEEDS A REFACTOR.
      def paranoic_valid_attr? attr
        current_user.roles.includes(:attribute_permissions).
          map(&:attribute_permissions).flatten.
          select{ |e| model_class.to_s == e.class_name && e.bin == 4 }.
          map{ |e| e.attribute_name.to_sym }.include?(attr.to_sym)
      end

      def current_user
        @current_user ||= ActionController::Base.new.current_user
      end

    end
  end
end
