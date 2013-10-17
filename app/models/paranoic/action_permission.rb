module Paranoic
  class ActionPermission < ActiveRecord::Base
    attr_accessible :action, :class_name

    belongs_to :role
  end
end
