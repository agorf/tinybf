#!/usr/bin/env ruby

puts File.read('tinybf.rb').strip.reverse.split("\n\n", 2)[0].reverse.
  split("\n").join.size.to_s + ' bytes'
