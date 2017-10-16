class Voyage
  include Mappable

  parse 'xml2.voyage.kiev.ua' do
    node name: :offers, model: Offer do
      node name: :hotels, model: Hotel do
        link element: :name, to: :name
        link element: :htc,  to: :htc
      end

      node name: :transpots, model: Transport
    end
  end
end
