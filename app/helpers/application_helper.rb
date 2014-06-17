module ApplicationHelper
  def localized_name(user)
    user.public_send("name_#{I18n.locale}".to_sym)
  end

  def localized_description(deal)
    deal.public_send("description_#{I18n.locale}".to_sym)
  end

  ROLE_LABELS = { player: 'default', 
                  coach: 'success', 
                  sponsor: 'warning', 
                  admin: 'danger' }

  def role_for(user)
    content_tag('span', 
                I18n.t("role_#{user.role}"), 
                class: "label label-#{ROLE_LABELS[user.role.to_sym]}")
  end

  def page_title
    I18n.t("#{controller.controller_name}.#{controller.action_name}.heading") + 
    " - " +
    I18n.t("brand")
  end 

  def team_list_for(item)
    raw item.teams.map { |team| link_to localized_name(team), team_path(team) }.join(', ')
  end 
end
