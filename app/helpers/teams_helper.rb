module TeamsHelper
  def coach_list_for(team)
    raw team.coaches.map { |coach| link_to localized_name(coach), user_path(coach) }.join(', ')
  end 
end
