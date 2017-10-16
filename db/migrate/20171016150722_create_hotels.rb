class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels, id: :uuid, comment: 'Hotels table' do |t|
      t.uuid     :offer_id,    foreign_key: true,   index: true
      t.string   :beg
      t.string   :end
      t.datetime :name,  comment: 'Name of hotel'
      t.string   :htc,   comment: 'Tour description'
      t.string   :star,  comment: 'Star rate of hotel'
      t.string   :room,  comment: 'Room of hotel'
      t.string   :rmc
      t.string   :place
      t.string   :plc
      t.string   :meal
      t.string   :mlc
      t.string   :town,  comment: 'Town of hotel'
      t.string   :cnt

      t.timestamps null: false
    end
  end
end
