module Paranoic
  module ActsAsParanoic
    class ParanoidAccess

      def valid? user, controller, action
        user.action_permissions_for(controller).include?(action.to_sym)
      end

    end
  end
end
