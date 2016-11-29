class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @jobs = Job.all
  end

  def show
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
  end
end
