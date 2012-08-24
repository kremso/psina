module FormattingHelper
  PICTURE_FORMAT_RE = /\bhttp:\/\/.*?(?:\.gif|\.png|\.jpg|\.jpeg)\b/

  def inline_images(text)
    text.gsub(PICTURE_FORMAT_RE) do |url|
      image_tag(url)
    end.html_safe
  end
end
