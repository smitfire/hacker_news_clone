enable 'sessions'

get '/' do
  @posts = Post.all
  @matched = []

  @posts.each do |post|
    @matched << [User.where(id: post.user_id).first,  post.title, post.id, Comment.where(post_id: post.id), Comment.find_by_post_id(post.id)]
  end

  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
  end
  erb :index
end


get '/signup' do
  erb :signup
end

get '/logout' do
  session.clear
  redirect('/')
end

get '/user_account/:id' do
  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
  end

  @posts = Post.where(user_id: @user.id)
  @comments = Comment.where(user_id: @user.id)

  if @posts
    @post_comments = []
    @posts.each do |post|
      @post_comments << Comment.where(post_id: post.id)
    end
  end

  erb :account_page
end


get '/user/:id' do
  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
  end
  @user_page = User.find(params[:id])
  @posts = Post.where(user_id: @user_page.id)
  @comments = Comment.where(user_id: @user_page.id)

  erb :_user_page
end

get '/post/:id' do
  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
  end
  @post = Post.find(params[:id])
  @comments = Comment.where(post_id: params[:id])
  erb :post_display
end

get '/post/new' do
  @user = User.find_by_id(session[:user_id])
  @user_id = @user.id
  erb :new_post
end

post '/post/create' do
  @user = User.find_by_id(session[:user_id])
  Post.create(user_id: session[:user_id], title: params[:post][:title], content: params[:post][:content])
  redirect('/')
end


post '/user' do
  @user = User.find_by_email(params[:user][:email])
  session[:user_id] = @user.id
  redirect("/user/#{@user.id}")
end


post '/new' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect("/user/#{@user.id}")
end


