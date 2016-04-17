class EdgesController < ApplicationController
	def new
		
	end

	def create
		@edge = Edge.new(params.require(:edge).permit(:aside, :bside))
                @edge.save
                redirect_to sigs_path
	end

	def index

	end

	def connect
		@edge = Edge.new(params.require(:edge).permit(:aside, :bside))
		@edge.aside -= 1
		@edge.bside -= 1
                @edge.save
		redirect_to sigs_path
	end
	
	def show
		@edge = Edge.find(params[:id])
	end
end
