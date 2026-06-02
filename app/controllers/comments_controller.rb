class CommentsController < AuthenticatedController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  def search
    if params[:query].present?
      @comments = Comment.search(params[:query])
    else
      @comments = Comment.includes(:user).order(created_at: :desc)
    end
    
    render turbo_stream: turbo_stream.update("comments_list", partial: "comments/list", locals: { comments: @comments })
  end

  def create
    service = Comments::CreateService.new(current_user, comment_params)

    if service.call
      redirect_to root_path, notice: "Comment posted!"
    else
      @comment = service.comment
      @comments = Comment.includes(:user).order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to root_path, notice: "Comment updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path, notice: "Comment deleted."
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
