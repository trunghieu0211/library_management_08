module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".app"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def error_messages object
    return "" if object.errors.empty?
    messages = object.errors.full_messages.map{|message| content_tag(:li, message)}.join
    html = <<-HTML
      <script type="text/javascript">
        toastr.error('#{messages}');
      </script>
    HTML
    html.html_safe
  end

  # def paginate(collection, params= {})
  #   will_paginate @books, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  # end
end
