get '/login' do
  erb :'sessions/new'
end

post '/login' do
  @user = User.find_by(email: params[:email])

  if @user.password = params[:password]
    login(@user)
    redirect '/'
  else
    erb :'/sessions/new'
  end
end

get '/logout' do
  logout

  redirect '/'
end
