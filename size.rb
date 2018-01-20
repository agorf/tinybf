#!/usr/bin/env ruby

puts File.read('tinybf.rb').strip.split("\n\n").last.size.to_s + ' bytes'
