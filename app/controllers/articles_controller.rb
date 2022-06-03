class ArticlesController < ApplicationController
  def index
    @articles = Article.all
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

  def show
    @article = Article.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

  def test
    render action: :new
  end
end
