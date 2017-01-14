get '/comments' do

  erb :'/comments/_index.html'
end


get '/:commentable_id/comments/new' do
  @commentable_id = params[:commentable_id]
  @class_name = params[:class].constantize
  erb :'/comments/_new.html'
end


post '/:commentable_id/comments' do
  p params
  @comment = Comment.new(body: params[:comment][:body], commentable_type: params[:comment][:class].constantize, commentable_id: params[:commentable_id],user_id: current_user)

  if @comment.save
    redirect "/"
  else
    redirect "/comments/#{params[:commentable_id]}/new"
  end
end


get '/comments/:id/edit' do
  @id = params[:id]
  @comment = Comment.find(params[:id])

  erb :'comments/_edit.html' #show edit comment view
end


put '/comments/:id' do

  @comment = Comment.find(params[:id])

  @comment.body = params[:body]
  #this will be modified with AJAX
  if @comment.save
    redirect '/comments' #or wherever we need to show
  else
    erb :'comments/edit' #show edit comment view again(potentially displaying errors)
  end

end


delete '/comments/:id' do

  @comment = Comment.find(params[:id])
  @comment.destroy

  redirect '/comments' #or wherever we want
end
