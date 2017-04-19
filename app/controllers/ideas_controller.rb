class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      redirect_to ideas_path
    else
      redirect_to new_idea_path
    end
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :name, :likes, :members, :id)
  end

end
