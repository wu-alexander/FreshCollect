# To deliver this notification:
#
# ItemNotification.with(post: @post).deliver_later(current_user)
# ItemNotification.with(post: @post).deliver(current_user)

class ItemNotification < Noticed::Base
  include ActionView::Helpers::DateHelper

  deliver_by :database
  deliver_by :action_cable, format: :to_websocket

  param :item

  def popup_text
    "#{item.user.first_name} just listed #{item.title} near you!"
  end

  def text
    "#{item.user.first_name} just listed #{item.title} near you!"
  end

  def path
    item
  end

  def item
    params[:item]
  end

  def to_websocket
    {
      popup_html: ApplicationController.render(partial: "notifications/popup_notification", locals: { notification: self })
    }
  end
end
