class CommentsController < ApplicationController

	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.create(params[:comment])
		redirect_to photo_path(@photo)
	end
end
