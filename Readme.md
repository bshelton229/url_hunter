### Url Hunter ###

Before I go anywhere with you, I wan to know where you're taking me

    require 'url_hunter'
    UrlHunter.resolve 'http://bit.ly/2SnEZb'
    => "http://www.microsoft.com/en-us/default.aspx"

    # Try 10 redirects
    hunt = UrlHunter.new('http://bit.ly/2SnEZb', 10)
    hunt.resolve
    => "http://www.microsoft.com/en-us/default.aspx"
    hunt.original_url
    => "http://bit.ly/2SnEZb"
