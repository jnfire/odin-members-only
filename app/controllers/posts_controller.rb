class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[ create ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :index, status: :unprocessable_content
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :name, :body ])
    end
end
