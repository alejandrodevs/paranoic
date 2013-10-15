module Paranoic
  class AttributePermission < ActiveRecord::Base
    attr_accessible :attribute_name, :bin, :class_name, :role_id

    belongs_to :role
  end
end
