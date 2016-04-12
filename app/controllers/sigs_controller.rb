class SigsController < ApplicationController
	def index
		@sigs = Sig.all
	end

	def like
		@sig = Sig.find(params[:id])
		@sig.likes += 1
		@sig.save
		redirect_to @sig
	end

	def connect
		@edge = Edge.new(1,params[:id])
		@edge.save
	end
	
	def show
		@sig = Sig.find(params[:id])
	end

	def destroy
		Sig.destroy(params[:id])
	end
	
	def new

	end

	def index

	end

	def create
		@sig = Sig.new(params.require(:sig).permit(:title, :tags, :file, :likes))
		
		@sig.save
		redirect_to @sig
	end
end
