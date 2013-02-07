module ApplicationHelper
  def full_title(provided=nil)
    base_title = "Aaron Neyer"
    if provided.blank?
      return base_title
    else
      return "#{base_title} | #{provided}"
    end
  end
end
