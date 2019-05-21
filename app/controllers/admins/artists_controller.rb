class Admins::ArtistsController < Admins::AdminsController
	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
		redirect_to new_admins_cd_path
		else
		@cd = Cd.new
     	 render "admins/cds/new"
   		end
	end

	def index
		@artists = Artist.all
	end

	def edit
	end

	def update
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy
		redirect_to new_admins_cd_path
	end

	private
		def artist_params
			params.require(:artist).permit(:artist_name)
		end


end
