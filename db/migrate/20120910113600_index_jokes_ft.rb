class IndexJokesFt < ActiveRecord::Migration
  def up
    execute <<-SQL
      create index index_jokes_on_title_ft on jokes using gin(to_tsvector('english', title));
      create index index_jokes_on_body_ft on jokes using gin(to_tsvector('english', body));
      create index index_jokes_on_advice_ft on jokes using gin(to_tsvector('english', advice));
    SQL
  end

  def down
    execute <<-SQL
      drop index index_jokes_on_title_ft;
      drop index index_jokes_on_body_ft;
      drop index index_jokes_on_advice_ft;
    SQL
  end
end
