require_relative "../../lib/fb64"
require "minitest/autorun"
require "base64"

describe 'FB64' do
  describe ".encode64 with no arguments" do
    it "returns an argument error" do
      assert_raises ArgumentError do
        FB64.encode64
      end
    end
  end

  describe ".encode64 given a non-string" do
    it "returns a type error" do
      assert_raises TypeError do
        FB64.encode64 -1
      end
    end
  end

  describe ".encode64 given a string" do
    it "returns the base64 of the string" do
      str = "hello world! 平仮名"
      result = FB64.encode64(str)
      assert_equal Base64.encode64(str).chomp, result
    end
  end

  describe ".decode64 given an encoded string" do
    it "returns the decoded string" do
      str = "hello world! 平仮名"
      encoded = FB64.encode64(str)
      assert_equal str, FB64.decode64(encoded)
    end
  end

  describe ".decode64 given an invalid base64 string" do
    it "raises an error" do
      str = "I am not base64 encoded"
      assert_raises FB64::DecodeError do
         FB64.decode64(str)
      end
    end
  end
end
