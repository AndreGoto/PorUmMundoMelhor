class ReviewsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @review = Review.new(review_params)
    @review.job = @job
    @review.user_id = current_user.id

    if @review.save
      respond_to do |format|
        format.html { redirect_to job_path(@job) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'jobs/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
