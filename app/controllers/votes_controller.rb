post '/questions/:id/upvote' do

  if user?
  @vote = Vote.new(value: 1, voteable_type: Question, voteable_id: params[:id], user_id: current_user)

   if vote_user_include(Question.find(params[:id])) == false
     @vote.save
   end
   redirect '/questions'

  else
    redirect '/questions'
  end

end


post '/questions/:id/downvote' do

  if user?
  @vote = Vote.new(value: -1, voteable_type: Question, voteable_id: params[:id], user_id: current_user)

   if vote_user_include(Question.find(params[:id])) == false
     @vote.save
   end
   redirect '/questions'

  else
    redirect '/questions'
  end

end
