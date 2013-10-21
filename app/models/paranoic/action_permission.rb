module Paranoic
  class ActionPermission < ActiveRecord::Base
    attr_accessible :action, :class_name

    has_and_belongs_to_many :roles
  end
end
