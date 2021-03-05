class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end 
  end
  # When we visit http://localhost:3000/articles/new, the GET /articles/new request is mapped to the new action. The new action does not attempt to save @article. Therefore, validations are not checked, and there will be no error messages.  When we submit the form, the POST /articles request is mapped to the create action. The create action does attempt to save @article. Therefore, validations are checked. If any validation fails, @article will not be saved, and app/views/articles/new.html.erb will be rendered with error messages.

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
#if the index action is empty, then an action does not explicitly render a view (or otherwise trigger an HTTP response), 
#Rails will automatically render a view that matches the name of the controller and action. Convention Over Configuration! 
#Views are located in the app/views directory. So the index action will render app/views/articles/index.html.erb by default.