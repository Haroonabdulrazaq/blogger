class ArticlesController < ApplicationController
  include ArticlesHelper

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
    @article.save

    flash.notice ="Article #{@article.title} created sucessfully!"

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
  
    flash.notice ="Article #{@article.title} Updated sucessfully!"

    redirect_to article_path(@article)
  end
  

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article #{@article.title} Deleted sucessfully!"

    redirect_to articles_path(@article)
  end
end
