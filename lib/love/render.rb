require 'pathname'
require 'slim'
require 'uglifier'
require 'sprockets'
require 'evil-front'
require 'coffee_script'
require 'rails-sass-images'
require 'autoprefixer-rails'

require 'r18n-core'

require 'render/overrides'

class Love
  class Render
    DEFAULT_ROOT = Pathname(__FILE__).parent.parent.parent.join('templates/')

    attr_accessor :root, :public, :layouts, :images, :standalone, :i18n

    def initialize(templates_path = DEFAULT_ROOT)
      @root       = templates_path
      @public     = @root.join('public/')
      @layouts    = @root.join('layouts/')
      @images     = @root.join('images/')
      @standalone = @root.join('standalone/')
      @i18n       = @root.join('i18n')
      @scripts    = @root.join('scripts/')
      @styles     = @root.join('styles/')
      @vendor     = @root.join('vendor/')

      R18n.default_places = @i18n
    end

  end
end
