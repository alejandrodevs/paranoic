module Paranoic
  class Role < ActiveRecord::Base
    attr_accessible :name

    has_and_belongs_to_many :attribute_permissions
    has_and_belongs_to_many :action_permissions
    has_and_belongs_to_many :job_descriptions
  end
end
