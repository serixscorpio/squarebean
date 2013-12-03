require 'net/http'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    url = URI("https://api.mailgun.net/v2/address/validate")
    url.query = URI.encode_www_form("address" => value)
    req = Net::HTTP::Get.new(url.to_s)
    req.basic_auth 'api', 'pubkey-9pwfrgjno64r2ztjmgq740bx40e1sdf8'
    res = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') { |http| 
      http.request(req)
    }
    record.errors[attribute] << "Email address is invalid" unless JSON.parse(res.body)["is_valid"]
  end
end

