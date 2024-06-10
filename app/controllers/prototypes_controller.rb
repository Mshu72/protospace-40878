class PrototypesController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show] 
  before_action :move_to_index, except: [:index]
  before_action :set_prototype, only: [:edit, :show]
  
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if  @prototype.save
      redirect_to root_path
   else
    render :new, status: :unprocessable_entity
   end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id == @prototype.user_id
      
    else
      redirect_to root_path
    end
  end

  def destroy
    d_prototype = Prototype.find(params[:id])
    d_prototype.destroy
    redirect_to root_path
  end


  def update 
    if Prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  
end
