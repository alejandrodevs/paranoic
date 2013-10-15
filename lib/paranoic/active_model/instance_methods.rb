module Paranoic
  module ActiveModel
    module InstanceMethods

      def paranoic_attribute_permissions
        @paranoic_attribute_permissions ||= begin
          current_user.readable_attribute_permissions_for(object.class.model_name)
        end
      end

    end
  end
end
