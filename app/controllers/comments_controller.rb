class CommentsController < ApplicationController


  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
    
    redirect_to article_path(params[:article_id])
  end



  private

 

  # Only allow a list of trusted parameters through.
  def comment_params
    params
    .require(:comment)
    .permit(:text)
    .merge(article_id: params[:article_id])
  end
  
end
