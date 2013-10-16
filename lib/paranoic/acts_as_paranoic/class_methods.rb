module Paranoic
  module ActsAsParanoic
    module ClassMethods

      def acts_as_paranoic *args
        @acts_as_paranoic_options  = args.extract_options!
        @acts_as_paranoic_resource = args.last
        @acts_as_paranoic = true
        before_filter :sanitize_params_paranoically
      end

      def acts_as_paranoic?
        @acts_as_paranoic
      end

    end
  end
end
