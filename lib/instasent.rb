require "instasent/version"
require "net/https"
require "json"

module Instasent
  class Client
    @@secureChannel = "https://api.instasent.cdfom/"

    def initialize(token)
      @@token = token
    end

    def send_sms(sender, to, text, client_id='')
      url = @@secureChannel + "sms/"

      http_method = 'POST'

      data = {'from' => sender, 'to' => to, 'text' => text}

      execute_request(url, http_method, data)
    end

    def get_sms(page=1, per_page=10)
      url = @@secureChannel + "sms/?page=" + page.to_s + "per_page=" + per_page.to_s

      http_method = 'GET'

      execute_request(url, http_method)
    end

    def get_sms_by_id(id)
      url = @@secureChannel + 'sms/' + id

      http_method = 'GET'

      execute_request(url, http_method)
    end

    def request_verify(sender, to, text, token_length = '', timeout = '', client_id='')
      url = @@secureChannel + "verify/"

      http_method = 'POST'
      data = {'sms' => {'from' => sender, 'to' => to, 'text' => text}}

      # if token_length != ''
      #    data['tokenLength'] =  token_length
      # end
      #
      # if timeout != ''
      #   data['timeout'] =  timeout
      # end
      #
      # if client_id != ''
      #   data['clientId'] =  client_id
      # end

      execute_request(url, http_method, data)
    end

    def check_verify(id, token)
      url = @@secureChannel + 'verify/' + id + '?token=' + token

      http_method = 'GET'

      execute_request(url, http_method, {})
    end

    def get_verify_by_id(id)
      url = @@secureChannel + 'verify/' + id

      http_method = 'GET'

      execute_request(url, http_method, {})
    end

    def get_verify(page=1, per_page=10)
      url = @@secureChannel + 'verify/?page=' + page.to_s + 'per_page=' + per_page.to_s

      http_method = 'GET'

      execute_request(url, http_method)
    end

    def do_lookup(to)
      url =  @@secureChannel + 'lookup/'
      http_method = 'POST'
      data = {'to' => to}

      execute_request(url, http_method, data)
    end

    def get_lookup_by_id(id)
      url =  @@secureChannel + 'lookup/' + id
      http_method = 'GET'
      execute_request(url, http_method, {})
    end

    def get_lookups(page=1, per_page=10)
      url = @@secureChannel + 'lookup/?page=' + page.to_s + 'per_page=' + per_page.to_s

      http_method = 'GET'

      execute_request(url, http_method)
    end

    def get_account_balance
      url =  @@secureChannel + 'organization/account/'
      http_method = 'GET'
      execute_request(url, http_method, {})
    end

    private

    def execute_request(url='', http_method='', data='')
      url_parsed = URI.parse(url)

      if http_method=='GET'
        req = Net::HTTP::Get.new(url_parsed.to_s)
      else
        req = Net::HTTP::Post.new(url_parsed.to_s, initheader = {'Content-Type' => 'application/json'})
        req.body = data.to_json
      end

      req.add_field("Authorization", "Bearer "+@@token.to_s)
      req.add_field("Accept", "application/json")
      req.add_field("Content-Type", "application/json")

      res = Net::HTTP.start(url_parsed.host, url_parsed.port) { |http|
        http.request(req)
      }

      {'response_body' => res.body, 'response_code' => res.code}
    end
  end
end
