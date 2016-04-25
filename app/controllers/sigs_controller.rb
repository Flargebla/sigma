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
		@user_sigs = User.find(session[:user_id]).sigs
		#puts "Looping over all edges..."
		#Edge.find_each do |e|
		#	puts e.aside
		#	puts e.bside
		#	sig_a = User.find(e.aside)
		#	sig_b = User.find(e.bside)
		#	if sig_a.user.id == session[:user_id]
		#		@user_sigs[sig_a.title] = sig_a.user.id
		#	elsif sig_b.user.id == session[:user_id]			
		#		@user_sigs[sig_b.title] = sig_b.user.id
		#	end
		#end
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
