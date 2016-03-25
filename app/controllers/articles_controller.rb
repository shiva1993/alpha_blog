class ArticlesController < ApplicationController
	
	def index
		@articles=Article.all
	end

	def new
		@article=Article.new	
	end

	def show
		@article=Article.find(params[:id])
		
	end

	def edit
		@article=Article.find(params[:id])
	end

	def create
		@article=Article.new(article_params)
		#@article.user=User.first
		if @article.save
			flash[:notice]="successfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def update
		@article=Article.find(params[:id])
		 if @article.update(article_params)
		 	redirect_to article_path(@article)
		 else
		 	render 'edit'
		 end
	end

	def destroy
		@article=Article.find(params[:id])
	    @article.destroy
		flash[:notice]="succssfully deleted"
		redirect_to articles_path(@article)

	end
	private

	def article_params
		params.require(:article).permit(:title,:description)
	end
end
