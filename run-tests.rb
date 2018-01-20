#!/usr/bin/env ruby

require 'test/unit'

class TestTinyBF < Test::Unit::TestCase
  Dir.glob('test/*.b').each do |fn|
    method_name = 'test_' + fn.sub(/\.b$/, '')

    define_method(method_name) do
      expected = File.read(fn.sub(/\.b$/, '.out'))

      actual = IO.popen('ruby tinybf.rb', 'r+') do |f|
        f.write(File.read(fn))
        f.close_write
        f.read
      end

      assert_equal(expected, actual)
    end
  end
end
