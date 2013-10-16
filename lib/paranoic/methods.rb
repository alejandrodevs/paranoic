module Paranoic
  module Methods

    def readable_attribute_permissions_for class_name
      attribute_permissions_for(class_name, 4)
    end

    def writable_attribute_permissions_for class_name
      attribute_permissions_for(class_name, 2)
    end

    def readable_attribute_permission? class_name, attr
      readable_attribute_permissions_for(class_name).include?(attr)
    end

    def writable_attribute_permission? class_name, attr
      writable_attribute_permissions_for(class_name).include?(attr)
    end

    def attribute_permissions_for class_name, bin
      self.roles.includes(:attribute_permissions).
        map(&:attribute_permissions).flatten.
        select{ |e| class_name.to_s == e.class_name && e.bin == bin }.
        map{ |e| e.attribute_name.to_sym }
    end

  end
end
