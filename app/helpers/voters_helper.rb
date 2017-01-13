helpers do
  def vote_count(votable_instance)
    arr = votable_instance.votes
    if arr.length == 0
      0
    else
      arr.map{|vote| vote.value}.inject(:+)
    end
  end

  def vote_user_include(votable_instance)
    arr = votable_instance.votes.map{|vote| vote.user_id}

      if arr.include?(current_user)
        true
      else
        false
      end
  end


end
