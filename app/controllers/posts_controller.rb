class PostsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update]
	before_filter :admin_user, only: [:new, :create, :edit, :update]
	before_filter :editor_user, only: [:new, :create]

	# GET /posts
	# GET /posts.json
	def index
		@posts = Post.where(:post_type => "Blog").paginate(page: params[:page], per_page: 5)

		respond_to do |format|
			format.html
			format.json { render json: @posts }
		end
	end

	def all
		@posts = Post.paginate(page: params[:page], per_page: 5)

		respond_to do |format|
			format.html { render :index }
			format.json { render json: @posts }
		end
	end

	def home
		@post = Post.where(:post_type => "Home").first

		respond_to do |format|
			format.html
			format.json { render json: @post }
		end
	end

	def projects
		@post = Post.where(:post_type => "Projects").first
		
		respond_to do |format|
			format.html
			format.json { render json: @post }
		end
	end

	# GET /posts/1
	# GET /posts/1.json
	def show
		@post = Post.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @post }
		end
	end

	# GET /posts/new
	# GET /posts/new.json
	def new
		@post = Post.new
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @post }
		end
	end

	# GET /posts/1/edit
	def edit
		@post = Post.find(params[:id])
	end

	# POST /posts
	# POST /posts.json
	def create
		@post = Post.new(params[:post])
		@post.user = User.current_user
		respond_to do |format|
			if @post.save
				format.html { redirect_to @post, notice: 'Post was successfully created.' }
				format.json { render json: @post, status: :created, location: @post }
			else
				format.html { render action: "new" }
				format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /posts/1
	# PUT /posts/1.json
	def update
		@post = Post.find(params[:id])
		respond_to do |format|
			if @post.update_attributes(params[:post])
				format.html { redirect_to @post, notice: 'Post was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /posts/1
	# DELETE /posts/1.json
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		respond_to do |format|
			format.html { redirect_to posts_url }
			format.json { head :no_content }
		end
	end
end
