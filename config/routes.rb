Rails.application.routes.draw do
get 'welcome/index' #告诉 Rails 对 http://localhost:3000/welcome/index 的访问请求应该发往 welcome 控制器的 index 动作。

resources :articles do #resources 方法，用于声明标准的 REST 资源。把 articles 资源添加到 config/routes.rb 文件
	resources :comments #在 articles 资源中创建 comments 资源，这种方式被称为嵌套资源。这是表明文章和评论之间层级关系的另一种方式。
end


root 'welcome#index'  #告诉 Rails 对根路径的访问请求应该发往 welcome 控制器的 index 动作
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
