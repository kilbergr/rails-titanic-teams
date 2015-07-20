class TeamsController < ApplicationController

	before_action :find_team, only: [:show, :edit, :update, :destroy]
	before_action :find_user, only: [:index, :new, :create]
  before_action :confirm_logged_in, only: [:new, :show, :edit, :destroy]

  
  def index
    @teams = Team.all
  end

  def new
  	@team = Team.new
    @superheros = Superhero.all
  end

  def create
  	@team = @user.teams.build(team_params)
      if @team.save
        redirect_to user_teams_path(@user), notice: "Success! Team Created"
      else
        render :new
      end
  end

  def show
    @team_superheros = @team.superheros
  end

  def edit
    @superheros = Superhero.all
  end

  def update
  	@team.update team_params
  	if @team.save
  		redirect_to team_path(@team), notice: "Success! Team Updated!"
  	else 
  		render :edit
  	end
  end

  def destroy
  	if @team.destroy
  		redirect_to users_path, alert: "Team Destroyed"
  	else
  		render :show
  	end
  end

  private 
  def team_params
  	params.require(:team).permit(:name, :description, :superhero_ids => [])
  end

  def find_team
  	@team = Team.find_by_id(params[:id])
  end

  def find_user
  	@user = User.find_by_id(params[:user_id])
  end
end
