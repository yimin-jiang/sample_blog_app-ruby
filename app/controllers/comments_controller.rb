class CommentsController < ApplicationController
	#同时只有通过身份验证的用户才能删除评论
	http_basic_authenticate_with name: "jim", password: "jim", only: :destroy

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params) #comment_params就是comment的view 中所采集的数据. 利用了关联特有的方法，在 @article.comments 上调用 create 方法来创建和保存评论，同时自动把评论和对应的文章关联起来。
		redirect_to article_path(@article)
	end
	
	def destroy
		#destroy 动作首先找到指定文章，然后在 @article.comments 集合中找到指定评论，接着从数据库删除这条评论，最后重定向到显示文章的页面。
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
		params.require(:comment).permit(:commenter, :body)
		end
end
