class CommentsController < InheritedResources::Base

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:notice] = "Error creating comment: #{@comment.errors.messages}"
    end

    redirect_to @comment.post
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end

end
