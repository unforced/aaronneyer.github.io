require 'bundler/setup'
Bundler.require
require 'action_view'
include ActionView::Base
include AbstractController::Rendering
include AbstractController::Layouts

p Tilt.new("views/layouts/application.haml").render
