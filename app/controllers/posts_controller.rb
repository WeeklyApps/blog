class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @announcements = Announcement.active
    if params[:user_id]
      @posts = Post.where(user_id: params[:user_id])
    else
      @posts = Post.all
    end
    if params[:tag]
      @posts = @posts.tagged_with(params[:tag]).page(params[:page]).order( 'created_at DESC')
    else
      @posts = @posts.page(params[:page]).order('created_at DESC')
    end
  end
  
  def feed
    @title = "Weekly Apps Blog Posts"
    @posts = Post.order("created_at desc")
    @updated = @posts.first.updated_at unless @posts.empty?
    respond_to do |format|
      format.atom { render :layout => false }
      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
  
  def by_month
    @posts = Post.all
    @post_months = @posts.group_by { |p| p.created_at.beginning_of_month }
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params.merge(:user_id => current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :tag_list)
    end
end
