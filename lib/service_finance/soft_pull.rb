require 'httparty'

module ServiceFinance
  class SoftPull
    include HTTParty

    base_uri 'http://www.sfcstu.com'
    SERVICE = "/Authenticate"
    attr_accessor :request

    def initialize company, account, password
      @company = company
      @account = account
      @password = password
    end

    def qualify opts
      self.request = self.class.post '/service.asp', query: {
        'MM_UserCompany' => @company,
        'CompAccount' => @account,
        'CompPassword' => @password,

        firstname: opts[:first_name],
        lastname: opts[:last_name],
        streetnum: opts[:street_number],
        address: opts[:address],
        streettype: opts[:street_type],
        city: opts[:city],
        state: opts[:state_abbr],
        zip: opts[:zip]
      }

      extract_color self.request.response.body
    end


    private
    def extract_color(html_body)
      matching_color_regex
        .match(html_body)
        .captures
        .first
    end

    def matching_color_regex
      /<COLOR>(.+)<\/COLOR>/
    end

  end
end

