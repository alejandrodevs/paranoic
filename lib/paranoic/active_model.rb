module Paranoic
  module ActiveModel

    def include?(name)
      return false if @options.key?(:only) && !Array(@options[:only]).include?(name)
      return false if @options.key?(:except) && Array(@options[:except]).include?(name)
      return false if !paranoic_attribute_permissions.include?(name.to_sym)
      send INCLUDE_METHODS[name]
    end

    def paranoic_attribute_permissions
      @paranoic_attribute_permissions ||= begin
        current_user.readable_attribute_permissions_for(object.class.model_name)
      end
    end

  end
end
