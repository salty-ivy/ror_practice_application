class ArticlesController < ApplicationController
  before_action :require_login


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      # render action: :index
      redirect_to article_path(@article.id)
      # redirect_to test_path
    else
      puts "fail"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.user == current_user
      if @article.update(article_params)
        flash[:success] = "Article successfully updated"
        redirect_to article_path(@article.id)
      else
        flash[:success] = "something went wrong please try again."
        render :index
      end
    else
      flash[:notice] = "you are not the owner of this article"
      render :edit
    end
  end

  def destroy
  end

  def test
    render :aman
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
