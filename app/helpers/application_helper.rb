module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".app"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end


  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
end
