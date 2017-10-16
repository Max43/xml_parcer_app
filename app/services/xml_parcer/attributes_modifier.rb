module XmlParcer
  class AttributesModifier
    require 'open-uri'
    include Virtus.model

    attribute :url, String, lazy: true, default: :fetch_url
    attribute :xml, Nokogiri::XML::Document, lazy: true, default: :fetch_xml
    attribute :offers, Array

    def fetch_url
      url = open('http://xml2.voyage.kiev.ua/142718.xml')
    end

    def fetch_xml
      xml = Nokogiri::XML(open(url))
      add_encoding(xml_file: xml, encoding: 'utf-8')
      xml
    end

    def add_encoding(xml_file:, encoding:)
      xml_file.encoding = encoding
    end

    def offers
      fetch_xml.xpath("/OFFERS/OFFER")
    end

    # def hotels(offer)
    #   return unless offer.respond_to?('xpath')
    #   offer.xpath("HOTELS/HOTEL")
    # end

    # def transports(offer)
    #   return unless offer.respond_to?('xpath')
    #   offer.xpath("TRANSPORTS/TRANSPORT")
    # end

    # def services(offer)
    #   return unless offer.respond_to?('xpath')
    #   offer.xpath("SERVICES/SERVICE")
    # end

    # def prices(offer)
    #   return unless offer.respond_to?('xpath')
    #   offer.xpath("PRICES/PRICE")
    # end

    def nested_object_fetcher(parent:, iterable_obj:)
      return unless parent.respond_to?('xpath')
      parent.xpath(iterable_obj.to_s)
    end

    def specific_xml_iterator(iterable_array:)
      iterable_array = nested_object_fetcher(parent: iterable_array, iterable_obj: "HOTELS/HOTEL")
      xml_iterator(iterable_array)
    end

    def xml_iterator(iterable_array)
      iterable_array.each_with_object([]) do |iterable_obj, iterable_objects_hash|
        iterable_obj_hash = Hash.new;
        iterable_obj.map{ |k, v| iterable_obj_hash.merge!("#{k}": v) }
        iterable_objects_hash << iterable_obj_hash
      end
    end
  end
end
