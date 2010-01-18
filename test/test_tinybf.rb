#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '..') 

require 'test/unit'

class TestTinyBF < Test::Unit::TestCase
  FILES = Dir.glob(File.join('test', '*.b'))

  FILES.each {|fn|
    method_name = 'test_' + fn.sub(/\.b$/, '')
    expected = File.read(fn.sub(/\.b$/, '.out'))
    actual = open('|ruby tinybf.rb', 'r+') {|f|
      f.write(File.read(fn))
      f.close_write
      f.read
    }
    define_method(method_name) { assert_equal(expected, actual) }
  }
end
