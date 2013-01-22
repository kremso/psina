# encoding: utf-8

module StarsHelper
  def stars(rating)
    rating ||= 0
    stars =  (1..rating).collect { content_tag(:span, '★', class: 'star-selected') }
    stars << (rating+1..5).collect { content_tag(:span, '☆', class: 'star-deselected') }
    stars.join.html_safe
  end
end
