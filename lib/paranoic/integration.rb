if defined?(ActiveModel::Serializer)
  ActiveModel::Serializer.class_eval do

    def include?(name)
      return false if @options.key?(:only) && !Array(@options[:only]).include?(name)
      return false if @options.key?(:except) && Array(@options[:except]).include?(name)
      return false if !paranoic_attribute_permissions.include?(name.to_sym) && name.to_sym != :id
      send ActiveModel::Serializer::INCLUDE_METHODS[name]
    end

    def paranoic_attribute_permissions
      @paranoic_attribute_permissions ||= begin
        current_user.readable_attribute_permissions_for(self.class)
      end
    end

  end
end

if defined?(ActionController::Base)
  ActionController::Base.send(:include, Paranoic::ActsAsParanoic)
end
