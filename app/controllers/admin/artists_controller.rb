class Admin::ArtistsController < ApplicationController

	def new
		@artist = Artsit.new
	end
end
