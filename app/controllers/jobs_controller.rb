class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_job, only: [:edit, :update, :show]
  def index
    @jobs = Job.all
  end

  def show
    user_id_job = @job.user_id
    @user = User.find(user_id_job)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new
  end

  def edit
  end

  def update
    @job.update(job_params)
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :short_description,
                                :category, :title, :remote, :finish, :address, :date)
  end
end
