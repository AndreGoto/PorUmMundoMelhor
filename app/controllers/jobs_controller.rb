class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :search ]
  before_action :set_job, only: [:edit, :update, :show]

  def index
    @jobs = Job.all
  end

  def search
    @jobs = Job.all
    if params[:address].present?
      @jobs = @jobs.near(params[:address], 20)
    end
    if params[:title].present?
      @jobs = @jobs.where('lower(title) LIKE ?', "%#{params[:title].downcase}%")
    end
    if params[:category].present?
      @jobs = @jobs.where(category: params[:category])
    end
    @jobs = @jobs.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@jobs) do |job, marker|
      marker.lat job.latitude
      marker.lng job.longitude
    end
    @job_coordinates = []
    @jobs.each do |job|
      @job_coordinates << { lat: job.latitude, lng: job.longitude }
    end
  end

  def show
    @job = Job.find(params[:id])
    @user = User.find(params[:id])
    @review = Review.new

    if user_signed_in?
      @job_applied = Volunteer.where(user_id: current_user.id, job_id: params[:id])
      @job_applied = Job.where(id: params[:id], user_id: current_user.id) if @job_applied.empty?
    end
    volunteers = Volunteer.where(job_id: params[:id])
    @volunteers = []
    @volunteers << User.find(@job.user_id)
    volunteers.each do |volunteer|
      @volunteers << User.find(volunteer.user_id)
    end
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

  def map
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :short_description,
                                :category, :title, :remote, :finish, :address, :date, picture: [])
  end
end
