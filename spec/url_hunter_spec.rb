require 'spec_helper'

describe UrlHunter, '#resolve' do
  it "Should require http:// or https:// prefixes" do
    lambda { UrlHunter.resolve('no_prefix') }.should raise_error(UrlHunter::Error)
  end

  it "Should resolve bit.ly urls pretty well" do
    UrlHunter.resolve('http://bit.ly/DhAoX').should eq('http://www.apple.com/')
  end

  it "Should resolve the bit.ly url for http://www.apple.com/ in one try" do
    u = UrlHunter.new('http://bit.ly/DhAoX')
    u.resolve.should eq('http://www.apple.com/')
    u.tries.should eq(1)
  end

  it "Should handle relative paths mixed in Location tags" do
    u = UrlHunter.new('http://flic.kr/p/bBqyXJ')
    u.resolve.should_not include('bBqyXJ')
  end
end
