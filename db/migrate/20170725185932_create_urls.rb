class CreateUrls < ActiveRecord::Migration[4.2]
  def change
    create_table :urls do |t|
      t.string    :short_url
      t.string    :long_url
      t.integer   :click_count, default: 0
    end
  end
end
