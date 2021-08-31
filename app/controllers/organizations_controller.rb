class OrganizationsController < ApplicationController
    before_action :set_organization, only: [:show, :edit, :update]
    def index
        @organizations = Organization.all
    end

    def show
    end

    def new
        @organization = Organization.new
    end

    def create
        @organization = Organization.create(organization_params)
        if @organization.save
            redirect_to organizations_path, notice: "organization created"
        else
            redirect_to organizations_path, alert: "#{@organization.errors.full_messages}"
        end
    end

    def edit
    end

    def update
        @organization.update(organization_params)
        if @organization.save
            redirect_to organizations_path, notice: "organization updated"
        else
            redirect_to organizations_path, alert: "#{@organization.errors.full_messages}"
        end
    end

    private

    def set_organization
        @organization = Organization.find(params[:id])
    end

    def organization_params
        params.require(:organization).permit(:name)
    end
end
