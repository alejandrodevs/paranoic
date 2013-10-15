module Paranoic
  module ActiveModel
    autoload :Serializer, 'paranoic/active_model/serializer'
  end
end

if defined?(ActiveModel::Serializer)
  ActiveModel::Serializer.extend Paranoic::ActiveModel::Serializer
end
