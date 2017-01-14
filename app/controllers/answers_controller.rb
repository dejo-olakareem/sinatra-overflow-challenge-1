
get '/questions/:id/answers/new' do
	if request.xhr?
  	@question = Question.find(params[:id])
  	erb :"answers/new.html", layout: false
  else
  	@question = Question.find(params[:id])
  	erb :"answers/new.html"
  end

get '/questions/:question_id/answers/new' do



end


post '/questions/:id/answers' do

  @question = Question.find(params[:id])

  @answer = @question.answers.new(params[:answer])


  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :"answers/new.html" #show new answers view again(potentially displaying errors)
  end

end


get '/questions/:question_id/answers/:id/edit' do

  @question = Question.find(params[:question_id])

  Answer.find(params[:id])

  erb :"answers/edit.html"

end


put '/questions/:id/answers/:id' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  if @answer.update_attributes(params[:answer])
    redirect "/questions/#{@question.id}"
  else
    erb :"answers/edit.html" #show edit answers view again(potentially displaying errors)
  end

end


delete '/questions/:id/answers/:id' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  @answer.destroy

  redirect "/questions/#{@question.id}"

end

get '/answers/:id/comments' do

  erb :'/comments/_index.html'
end

get '/answers/:id/comments/new' do

  erb :'/comments/_new.html'
end


post '/answers/:id/comments' do
  #how do I get the commentable_type info onto the form?
  p "I made it to the server!!!!!"
  @comment = Comment.create(body: params[:comment][:body])

end


get '/answers/:id/comments/:comment_id/edit' do
  @answer = Answer.find(params[:id])
  @comment = @answer.comments.find(params[:comment_id])

  erb :'comments/_edit.html' #show edit comment view
end


put '/answers/:id/comments/:comment_id' do

  @answer = Answer.find(params[:id])
  @comment = @answer.comments.find(params[:comment_id])

  @comment.assign_attributes(params[:comment])
  #this will be modified with AJAX
  if @comment.save
    redirect '/comments' #or wherever we need to show
  else
    erb :'comments/edit' #show edit comment view again(potentially displaying errors)
  end

end


delete '/answers/:id/comments/:comment_id' do

  @answer = Answer.find(params[:id])
  @comment = @answer.comments.find(params[:comment_id])
  @comment.destroy

  redirect '/comments' #or wherever we want
end
