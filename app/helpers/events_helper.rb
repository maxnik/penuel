module EventsHelper
  def localized_result(event)
    event.public_send("result_#{I18n.locale}".to_sym)
  end
end
