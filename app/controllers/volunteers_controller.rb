class VolunteersController < ApplicationController
  def create
    @volunteer = Volunteer.new
    @volunteer.user_id = current_user.id
    @volunteer.job_id = params[:job_id]
    @volunteer.status  = "aguardando"

    job_volunteers = Volunteer.where(job_id: params[:job_id])
    job_volunteers.each do |volunteer|
      if ( @volunteer.user_id == volunteer.user_id )
        redirect_to dashboard_index_path
        return
      end
    end

    if @volunteer.save
      redirect_to dashboard_index_path
    else
      redirect_to jobs_path
    end
  end
end
