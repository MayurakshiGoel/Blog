class CommentsController < ApplicationController
	def index
		 @post = Post.find(params[:post_id])
		 @comment = @post.comments.all
	end


	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end


	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	def show
	
		@comment = Comment.find(params[:id])
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])

	if @comment.update(comment_params)
		redirect_to @comment
	else
		render 'edit'
	end
end


	def comment_params
		params.require(:comment).permit(:name, :comment)
	end

end
