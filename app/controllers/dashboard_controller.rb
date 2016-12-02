class DashboardController < ApplicationController
  def index
    volunteer_jobs = Volunteer.where(user_id: current_user.id)
    @jobs_progress = []
    @jobs_ended = []
    @jobs_created = Job.where(user_id: current_user.id, finish: false)
    volunteer_jobs.each do |volunteer|
      job = Job.find(volunteer.job_id)
      if job.finish
        @jobs_ended << job
      else
        @jobs_progress << job
      end
    end
    @jobs_ended += Job.where(user_id: current_user.id, finish: true)
  end
end
