require 'bundler/setup'
Bundler.require
require 'action_view'
include ActionView

p Tilt.new("views/layouts/application.haml").render
