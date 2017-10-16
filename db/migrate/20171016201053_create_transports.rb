class CreateTransports < ActiveRecord::Migration[5.1]
  def change
    create_table :transports, id: :uuid, comment: 'Transports table' do |t|
      t.uuid     :offer_id,    foreign_key: true,   index: true
      t.string   :beg
      t.string   :end
      t.datetime :type
      t.string   :name,  comment: 'Name transport company'
      t.string   :trc
      t.string   :class, comment: 'Class of transport'
      t.string   :place, comment: 'Palce of transport'
      t.string   :townfr, comment: 'Go from town'
      t.string   :townto, comment: 'Go to town'
      t.string   :cnt

      t.timestamps null: false
    end
  end
end
