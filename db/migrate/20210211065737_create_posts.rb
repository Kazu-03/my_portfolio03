class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,     null:false,  comment: 'タイトル'
      t.text   :overview,  null:false,  comment: '概要'
      t.string :target,    null:false,  comment: '対象'
      t.string :method,    null:false,  comment: '方法'
      t.string :reward,    null:false,  comment: '報酬'

      t.timestamps
    end
  end
end
