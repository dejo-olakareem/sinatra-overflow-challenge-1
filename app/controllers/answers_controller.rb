get '/questions/:question_id/answers/new' do 

  @question = Question.find(params[:question_id])

  erb :"answers/new.html"

end