require_dependency "paranoic/application_controller"

module Paranoic
  class AttributePermissionsController < ApplicationController
    # GET /attribute_permissions
    # GET /attribute_permissions.json
    def index
      @attribute_permissions = AttributePermission.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @attribute_permissions }
      end
    end
  
    # GET /attribute_permissions/1
    # GET /attribute_permissions/1.json
    def show
      @attribute_permission = AttributePermission.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @attribute_permission }
      end
    end
  
    # GET /attribute_permissions/new
    # GET /attribute_permissions/new.json
    def new
      @attribute_permission = AttributePermission.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @attribute_permission }
      end
    end
  
    # GET /attribute_permissions/1/edit
    def edit
      @attribute_permission = AttributePermission.find(params[:id])
    end
  
    # POST /attribute_permissions
    # POST /attribute_permissions.json
    def create
      @attribute_permission = AttributePermission.new(params[:attribute_permission])
  
      respond_to do |format|
        if @attribute_permission.save
          format.html { redirect_to @attribute_permission, notice: 'Attribute permission was successfully created.' }
          format.json { render json: @attribute_permission, status: :created, location: @attribute_permission }
        else
          format.html { render action: "new" }
          format.json { render json: @attribute_permission.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /attribute_permissions/1
    # PUT /attribute_permissions/1.json
    def update
      @attribute_permission = AttributePermission.find(params[:id])
  
      respond_to do |format|
        if @attribute_permission.update_attributes(params[:attribute_permission])
          format.html { redirect_to @attribute_permission, notice: 'Attribute permission was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @attribute_permission.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /attribute_permissions/1
    # DELETE /attribute_permissions/1.json
    def destroy
      @attribute_permission = AttributePermission.find(params[:id])
      @attribute_permission.destroy
  
      respond_to do |format|
        format.html { redirect_to attribute_permissions_url }
        format.json { head :no_content }
      end
    end
  end
end
