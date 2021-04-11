class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :blog, foreign_key:true
      t.string :src
      t.timestamps
    end
  end
end




<% search_results = Unsplash::Photo.search("query", page = 1, per_page = 5,) %>
        <% search_results.each do |s_r| %>
        <%= image_tag s_r.track_download%>
        <%= s_r.track_download %> 
        <% end %>