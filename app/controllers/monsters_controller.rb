class MonstersController < ApplicationController

	before_filter :authenticate_user
	before_filter :set_monster, except: [:index]
  
  def index
  	@monsters = current_user.monsters
  	respond_to do |format|
      format.html 
      format.json {return render json: @monsters}
    end
  end

  def new
 	end

  def create
  	if @monster.save
  		respond_to do |format|
	      format.html { redirect_to user_monsters_path(current_user)}
	      format.json {return render json: @monster}
	    end
  	else
  		render :new
  	end
  end

  def update
  	if @monster.update_attributes(monster_params)
  		respond_to do |format|
	      format.html {redirect_to user_monsters_path(current_user)}
	      format.json {return render json: @monster}
	    end
  	else
  		render :edit
  	end
  end

  def destroy
  	monster = @monster
  	@monster.destroy
  	respond_to do |format|
      format.html {redirect_to user_monsters_path(current_user)}
      format.json {return render json: monster}
    end
  end

  def add_monster_in_team
  	if @monster.update_attributes(team_id: params[:team_id])
  	  return render json: @monster.team
    else
      return render json: false
    end
  end

  private

  def monster_params
  	params.fetch(:monster, {}).permit(:name, :monster_type, :power, :descriptors, :user_id, :team_id)
  end

  def set_monster
  	@monster = params[:id].present? ? current_user.monsters.find(params[:id]) : current_user.monsters.new(monster_params)
  end
end