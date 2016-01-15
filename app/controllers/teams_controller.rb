class TeamsController < ApplicationController
	before_filter :authenticate_user
	before_filter :set_team, except: [:index]
  
  def index
  	@teams = current_user.teams
  	respond_to do |format|
      format.html 
      format.json {return render json: @teams}
    end
  end

  def new
 	end

  def create
  	if @team.save!
  		respond_to do |format|
	      format.html { redirect_to user_teams_path(current_user)}
	      format.json {return render json: @team}
	    end
  	else
  		render :new
  	end
  end

  def update
  	if @team.update_attributes(team_params)
  		respond_to do |format|
	      format.html {redirect_to user_teams_path(current_user)}
	      format.json {return render json: @team}
	    end
  	else
  		render :edit
  	end
  end

  def destroy
  	team = @team
  	@team.destroy
  	respond_to do |format|
      format.html {redirect_to user_teams_path(current_user)}
      format.json {return render json: team}
    end
  end

  private

  def team_params
  	params.fetch(:team, {}).permit(:name, :user_id)
  end

  def set_team
  	@team = params[:id].present? ? current_user.teams.find(params[:id]) : current_user.teams.new(team_params)
  end
end
