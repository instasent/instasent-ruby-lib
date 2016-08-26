require "instasent/version"
require "net/https"
require "json"

module Instasent
  class Client

    @@rootEndpoint = "http://api.instasent.com/"
    @@secureChannel = "https://api.instasent.cdfom/"
    @@use_secure_channel = TRUE

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

    def request_verify(sender, to, text, token_length = '', timeout = '', client_id='')

      if @@use_secure_channel
        url = @@secureChannel + "verify/"
      else
        url = @@rootEndpoint + "verify/"
      end

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

      response = self.execute_request(url, http_method, data)

      return response

    end

    def check_verify(id, token)

      if @@use_secure_channel
        url = @@secureChannel + 'verify/' + id + '?token=' + token
      else
        url = @@rootEndpoint + 'verify/' + id + '?token=' + token
      end

      http_method = 'GET'

      response = self.execute_request(url, http_method, {})

      return response

    end

    def get_verify_by_id(id)

      if @@use_secure_channel
        url = @@secureChannel + 'verify/' + id
      else
        url = @@rootEndpoint + 'verify/' + id
      end

      http_method = 'GET'

      response = self.execute_request(url, http_method, {})

      return response

    end

    def get_verify(page=1, per_page=10)

      if @use_secure_channel
        url = @@secureChannel + 'verify/?page=' + page.to_s + 'per_page=' + per_page.to_s
      else
        url = @@rootEndpoint + 'verify/?page=' + page.to_s + 'per_page=' + per_page.to_s
      end

      http_method = 'GET'

      response = self.execute_request(url, http_method)

      return response

    end

    def do_lookup(to)

      url =  if @use_secure_channel then @@secureChannel + 'lookup/' else @@rootEndpoint + 'lookup/' end
      http_method = 'POST'
      data = {'to' => to}

      response = self.execute_request(url, http_method, data)

      return response

    end

    def get_lookup_by_id(id)

      url =  if @use_secure_channel then @@secureChannel + 'lookup/' + id else @@rootEndpoint + 'lookup/' + id end
      http_method = 'GET'
      response = self.execute_request(url, http_method, {})

      return response

    end

    def get_lookups(page=1, per_page=10)

      if @use_secure_channel
        url = @@secureChannel + 'lookup/?page=' + page.to_s + 'per_page=' + per_page.to_s
      else
        url = @@rootEndpoint + 'lookup/?page=' + page.to_s + 'per_page=' + per_page.to_s
      end

      http_method = 'GET'

      response = self.execute_request(url, http_method)

      return response

    end

    def get_account_balance

      url =  if @use_secure_channel then @@secureChannel + 'organization/account/' else @@rootEndpoint + 'organization/account/' end
      http_method = 'GET'
      response = self.execute_request(url, http_method, {})

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
      req.add_field("Accept", "application/json")
      req.add_field("Content-Type", "application/json")

      res = Net::HTTP.start(url_parsed.host, url_parsed.port) { |http|
        http.request(req)
      }

      return {'response_body' => res.body, 'response_code' => res.code}

    end

  end


end
