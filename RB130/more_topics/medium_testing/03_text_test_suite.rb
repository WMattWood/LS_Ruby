require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative "textclass"

class TextTest < MiniTest::Test
  def setup
    @sample_text = Text.new(File.read("sample_text.txt"))
    # @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    expected_text = <<~HEREDOC
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    HEREDOC

    # sample_text = Text.new(@file.read)
    # assert_equal(expected_text, sample_text.swap('a', 'e'))

    assert_equal(expected_text, @sample_text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @sample_text.word_count)
  end

  # def teardown
  #   @file.close
  # end
end