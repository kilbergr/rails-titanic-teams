class SuperherosController < ApplicationController
  before_action :current_user
	before_action :confirm_logged_in, only: [:new, :show, :edit, :destroy]
  before_action :current_admin, only: [:new, :edit, :destroy]
  before_action :find_superhero, only: [:show, :edit, :update, :destroy]

  def index
  	@superheros = Superhero.all
  end
  
  def new
    @superhero = Superhero.new
  end

  def create
  	@superhero = Superhero.create(superhero_params)
  	if @superhero.save
  		redirect_to superheros_path, notice: "Success! Superhero Created"
  	else 
  		render :new, alert: "Oops! There was an error creating this superhero"
  	end
  end

  def show
  	@superhero_teams = @superhero.teams
  end

  def edit
  end

  def update
  	@superhero.update(superhero_params)
  	if @superhero.save
  		redirect_to superhero_path(@superhero), notice: 'This superhero has been updated!'
  	else
  		render :edit, alert: "Oops! There was an error updating this superhero"
  	end
  end

  def destroy
  	if @superhero.destroy
  		redirect_to superheros_path, alert: "Superhero vanquished"
  	else 
  		render :show, alert: "Oops! There was an error deleting this superhero"
 		end
  end

  private 
  	def superhero_params
  		params.require(:superhero).permit(:name, :height, :bio, :image_url, :team_ids => [])
  	end

  	def find_superhero
  		@superhero = Superhero.find_by_id(params[:id])
  	end
end
