class ArticlesController < ApplicationController
    before_action :required_user, except: [:show, :index]
    before_action :require_same_user, only: [  :destroy]
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 3)
    end
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title, :description, category_ids:[]))
        @article.user = current_user
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       if @article.update(params.require(:article).permit(:title, :description, category_ids:[]))
        redirect_to @article
       else
        render 'edit'
       end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path 
    end

    private

    def require_same_user
        if current_user != @article.user 
            redirect_to @article
        end
    end
end