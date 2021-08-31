class NodesController < ApplicationController
    before_action :set_organization
    before_action :set_node, only: [:show, :edit, :update, :destroy]
    
    def show
        @child_node = Node.new
    end

    def new
        @node = Node.new
    end

    def create
        @node = @organization.nodes.create(node_params)
        if @node.save
            redirect_to organization_path(@organization), notice: "node created"
        else
            redirect_to organization_path(@organization), alert: "#{@node.errors.full_messages}"
        end
    end

    def edit
    end

    def update
        @node.update(node_params)
        if @node.save
            redirect_to organization_path(@organization), notice: "node updated"
        else
            redirect_to organization_path(@organization), alert: "#{@node.errors.full_messages}"
        end
    end

    def destroy
        if @node.destroy
            redirect_to organization_path(@organization), notice: "node destroyed"
        end
    end

    private

    def set_organization
        @organization = Organization.find(params[:organization_id])
    end

    def set_node
        @node = Node.find(params[:id])
    end

    def node_params
        params.require(:node).permit(:name, :parent_node_id)
    end
end
