require "rails_helper"

RSpec.describe TeamsController do
  before do
		@user = FactoryGirl.create(:user)
    session[:user_id] = @user
  end
  describe "#index" do
    it "has a 200 status code" do
      get :index, ({user_id: @user.id})
      expect(response.status).to eq(200)
    end
  end
  
  describe "#create" do
    it "creates a team successfully" do
    	post :create, ({user_id: @user.id, team: {name: 'test_name'}})
      expect(response.status).to eq(302)
    end

    it "create a team object" do
    	team = Team.create(name: "testing team", user_id: @user.id)
    	team.should be_an_instance_of Team
    end
  end

  describe "Edit Team" do
  	before(:each) do
			@team = @user.teams.create(:name => "dummy name")
	  end

    it "update a team successfully" do
    	put :update, ({user_id: @user.id, id: @team.id,team: {name: 'testing update'}})
      expect(response.status).to eq(302)
      expect(Team.find(@team.id).name).to eq('testing update')
    end

    it "Delete a team successfully" do
    	put :destroy, ({user_id: @user.id, id: @team.id})
      expect(response.status).to eq(302)
      expect(Team.find_by_id(@team.id)).to be_nil
    end
  end
end