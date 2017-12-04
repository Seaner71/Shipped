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
      boat_cap
      update_capacity
       if @job.save && boat_cap
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
        redirect_to job_url(@job)
      else
        render 'edit'
      end
    end

      def destroy
        @job = Job.find(params[:id])
        @job.destroy
        redirect_to '/'
      end
      def boat_cap
        total_cap = 0
        @job.boat_ids.each do |b|
          total_cap += Boat.find_by_id(b).container_capacity
        end
          total_cap > @job.containers_needed ? true : false
        end

      def update_capacity
        cap_need = @job.containers_needed
        boats = @job.boat_ids
          for i in 0..boats.length
            break if cap_need == 0
              if cap_need < Boat.find_by_id(boats[i]).container_capacity
                 cap_reduce = cap_need
                 Boat.find_by_id(boats[i]).update_attributes(container_capacity: (Boat.find_by_id(boats[i]).container_capacity - cap_need))
              else
                cr = Boat.find_by_id(boats[i]).container_capacity
                Boat.find_by_id(boats[i]).update_attributes(container_capacity: 0)
              end
               cap_need -= cap_reduce
          end
              return boats
      end

    private

    def job_params
      params.require(:job).permit(:origin, :destination, :price_cents, :containers_needed, :description, :name, :user_id, boat_ids:[])
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
