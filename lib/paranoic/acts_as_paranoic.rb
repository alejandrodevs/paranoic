module Paranoic
  module ActsAsParanoic
    autoload :Sanitizer, 'paranoic/acts_as_paranoic/sanitizer'

    def acts_as_paranoic *args
      @acts_as_paranoic_options  = args.extract_options!
      @acts_as_paranoic_resource = args.last
      @acts_as_paranoic = true
      before_filter :sanitize_params_paranoically
    end

    def acts_as_paranoic?
      @acts_as_paranoic
    end

    def sanitize_params_paranoically
      sanitizer = Sanitizer.new
      sanitizer.sanitize!(params, @acts_as_paranoic_resource)
    end

  end
end

if defined?(ActionController::Base)
  ActionController::Base.extend Paranoic::ActsAsParanoic
end
