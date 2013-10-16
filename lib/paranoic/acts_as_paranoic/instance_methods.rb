module Paranoic
  module ActsAsParanoic
    module InstanceMethods

      def sanitize_params_paranoically
        raise "You must implement the current_user method" unless self.respond_to?(:current_user)
        sanitizer = ActsAsParanoic::Sanitizer.new
        sanitizer.sanitize!(current_user, params, self.class.instance_variable_get(:@acts_as_paranoic_resource) || paranoic_resource_symbol)
      end

      def paranoic_resource_symbol
        self.controller_name.singularize.to_sym
      end

    end
  end
end
