#!/usr/bin/ruby

require 'github/markdown'
require 'fileutils'
include FileUtils
include GitHub

module HTMLProcess
  def HTMLProcess.begin
    puts "hello World"
  end
end