class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_job, only: [:edit, :update, :show]
  def index
    @jobs = Job.all
  end

  def search
    @jobs = Job.all
    if params[:title].present?
      @jobs = @jobs.where('lower(title) LIKE ?', "%#{params[:title].downcase}%")
    end
    if params[:category].present?
      @jobs = @jobs.where(category: params[:category])
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_coordinates = { lat: @job.latitude, lng: @job.longitude }
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      flash[:notice] = "Mandou bem, sua nova causa social foi criada!"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:notice] = "Pronto! Sua causa já está atualizada."
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :short_description,
                                :category, :title, :remote, :finish, :address, :date, picture: [])
  end
end
