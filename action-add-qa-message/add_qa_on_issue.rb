# frozen_string_literal: true
require 'net/http'
require 'json'

github_event = JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))

return unless github_event['action'] == 'created'

body = File.read('/github/workspace/action-add-qa-message/qa_list.md')

github_token = ENV['GITHUB_TOKEN']
api_version = 'v3'
header = {
  'Accept': "application/vnd.github.#{api_version}+json",
  'Authorization': "token #{github_token}"
}

issue_number = github_event['issue']['number']
repo = ENV['GITHUB_REPOSITORY']

uri = URI.parse("https://api.github.com/repos/#{repo}/issues/#{issue_number}/comments")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = { body: body }.to_json

response = http.request(request)
print response.body
