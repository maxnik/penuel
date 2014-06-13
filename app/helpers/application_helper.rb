module ApplicationHelper
  def page_title
    I18n.t("#{controller.controller_name}.#{controller.action_name}.heading") + 
    " - " +
    I18n.t("brand")
  end 
end
