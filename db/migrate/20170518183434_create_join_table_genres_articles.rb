class CreateJoinTableGenresArticles < ActiveRecord::Migration[5.0]
  def change
    create_join_table :genres, :articles do |t|
      t.index [:genre_id, :article_id]
      t.index [:article_id, :genre_id]
    end
  end
end
