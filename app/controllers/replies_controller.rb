class RepliesController < ApplicationController
	def index
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.all
	end

	def new
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.new
		
	end
	
	def create
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.create(reply_params)
		if @reply.save
		redirect_to comment_path(@comment)
	else
		redirect_to posts_url
	end
	
	end


	def destroy

		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.find(params[:id])
		@reply.destroy
		redirect_to comment_path(@comment)
	end

	def show

		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.find(params[:id])

	end



	def reply_params
	params.require(:reply).permit(:user, :content)
	end

end
