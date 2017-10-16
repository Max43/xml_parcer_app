class Prices < ActiveRecord::Migration[5.1]
  def change
    create_table :services, id: :uuid, comment: 'Hotels table' do |t|
      t.uuid     :offer_id,    foreign_key: true,   index: true
      t.integer  :remote_id
      t.string   :date
      t.string   :n
      t.datetime :val

      t.timestamps null: false
    end
  end
end
