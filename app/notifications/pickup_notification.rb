class PickupNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable, format: :to_websocket

  param :pickup

  def text
    "Yay! #{pickup.item.title} now scheduled for pickup!"
  end

  def popup_text
    "Yay! Your #{pickup.item.title} has just been booked!"
  end

  def path
    pickup
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
