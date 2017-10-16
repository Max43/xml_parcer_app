class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services, id: :uuid, comment: 'Services table' do |t|
      t.uuid     :offer_id,    foreign_key: true,   index: true
      t.string   :beg
      t.string   :end
      t.datetime :type
      t.string   :name,  comment: 'Name service'
      t.string   :cnt

      t.timestamps null: false
    end
  end
end
