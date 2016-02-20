module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} - TECH_SALON"
    else
      'TECH_SALON'
    end
  end
end
