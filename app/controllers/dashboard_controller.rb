class DashboardController < ApplicationController
  def index
    volunteer_jobs = Volunteer.where(user_id: current_user.id)
    @dashboard = []
    volunteer_jobs.each do |volunteer|
      job = Job.find(volunteer.job_id)
      qty = Volunteer.where(job_id: volunteer.job_id)
      # job[:qty] = qty.count
      @dashboard << job
    end
    @dashboard
  end
end
