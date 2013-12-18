require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_01_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me a... R
Give me a... T
BRT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_02_name_with_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("Aaron")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an... A
Give me an... A
Give me a... R
Give me an... O
Give me a... N
AARON's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_03_name_with_spaces
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("Mary Jane")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... M
Give me an... A
Give me a... R
Give me a... Y
Give me a... J
Give me an... A
Give me a... N
Give me an... E
MARY JANE's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

#   def test_04_no_name
#     shell_output = ""
#     IO.popen('ruby cheers.rb', 'r+') do |pipe|
#       pipe.puts("")
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     expected_output = <<EOS
# What's your name?
# You did not enter a name, no cheer for you
# EOS
#     assert_equal expected_output, shell_output
#   end

  def test_04_no_name
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
You did not enter a name, no cheer for you
EOS
    assert_raise(NameError)
  end


end
