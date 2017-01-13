get '/questions/:question_id/answers/new' do 

  @question = Question.find(params[:question_id])

  erb :"answers/new.html"

end


post '/questions/:question_id/answers' do 

  @question = Question.find(params[:question_id])

  @answer = @question.answers.new(params[:answer])


  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :"answers/new.html" #show new answers view again(potentially displaying errors)
  end

end


get '/questions/:question_id/answers/:id/edit' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  erb :"answers/edit.html"

end


put '/questions/:question_id/answers/:id' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  if @answer.update_attributes(params[:answer])
    redirect "/questions/#{@question.id}"
  else 
    erb :"answers/edit.html" #show edit answers view again(potentially displaying errors)
  end

end


delete '/questions/:question_id/answers/:id' do 

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  @answer.destroy

  redirect "/questions/#{@question.id}"

end