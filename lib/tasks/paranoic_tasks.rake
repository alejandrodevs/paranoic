namespace :paranoic do
  namespace :attribute_permissions do

    desc "Generates writable attributes"
    task :writable => :environment do
      Rails.application.eager_load!

      controllers.each do |controller|
        model = controller.controller_name.classify.constantize rescue nil
        accessible_attributes_for(model).each do |attr|
          class_name = controller.name.sub(/Controller$/, '').singularize
          create_attribute_permission(class_name, attr, 2)
        end
      end
    end

    desc "Generates readable attributes"
    task :readable => :environment do
      Rails.application.eager_load!

      serializers.each do |serializer|
        serializable_attributes_for(serializer).each do |attr|
          create_attribute_permission(serializer, attr, 4)
        end
      end
    end
  end

  namespace :action_permissions do

    desc "Generates action permissions"
    task :create => :environment do
      Rails.application.eager_load!

      controllers.each do |controller|
        controller.action_methods.each do |action|
          create_action_permission(controller, action)
        end
      end
    end
  end
end

def controllers
  ApplicationController.descendants
end

def serializers
  ActiveModel::Serializer.descendants
end

def accessible_attributes_for model
  Array(model.accessible_attributes).keep_if{ |attr| attr.present? } rescue []
end

def serializable_attributes_for serializer
  (serializer._attributes.keys + serializer._associations.keys) rescue []
end

def create_action_permission controller, action
  Paranoic::ActionPermission.create(class_name: controller.to_s, action: action)
end

def create_attribute_permission class_name, attr, bin
  Paranoic::AttributePermission.create(class_name: class_name.to_s, attribute_name: attr.to_s, bin: bin.to_i)
end
