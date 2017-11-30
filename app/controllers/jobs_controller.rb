class JobsController < ApplicationController
  before_action :authenticate_user!


    def index
      @jobs = Job.all
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @job = Job.new
    end

    def create
      @job = current_user.jobs.new(job_params)
      if @job.save
        redirect_to jobs_path
      else
        render 'new'
      end
      end

      def edit
        @jobs = Job.find(params[:id])
      end

      def update
        @job = Job.find(params[:id])
        if @job.update(job_params)
        redirect_to @job
      else
        render 'edit'
      end
    end

      def destroy
        @job = Job.find(params[:id])
        @job.destroy
        redirect_to jobs_path
      end

    private

    def job_params
      params.require(:job).permit(:origin, :destination, :price_cents, :containers_needed, :description, :name)
    end
  end
