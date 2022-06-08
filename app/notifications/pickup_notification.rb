class PickupNotification < Noticed::Base
  include ActionView::Helpers::DateHelper

  deliver_by :database
  deliver_by :action_cable, format: :to_websocket

  param :pickup

  def popup_text
    "Yay! Your #{pickup.item.title} has just been booked!"
  end

  def text
    <<-HTML
      Your #{pickup.item.title} now scheduled for
      pickup on #{pickup.relative_pickup_date}
      at #{pickup.arrive_at.strftime('%H%p')}!
    HTML
  end

  def extra_info
    distance_of_time_in_words_to_now(pickup.arrive_at)
  end

  def title
    "Pickup scheduled"
  end

  def image_key
    pickup.item.photo_or_default
  end

  def path
    :dashboard
  end

  def pickup
    params[:pickup]
  end

  def to_websocket
    {
      popup_html: ApplicationController.render(partial: "notifications/popup_notification", locals: { notification: self })
    }
  end
end
