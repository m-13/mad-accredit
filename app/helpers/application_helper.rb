module ApplicationHelper

  def display_flash(key, value)
    render partial: 'layouts/flash', locals: { key: key, value: value }
  end

  def notifications?
    # TODO: return true if there are notifications for user
    false
  end

  def unread_notifications?
    # TODO: return true if there are unread notifications
    false
  end

  def initials(name)
    name.split.map { |word| word.first }.join
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user])
  end

  def safe_base64(data)
    Rack::Utils.escape(Base64.encode64(data).gsub(/\s+/, ''))
  end
end
