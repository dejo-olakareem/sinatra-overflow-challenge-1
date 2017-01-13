get '/users/new' do

  erb :'users/new'

end



post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)

    redirect '/questions'
  else
    erb :'users/new'
  end
end


get '/users/:id/comments' do

  erb :'/comments/_index.html'
end

get '/comments/new' do

  erb :'/comments/_new.html'
end


post '/users/:id/comments' do
  #how do I get the commentable_type info onto the form?
  p "I made it to the server!!!!!"
  @comment = Comment.create(body: params[:comment][:body])

end


get '/users/:id/comments/:comment_id/edit' do

  @comment = Comment.find(params[:comment_id])

  erb :'comments/_edit.html' #show edit comment view
end


put '/users/:id/comments/:comment_id' do

  @comment = Comment.find(params[:comment_id])

  @comment.assign_attributes(params[:comment])
  #this will be modified with AJAX
  if @comment.save
    redirect '/comments' #or wherever we need to show
  else
    erb :'comments/edit' #show edit comment view again(potentially displaying errors)
  end

end


delete '/users/:id/comments/:comment_id' do
  @user =
  @comment = Comment.find(params[:comment_id])
  @comment.destroy

  redirect '/comments' #or wherever we want
end

