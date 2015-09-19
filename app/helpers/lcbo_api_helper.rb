# helper methods for lcbo_api

require 'open-uri'

# resource is url, no leading slash
# per_page is default 100
# page is integer
# params is array like ["store_id=20", ...]
def get_lcbo_api resource, params=[], page=1, per_page=100
  url = "http://lcboapi.com/#{resource}?per_page=#{per_page}"
  url << "&page=#{page}" unless page.nil?
  params.each { |param| url << "&#{param}" }
  puts url
  res = open(
    url,
    'Authorization' => "Token MDozNDczNzBhNC01ZTUzLTExZTUtYTg2Zi0zN2QyMTEzM2QzMTc6enVBTzRzempEQTBzS2Q5RXlXRFhBRWF2bmhDd0hzbmVsRzRS"
  )
  JSON.parse(res.read)
end

# get paged lcbo resources and stitch them together
def get_lcbo_api_all resource, params=[]
  all_responses = []
  next_page = 1
  loop do
    response = get_lcbo_api resource, params, next_page
    # add the current result to all the other results
    all_responses.push(*response['result'])
    # get the next page
    next_page = response["pager"]["next_page"]
    break if response["pager"]["is_final_page"].nil? or response["pager"]["is_final_page"]
  end
  puts all_responses.size
  all_responses
end
