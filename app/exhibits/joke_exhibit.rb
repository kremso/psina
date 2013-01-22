class JokeExhibit < Exhibit
  def self.applicable_to?(object)
    object_is_any_of?(object, 'Joke')
  end

  def tags
    exhibit(super)
  end

  def formatted_body
    body = ERB::Util.html_escape(__getobj__.body)
    body = @context.simple_format(body)
    body = inline_images(body)
    body = inline_youtube(body)
    body = Rinku.auto_link(body)
    body.html_safe
  end

  def render_action_buttons(form)
    if __getobj__.published?
      @context.render('admin/jokes/actions_for_published', f: form, joke: self)
    else
      @context.render('admin/jokes/actions_for_unpublished', f: form, joke: self)
    end
  end

  private

  PICTURE_FORMAT_RE = /\bhttp:\/\/.*?(?:\.gif|\.png|\.jpg|\.jpeg)\b/

  def inline_images(text)
    text.gsub(PICTURE_FORMAT_RE) do |url|
      @context.image_tag(url, class: 'img-polaroid')
    end
  end

  YOUTUBE_RE = /(?:http:\/\/(?:www\.)?)?youtube\.com\/watch\?v=(.*?)(?:&.*|$)/

  def inline_youtube(text)
    text.gsub(YOUTUBE_RE) do
      text =~ YOUTUBE_RE
      youtube_id = $1
      @context.content_tag(:div, '', :id => "ytplayer-#{__getobj__.id}", "data-yt-id" => youtube_id, :class => 'yt')
    end
  end

  def auto_link(text)
    @context.auto_link(text)
  end
end
