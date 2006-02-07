#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '..') 

require 'test/unit'

class TestTinyBF < Test::Unit::TestCase
  TESTS = ['30000', 'io', 'numwarp', 'obscure', 'rot13', 'triangle']

  def test_tests
    TESTS.each do |title|
      code = File.open(File.join($:[0], 'test', "#{title}.b")) {|f| f.read }
      result = File.open(File.join($:[0], 'test', "#{title}.txt")) {|f| f.read }

      IO.popen('ruby ' + File.join($:[0], 'tinybf.rb'), 'r+') do |f|
        f.write(code)
        f.close_write
        assert_equal(result, f.read)
      end
    end
  end
end
