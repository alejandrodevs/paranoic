if defined?(ActiveModel::Serializer)
  ActiveModel::Serializer.send(:include, Paranoic::ActiveModel::Serializer)
end

if defined?(ActionController::Base)
  ActionController::Base.send(:include, Paranoic::ActsAsParanoic)
end

if defined?(User)
  User.send(:include, Paranoic::Methods)
end
