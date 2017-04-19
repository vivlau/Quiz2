class ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def edit
    @review = Review.find(params[:idea_id])
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:idea_id])
    @review = @idea.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to idea_path(@idea), notice: "Idea Updated"
    else
      render :edit
    end
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @review = Review.new(review_params)
    @review.idea = @idea
    if @review.save
      # render flash
      redirect_to idea_path(@review.idea)
    else
      # flash errors
      render 'ideas/show'
    end
  end

  def show
    @idea = Idea.find(params[:idea_id])
    @review = @idea.reviews.find(params[:id])
    # @review.update()
    redirect_to @idea
  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    @review = @idea.reviews.find(params[:id])
    @review.destroy
    redirect_to idea_path(@idea)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :body, :idea_id)
  end

end
