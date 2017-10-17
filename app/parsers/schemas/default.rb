module Schemas
  class Default
    include Mappable

    map xpath: :offers do
      node xpath: :offer, model: Offer do
        %i(operator spo adl date tour chd currency country).each do |attribute|
          link attribute: attribute
        end

        node xpath: :hotels do
          node xpath: :hotel, relation: :hotels, via: :has_many do
            %i(beg end name htc star room rmc place plc meal mlc town cnt).each do |attribute|
              link attribute: attribute
            end
          end
        end

        node xpath: :transports do
          node xpath: :transport, relation: :transports, via: :has_many do
            %i(beg end name trc place townfr townto cnt).each do |attribute|
              link attribute: attribute
            end
          end
        end

        node xpath: :services do
          node xpath: :service, relation: :services, via: :has_many do
            %i(beg end name cnt).each do |attribute|
              link attribute: attribute
            end
          end
        end

        node xpath: :prices do
          node xpath: :price, relation: :prices, via: :has_many do
            %i(date n val).each do |attribute|
              link attribute: attribute
            end

            link attribute: :id, column: :remote_id
          end
        end
      end
    end
  end
end
