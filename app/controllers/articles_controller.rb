class ArticlesController < ApplicationController

	#除了 index 和 show 动作，其他动作都要通过身份验证才能访问
	http_basic_authenticate_with name: "jim", password: "jim", except: [:index, :show]

	#在 ArticlesController 中添加 @article = Article.new 是因为如果不这样做，在视图中 @article 的值就会是 nil，这样在调用 @article.errors.any? 时就会抛出错误。

	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id]) #使用实例变量（前缀为 @）保存对文章对象的引用。这样做是因为 Rails 会把所有实例变量传递给views。
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params) #article_params就是create 的 view 中所采集的数据

		if @article.save #若save成功
			redirect_to @article #最后把页面重定向到 show Action,重新定向到当前这个@article实例
		else
			render 'new' #使用 render 方法是为了把 @article 对象回传给 new 模板。这里渲染操作是在提交表单的这个请求中完成的，而 redirect_to 会告诉浏览器发起另一个请求。
		end
	end
	
	def update #update Action用于更新已有记录，它接受一个散列hash作为参数，散列中包含想要更新的属性。和之前一样，如果更新文章时发生错误，就需要把表单再次显示给用户。
		@article = Article.find(params[:id])

		if @article.update(article_params)
		redirect_to @article
		else
		render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy #不需要为 destroy Action添加view，因为完成操作后它会重定向到 index Action。

		redirect_to articles_path #articles_path 辅助方法告诉 Rails 把表单指向和 articles 前缀相关联的 URI 模式。 localhost:3000/articles
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
