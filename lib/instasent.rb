require "instasent/version"
require "net/https"
require "json"

module Instasent
  class Client

    @@rootEndpoint = "http://api.instasent.com/"
    @@secureChannel = "https://api.instasent.com/"
    @@use_secure_channel = true

    def initialize(token, use_secure_channel=true)
      @@token = token
      @@use_secure_channel = use_secure_channel
    end

    def send_sms(sender, to, text, client_id='')

      if @use_secure_channel
        url = @@secureChannel + "sms/"
      else
        url = @@rootEndpoint + "sms/"
      end

      http_method = 'POST'

      data = {'from' => sender, 'to' => to, 'text' => text}

      response = self.execute_request(url, http_method, data)

      return response

    end

    def get_sms(page=1, per_page=10)

      if @use_secure_channel
        url = @@secureChannel + "sms/?page=" + page.to_s + "per_page=" + per_page.to_s
      else
        url = @@rootEndpoint + "sms/?page=" + page.to_s + "per_page=" + per_page.to_s
      end

      http_method = 'GET'

      response = self.execute_request(url, http_method)

      return response

    end

    def get_sms_by_id(id)

      if @@use_secure_channel
        url = @@secureChannel + 'sms/' + id
      else
        url = @@rootEndpoint + 'sms/' + id
      end

      http_method = 'GET'

      response = self.execute_request(url, http_method)

      return response

    end

    def execute_request(url='', http_method='', data='')

      url_parsed = URI.parse(url)

      if http_method=='GET'
        req = Net::HTTP::Get.new(url_parsed.to_s)
      else
        req = Net::HTTP::Post.new(url_parsed.to_s, initheader = {'Content-Type' => 'application/json'})
        req.body = data.to_json
      end

      req.add_field("Authorization", "Bearer "+@@token.to_s)

      res = Net::HTTP.start(url_parsed.host, url_parsed.port) { |http|
        http.request(req)
      }

      return {'response_body' => res.body, 'response_code' => res.code}

    end

  end


end
