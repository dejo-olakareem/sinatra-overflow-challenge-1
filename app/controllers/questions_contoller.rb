
get '/questions' do

  @questions = Question.all #define instance variable for view

  erb :"questions/index.html" #show all questions view (index)

end


get '/questions/new' do


  erb :"questions/new.html" #show new questions view

end


post '/questions' do

  #below works with properly formatted params in HTML form
  @question = Question.new(params[:question]) #create new question
  @question.user_id = session[:user_id]
  if @question.save #saves new question or returns false if unsuccessful
    redirect "/questions/#{@question.id}" #redirect back to questions index page
  else
    erb :"questions/new.html" # show new questions view again(potentially displaying errors)
  end

end


get '/questions/:id' do

  #gets params from url

  @question = Question.find(params[:id]) #define instance variable for view

  @answers = @question.answers


  erb :"questions/show.html" #show single question view

end




get '/questions/:id/edit' do

  #get params from url
  @question = Question.find(params[:id]) #define intstance variable for view

  erb :"questions/edit.html" #show edit question view

end


put '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define variable to edit


  @question.assign_attributes(params[:question]) #assign new attributes

  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :"questions/edit.html" #show edit question view again(potentially displaying errors)
  end

end


delete '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define question to delete

  @question.destroy #delete question

  redirect "/questions" #redirect back to questions index page

end

get 'questions/:id/comments' do

  erb :'/comments/_index.html'
end

get '/questions/:id/comments/new' do

  erb :'/comments/_new.html'
end


post '/questions/:id/comments' do
  #how do I get the commentable_type info onto the form?
  p "I made it to the server!!!!!"
  @comment = Comment.create(body: params[:comment][:body])

end


get '/questions/:id/comments/:comment_id/edit' do

  @question = Question.find(params[:id])
  @comment = @answer.comments.find(params[:comment_id])

  erb :'comments/_edit.html' #show edit comment view
end


put '/questions/:id/comments/:comment_id' do

  @question = Question.find(params[:id])
  @comment = @answer.comments.find(params[:comment_id])

  @comment.assign_attributes(params[:comment])
  #this will be modified with AJAX
  if @comment.save
    redirect '/comments' #or wherever we need to show
  else
    erb :'comments/edit' #show edit comment view again(potentially displaying errors)
  end

end


delete '/questions/:id/comments/:comment_id' do

  @question = Question.find(params[:id])
  @comment = @answer.comments.find(params[:comment_id])
  @comment.destroy

  redirect '/comments' #or wherever we want
end
