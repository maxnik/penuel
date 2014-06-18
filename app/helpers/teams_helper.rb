module TeamsHelper
  def user_list(users)
    raw users.map { |user| link_to localized_name(user), user_path(user) }.join(', ')
  end 

  def league_list_for(team)
    raw team.leagues.map { |league| localized_name(league) }.join(', ')
  end 
end
