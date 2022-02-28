class Provider < ApplicationRecord
    has_many :addresses
    
    scope :order_by_created_at, -> {order(created_at: :desc)}
    def self.get_provider(number)
        
        provider = Api.get_provider_by_number(number)
        if !provider["Errors"] && !provider["results"].empty?
            updated_provider = provider["results"][0]
            basic = updated_provider["basic"]
            taxonomy = updated_provider["taxonomies"][0]
            new_provider = self.new do |p|
                p.npi = updated_provider["number"]
                p.first_name = basic["first_name"]
                p.last_name = basic["last_name"]
                p.gender = basic["gender"]
                p.prefix = basic["name_prefix"]
                p.credential = basic["credential"]
                p.status = basic["status"]
                p.last_updated = basic["last_updated"]
                p.enumeration_type = updated_provider["enumeration_type"]
                p.taxonomy = taxonomy["desc"]
            end
            address = updated_provider["addresses"]
            address.each do |addr|

                a = Address.find_or_initialize_by(address_1: addr["address_1"])
                a.address_2 = addr["address_2"]
                a.city = addr["city"]
                a.state = addr["state"]
                a.country_code = addr["country_code"]
                a.postal_code = addr["postal_code"]
                
                new_provider.addresses << a
            end
            new_provider.save
        else
            nil
            
        end
    end
end
