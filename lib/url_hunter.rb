require 'uri'
require 'net/http'

class UrlHunter
  VERSION = "0.0.1"
  class Error < StandardError; end

  attr_reader :url, :original_url, :limit, :tries

  # Class level wrapper
  def self.resolve(url, limit = 5)
    self.new(url, limit = 5).resolve
  end

  # Init
  def initialize(url, limit = 5)
    if not url =~ /^(http|https):\/\//i
      raise UrlHunter::Error, 'URL must begin with http:// or https://'
    end

    @limit = limit > 0 ? limit : 5
    @original_url = url
    @url = url
    @tries = 0
  end

  # Instance resolve function
  def resolve
    # Return what we have so far if we're above the limit
    return @url if @tries >= @limit
    u = URI.parse(@url)
    res = Net::HTTP.get_response(u)
    if res.kind_of?(Net::HTTPRedirection)
      redirect = res['Location']
      # Append Location re-direct to previous URL if it's relative
      if not redirect =~ /^(http|https):\/\//i
        redirect = @url + redirect
      end
      @url = redirect
      @tries += 1
      resolve
    else
      @url
    end
  end
end
