module Paranoic
  module ActsAsParanoic
    autoload :Sanitizer,        'paranoic/acts_as_paranoic/sanitizer'
    autoload :ClassMethods,     'paranoic/acts_as_paranoic/class_methods'
    autoload :InstanceMethods,  'paranoic/acts_as_paranoic/instance_methods'
    autoload :ParanoidAccess,   'paranoic/acts_as_paranoic/paranoid_access'

    def self.included base
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

  end
end
