
post '/upvotes/:id/new' do
  p params
  @class_name = params[:class].constantize

  @commentable_instance = @class_name.find(params[:id])

  if user?
    @vote = Vote.new(value: 1, voteable_type: @class_name, voteable_id: params[:id], user_id: current_user)
  end

  if request.xhr?
    p "I'm in the server!!!!!"
   if vote_user_include(@class_name.find(params[:id])) == false
     @vote.save
     vote_count(@commentable_instance).to_s
   else
    "Nah Brah"
   end
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
