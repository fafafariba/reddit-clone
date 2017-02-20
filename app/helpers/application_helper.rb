module ApplicationHelper

  def auth_token
    "<input type='hidden' name='authenticity_token' value='<%= form_authenticity_token %>'>".html_safe
  end

  def errors
    if flash
      flash.each do |key, value|
        "<p> #{key}: #{value}</p>".html_safe
      end
    end
  end
end
