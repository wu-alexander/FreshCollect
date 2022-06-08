# To deliver this notification:
#
# ItemNotification.with(post: @post).deliver_later(current_user)
# ItemNotification.with(post: @post).deliver(current_user)

class ItemNotification < Noticed::Base
  include ActionView::Helpers::DateHelper

  deliver_by :database
  deliver_by :action_cable, format: :to_websocket

  param :item

  def text
    <<-HTML
    "#{item.user.first_name} just listed <strong class="fw-bolder">#{item.title}</strong> near you!"
    HTML
  end

  def title
    "New items available"
  end

  def extra_info
    ""
  end

  def path
    item
  end

  def icon_keys
    ["fas", "shopping-bag"]
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
