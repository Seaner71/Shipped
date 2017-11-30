class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_job, only: [:edit, :update, :destroy]
  before_action :set_job, only: [:show, :edit, :update, :destroy]




    def index
      @jobs = Job.all
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @job = current_user.jobs.new
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
        @job = Job.find(params[:id])
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
      params.require(:job).permit(:origin, :destination, :price_cents, :containers_needed, :description, :name, :user_id)
    end

    def set_job
      @job = Job.find(params[:id])
    end

    def owned_job
    @job = Job.find(params[:id])
    unless current_user == @job.user
      flash[:alert] = "That job doesn't belong to you!"
      redirect_to jobs_path
    end
  end

end
