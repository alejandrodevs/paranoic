require_dependency "paranoic/application_controller"

module Paranoic
  class ActionPermissionsController < ApplicationController
    # GET /action_permissions
    # GET /action_permissions.json
    def index
      @action_permissions = ActionPermission.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @action_permissions }
      end
    end
  
    # GET /action_permissions/1
    # GET /action_permissions/1.json
    def show
      @action_permission = ActionPermission.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @action_permission }
      end
    end
  
    # GET /action_permissions/new
    # GET /action_permissions/new.json
    def new
      @action_permission = ActionPermission.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @action_permission }
      end
    end
  
    # GET /action_permissions/1/edit
    def edit
      @action_permission = ActionPermission.find(params[:id])
    end
  
    # POST /action_permissions
    # POST /action_permissions.json
    def create
      @action_permission = ActionPermission.new(params[:action_permission])
  
      respond_to do |format|
        if @action_permission.save
          format.html { redirect_to @action_permission, notice: 'Action permission was successfully created.' }
          format.json { render json: @action_permission, status: :created, location: @action_permission }
        else
          format.html { render action: "new" }
          format.json { render json: @action_permission.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /action_permissions/1
    # PUT /action_permissions/1.json
    def update
      @action_permission = ActionPermission.find(params[:id])
  
      respond_to do |format|
        if @action_permission.update_attributes(params[:action_permission])
          format.html { redirect_to @action_permission, notice: 'Action permission was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @action_permission.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /action_permissions/1
    # DELETE /action_permissions/1.json
    def destroy
      @action_permission = ActionPermission.find(params[:id])
      @action_permission.destroy
  
      respond_to do |format|
        format.html { redirect_to action_permissions_url }
        format.json { head :no_content }
      end
    end
  end
end
