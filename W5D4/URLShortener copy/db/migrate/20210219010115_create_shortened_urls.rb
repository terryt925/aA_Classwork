class CreateShortenedUrls < ActiveRecord::Migration[5.2]


  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null:false, unique:true
      t.string :short_url, null:false, unique:true
      t.integer :user_id, null:false
      t.timestamps
    end

    add_index :shortened_urls, :short_url, :long_url, :user_id, unique:true

  end


end


      # t.string :long_url, null:false
      # t.string :short_url, null:false
      # t.string :user, null:false