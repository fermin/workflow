module Workflow
  class WorkItemsController < Workflow::ApplicationController

  	before_filter :set_work_item, only: [:show, :edit, :update, :destroy]

  	def index
      @work_items = WorkItem.all
    end

    def new
      @work_item = WorkItem.new
    end

    def create
      @work_item = WorkItem.new(work_item_params)
      if @work_item.save
        flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_items, :create])
        redirect_to work_items_url
      else
        render :new
      end
    end

    def update
      if @work_item.update_attributes(work_item_params)
        flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_items, :update])
        redirect_to work_items_url
      else
        render :edit
      end
    end

    def destroy
      flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_items, :destroy]) if @work_item.destroy
      redirect_to work_items_url
    end

    private

    def set_work_item
    	@work_item = WorkItem.find params[:id]
    end

    def work_item_params
    	if params.respond_to?(:permit!)
        params.require(:work_item).permit!
      end
    end

  end
end