module Requests
  module JsonHelpers
    def json
      begin
        @json ||= JSON.parse(response.body)
      rescue
        Rails.configuration.x.logger.debug "Couldn't parse JSON '#{response.body}'"
        raise
      end
    end
  end

  module HttpHelpers
    def my_get path, *args
      get "http://api.localhost.dev/#{path}", *args
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::HttpHelpers, type: :request
end
