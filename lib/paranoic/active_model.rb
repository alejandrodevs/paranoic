module Paranoic
  module ActiveModel
    autoload :ClassMethods, 'paranoic/active_model/class_methods'
    autoload :InstanceMethods, 'paranoic/active_model/instance_methods'

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
    end
  end
end

if defined?(ActiveModel::Serializer)
  ActiveModel::Serializer.send :include, Paranoic::ActiveModel
end
