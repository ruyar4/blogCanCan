class CommentsController < ApplicationController

	def index
	    @comments = Comment.all
	end

	# GET /posts/1
	# GET /posts/1.json
	def show
	end

	# GET /posts/new
	def new
	   @comments = Comment.new
	end

	def create
	    #@comment = Comment.new(comment_params)
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(comment_params)
    	redirect_to post_path(@post)
	    respond_to do |format|
	      if @comment.save
	        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
	        format.json { render :show, status: :created, location: @comment }
	      else
	        format.html { render :new }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_comment
	      @comment = Comment.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def comment_params
	      params.require(:comment).permit(:coment)
	    end
end
