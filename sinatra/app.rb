Thread.abort_on_exception = true

__DIR__ = File.dirname(__FILE__)
require 'rubygems'
require "#{__DIR__}/../lib/bigbananajour"

Bananajour.gem 'sinatra'
require 'sinatra'

Bananajour.require_gem 'haml'
Bananajour.require_gem 'json'

Bananajour.gem 'activesupport'
require 'active_support/core_ext/enumerable'
require 'active_support/core_ext/array'

require 'forwardable' # Fix for issue #8 - Thin borking on uninitialized constant Forwardable

set :server, 'thin' # Things go weird with anything else - let's lock it down to thin
set :haml, {:format => :html5, :attr_wrapper => '"'}
set :logging, false

require "#{__DIR__}/lib/browsers" # to prevent reloading
require "#{__DIR__}/lib/mock_browsers" if Sinatra::Application.development?
before do
  @bananajour_browser = BANANAJOUR_BROWSER
  @repository_browser = REPO_BROWSER
end

load "#{__DIR__}/lib/diff_helpers.rb"
helpers DiffHelpers

require "bananajour/helpers"
helpers Bananajour::GravatarHelpers, Bananajour::DateHelpers

helpers do
  def json(body)
    content_type "application/json"
    params[:callback] ? "#{params[:callback]}(#{body});" : body
  end
  def local?
    [
      "0.0.0.0",
      "127.0.0.1",
      Socket.getaddrinfo(request.env["SERVER_NAME"], nil).map {|a| a[3]}
    ].flatten.include? request.env["REMOTE_ADDR"]
  end
  def pluralize(number, singular, plural)
    "#{number} #{number == 1 ? singular : plural}"
  end
  def demangle_email(email)
    email.gsub(/_at_/, "@").gsub(/_dot_/, ".")
  end
  def mangle_email(email)
    email.gsub(/@/, "_at_").gsub(/./, "_dot_")
  end
end

get "/" do
  @repository_names = Bananajour.repository_names
  haml :home
end

