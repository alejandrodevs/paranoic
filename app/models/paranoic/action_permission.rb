module Paranoic
  class ActionPermission < ActiveRecord::Base
    attr_accessible :action, :class_name, :role_id

    belongs_to :role
  end
end
