class CreateSearchCaches < ActiveRecord::Migration
  def change
    create_table :search_caches do |t|
      t.string :query
      t.string :response

      t.timestamps null: false
    end
  end
end
