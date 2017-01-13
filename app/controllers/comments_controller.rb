get '/comments' do

  erb :'/comments/_index.html'
end


get '/comments/new' do

  erb :'/comments/_new.html'
end


post '/comments' do
  #how do I get the commentable_type info onto the form?
  p "I made it to the server!!!!!"
  @comment = Comment.create(body: params[:comment][:body])

end


get '/comments/:id/edit' do

  @comment = Comment.find(params[:id])

  erb :'comments/_edit.html' #show edit comment view
end


put '/comments/:id' do

  @comment = Comment.find(params[:id])

  @comment.assign_attributes(params[:comment])
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


