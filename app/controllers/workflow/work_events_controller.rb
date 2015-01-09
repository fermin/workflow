module Workflow
  class WorkEventsController < Workflow::ApplicationController

  	before_filter :set_work_event, only: [:show, :edit, :update, :destroy]

  	def index
      @work_events = WorkEvent.all
    end

    def new
      @work_event = WorkEvent.new
    end

    def create
      @work_event = WorkEvent.new(work_event_params)
      if @work_event.save
        flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_events, :create])
        redirect_to work_events_url
      else
        render :new
      end
    end

    def update
      if @work_event.update_attributes(work_event_params)
        flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_events, :update])
        redirect_to work_events_url
      else
        render :edit
      end
    end

    def destroy
      flash[:notice] = I18n.t(:notice, scope: [:workflow, :flash, :work_events, :destroy]) if @work_event.destroy
      redirect_to work_events_url
    end

    private

    def set_work_event
    	@work_event = WorkEvent.find params[:id]
    end

    def work_event_params
    	if params.respond_to?(:permit!)
        params.require(:work_event).permit!
      end
    end

  end
end