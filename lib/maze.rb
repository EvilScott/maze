require 'bundler/setup'
Bundler.require :default

$:.unshift File.join(File.dirname(__FILE__), 'maze')
%w[core grid wall level_exit bounding_box
  window laser hero robot exit_meter].each { |klass| require klass }

module Maze
  SIZE_TINY = 5
  SIZE_NORMAL = 10
  SIZE_HARD = 20
  X_OFFSET = 175
  Y_OFFSET = 85
end