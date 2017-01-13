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

  erb :'answers/edit'

end