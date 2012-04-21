require 'spec_helper'

describe UrlHunter, '#resolve' do
  it "Should require http:// or https:// prefixes" do
    lambda { UrlHunter.resolve('no_prefix') }.should raise_error(UrlHunter::Error)
  end
end
