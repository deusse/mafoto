class CommentsController < ApplicationController

	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.new(:user_id => current_user.id)
		respond_to do |format| 
			format.html { redirect_to @comment.photo }
		end
	end
end
