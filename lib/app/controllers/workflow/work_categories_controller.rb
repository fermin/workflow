module Workflow
  class WorkCategoriesController < Workflow::ApplicationController

  	before_filter :set_work_category, only: [:show, :edit, :update, :destroy]

  	def index
      @work_categories = WorkCategory.all
    end

    def new
      @work_category = WorkCategory.new
    end

    def create
      @work_category = WorkCategory.new(work_category_params)
      if @work_category.save
        flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_categories, :create])
        redirect_to work_categories_url
      else
        render :new
      end
    end

    def update
      if @work_category.update_attributes(work_category_params)
        flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_categories, :update])
        redirect_to work_categories_url
      else
        render :edit
      end
    end

    def destroy
      flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_categories, :destroy]) if @work_category.destroy
      redirect_to work_categories_url
    end

    private

    def set_work_category
    	@work_category = WorkCategory.find params[:id]
    end

    def work_category_params
    	if params.respond_to?(:permit!)
        params.require(:work_category).permit!
      else
        params[:work_category].slice(:name, :column_name) rescue nil
      end
    end

  end
end