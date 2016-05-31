class EpisodesController < ApplicationController
	before_action :find_user
	before_action :find_episode, only: [:show]


	def new
		@episode = @user.episodes.new
	end

	def create
		@episode = @user.episodes.new params_episode
		if @episode.save
			redirect_to user_episode_path(@user, @episode) #episode/show 
		else
			render 'new'
		end
	end

	def show
		@episodes = Episode.where(user_id: @user).order("created_at DESC").reject { |e| e.id == @episode.id }
	end


private

	def params_episode
		params.require(:episode).permit(:title, :description)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_episode
		@episode = Episode.find(params[:id])
	end

end
