class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers, id: :uuid, comment: 'Offers table' do |t|
      t.string   :operator, comment: 'Tour operator name'
      t.string   :spo, comment:      'Code of special price offer'
      t.datetime :date, comment:     'Date of offer'
      t.string   :tour, comment:     'Tour description'
      t.string   :adl
      t.string   :chd
      t.string   :inf
      t.string   :currency, comment: 'Currency of offer'
      t.string   :country, comment: 'Country of offer'

      t.timestamps null: false
    end
  end
end
