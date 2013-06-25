class Pathname

  def glob(pattern, &block)
    Pathname.glob(self.join(pattern), &block)
  end

end

class Sprockets::Context
  include R18n::Helpers
end

R18n::Filters.add('code') do |text, config|
  text.gsub(/`([^`]+)`/, '<code>\1</code>')
end

R18n::Filters.add('format') do |text, config|
  '<p>' +
    text.gsub(/~([^~]+)~/, '<strong>\1</strong>').gsub("\n", '</p><p>') +
  '</p>'
end

class R18n::TranslatedString
  def link(href, args = { })
    args[:href] = href
    args = args.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
    self.sub(/\^([^\^]+)\^/, "<a #{args}>\\1</a>")
  end
end
