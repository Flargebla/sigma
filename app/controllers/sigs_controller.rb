class SigsController < ApplicationController
	
    before_filter :authenticate_user, :only =>[:new,:create]

	def index
		@sigs = Sig.all
		begin
			@current_user = User.find(session[:user_id])
		rescue
			@current_user = :guest
		end
	end

	def like
		@sig = Sig.find(params[:id])
		@sig.likes += 1
		@sig.save
		redirect_to @sig
	end

	def connect
		# Add a check to throw message if edge already exists
		@edge = Edge.new(1,params[:id])
		@edge.save
	end
	
	def show
		@sig = Sig.find(params[:id])
		
		begin
			@user_sigs = User.find(session[:user_id]).sigs
		rescue
			@user_sigs = :guest
		end
	end

	def destroy
		Sig.destroy(params[:id])
	end
	
	def new
		begin
			@current_user = User.find(session[:user_id])
		rescue
			@current_user = :guest
		end	
	end

	def create
		@sig = Sig.new(params.require(:sig).permit(:title, :user_id, :file, :likes))
		
		@sig.save
		redirect_to @sig
	end
end
