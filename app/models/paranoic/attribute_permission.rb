module Paranoic
  class AttributePermission < ActiveRecord::Base
    attr_accessible :attribute_name, :bin, :class_name

    has_and_belongs_to_many :roles
  end
end
