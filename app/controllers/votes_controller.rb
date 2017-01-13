
post '/upvotes/:id/new' do

  @class_name = params[:class].constantize

  if user?
  @vote = Vote.new(value: 1, voteable_type: @class_name, voteable_id: params[:id], user_id: current_user)

   if vote_user_include(@class_name.find(params[:id])) == false
     @vote.save
   end
   redirect '/questions'

  else
    redirect '/questions'
  end

end


post '/downvotes/:id/new' do
  @class_name = params[:class].constantize
  if user?
  @vote = Vote.new(value: -1, voteable_type: @class_name, voteable_id: params[:id], user_id: current_user)

   if vote_user_include(@class_name.find(params[:id])) == false
     @vote.save
   end
   redirect '/questions'

  else
    redirect '/questions'
  end

end
