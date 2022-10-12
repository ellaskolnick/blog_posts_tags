require 'tag_repository'

def reset_tags_table
  seed_sql = File.read('/Users/ellaskolnick/MakersProjects/databases/resources/seeds/blog_posts_tags.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_tags_test' })
  connection.exec(seed_sql)
end

RSpec.describe TagRepository do
  before(:each) do
    reset_tags_table
  end

  it "finds tags attached to first post" do
    repo = TagRepository.new
    post = repo.find_by_post(1)
    tags = post.tags

    expect(tags.length).to eq 1
  end

  it "finds tags attached to second post" do
    repo = TagRepository.new
    post = repo.find_by_post(2)
    tags = post.tags

    expect(tags.length).to eq 2
  end
end
