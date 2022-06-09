class PickupNotification < Noticed::Base
  include ActionView::Helpers::DateHelper

  deliver_by :database
  deliver_by :action_cable, format: :to_websocket

  param :pickup

  def text
    <<-HTML
      Your #{pickup.item.title} now scheduled for
      pickup on <strong class="fw-bolder">#{pickup.relative_pickup_date}
      at #{pickup.arrive_at.strftime('%l')}#{pickup.arrive_at.strftime('%p').downcase}</strong>!
    HTML
  end

  def extra_info
    "in #{distance_of_time_in_words_to_now(pickup.arrive_at)}"
  end

  def title
    "Pickup scheduled"
  end

  def icon_keys
    ["fas", "seedling"]
  end

  def path
    :dashboard
  end

  def pickup
    params[:pickup]
  end

  def to_websocket
    {
      static_html: ApplicationController.render(partial: "notifications/static_notification", locals: { notification: self }),
      popup_html: ApplicationController.render(partial: "notifications/popup_notification", locals: { notification: self }),
      notification_count: recipient.notifications.size
    }
  end
end
