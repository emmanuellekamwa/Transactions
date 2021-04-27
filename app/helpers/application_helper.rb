module ApplicationHelper
  def display_navbar
    if logged_in?
      render 'shared/logged_in_navbar'
    else
      render 'shared/log_in'
    end
  end
end
