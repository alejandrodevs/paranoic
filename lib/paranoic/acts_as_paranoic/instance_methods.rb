module Paranoic
  module ActsAsParanoic
    module InstanceMethods

      def sanitize_params_paranoically
        key = self.class.instance_variable_get(:@acts_as_paranoic_resource) || paranoic_resource_symbol
        sanitizer = ActsAsParanoic::Sanitizer.new
        sanitizer.sanitize!(current_user, params, key, self.class)
      end

      def paranoid_access
        accessor = ActsAsParanoic::ParanoidAccess.new
        if current_user && !accessor.valid?(current_user, self.class, params[:action])
          respond_to do |format|
            format.html{ render :json => 'Method not allowed', :status => 405 }
            format.json{ render :json => 'Method not allowed', :status => 405 }
          end
        end
      end

      def paranoic_resource_symbol
        self.controller_name.singularize.to_sym
      end

    end
  end
end
