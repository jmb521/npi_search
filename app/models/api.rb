class Api < ApplicationRecord

    def self.get_provider_by_number(number)
        response = HTTParty.get("https://npiregistry.cms.hhs.gov/api/?number=#{number}&version=2.1")
        JSON.parse(response.body)
    end
end
