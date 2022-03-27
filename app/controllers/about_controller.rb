# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @gems = Gem.loaded_specs
    @libs = JSON.parse(File.read('package.json'))['dependencies']
    ['esbuild-rails', 'jquery', 'esbuild-plugin-import-glob', 'sass', 'bulma-carousel'].each { |x| @libs.delete x }
  end
end
