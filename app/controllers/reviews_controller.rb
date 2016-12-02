class ReviewsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @review = Review.new(review_params)
    @review.job = @job
    if @job.save
      redirect_to job_path(@job)
    else
      render 'jobs/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
