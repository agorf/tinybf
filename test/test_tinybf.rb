#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '..') 

require 'test/unit'

class TestTinyBF < Test::Unit::TestCase
  TESTS = ['30000', 'io', 'numwarp', 'obscure', 'rot13', 'triangle']

  TESTS.each do |title|
    expected = File.open(File.join($:[0], 'test', "#{title}.txt")) {|f| f.read }
    code = File.open(File.join($:[0], 'test', "#{title}.b")) {|f| f.read }
    actual = IO.popen('ruby ' + File.join($:[0], 'tinybf.rb'), 'r+') do |f|
      f.write(code)
      f.close_write
      f.read
    end

    define_method("test_#{title}") { assert_equal(expected, actual) }
  end
end
