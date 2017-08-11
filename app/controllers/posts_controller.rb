class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    news_url = 'https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=c88ebd8795d44dcdb1757b869a65f72b'
    response = HTTParty.get(news_url)

    @news_data = response

    @all_post = current_user.posts
    @new_post = current_user.posts.new

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    render html: 'show form to create new post'
  end

  def create
    Post.create(post_params)

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    updating_post = Post.find(params[:id])
    updating_post.update(post_update_params)

    redirect_to posts_path
  end

  def destroy
    deleted_post = Post.find(params[:id])
    deleted_post.destroy

    redirect_to posts_path
  end

  private

  def post_params
     params.require(:post).permit(:title, :content, :user_id)
  end

  def post_update_params
     params.require(:post).permit(:title, :content)
  end
end
