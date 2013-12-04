require 'net/http'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    url = URI(Figaro.env.mailgun_email_validation_api_protocol + Figaro.env.mailgun_email_validation_api_path)
    url.query = URI.encode_www_form(Figaro.env.mailgun_email_validation_param_name => value)
    req = Net::HTTP::Get.new(url.to_s)
    req.basic_auth Figaro.env.mailgun_email_validation_id, Figaro.env.mailgun_email_validation_key
    res = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') { |http| 
      http.request(req)
    }
    record.errors[attribute] << "Email address is invalid" unless JSON.parse(res.body)["is_valid"]
  end
end

