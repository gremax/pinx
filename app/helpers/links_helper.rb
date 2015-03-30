module LinksHelper

  def get_title_and_url(url)
    @page = MetaInspector.new(url)
    return @page.title, @page.url
  end
end

# begin
#   @page = MetaInspector.new(url)
# rescue Faraday::ConnectionFailed
#   flash.now[:error] = "Connection Failed"
#   redirect_to new_link_path
# else
#   return @page.title, @page.url
# end
