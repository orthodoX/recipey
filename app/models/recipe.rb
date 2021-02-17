class Recipe < Contentful::Entry
  # Override if necessary
  # def title; end

  def content
    markdown.render description
  end

  def image_url
    photo.url.sub %r{\A//}, "https://"
  end

  def content_tags
    return if fields[:tags].blank?

    tags.map(&:name)
  end

  def chef_name
    return if fields[:chef].blank?

    chef.name
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
