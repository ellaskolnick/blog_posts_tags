require 'post_repository'

def reset_posts_table
  seed_sql = File.read('/Users/ellaskolnick/MakersProjects/databases/resources/seeds/blog_posts_tags.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_tags_test' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do
    reset_posts_table
  end

  it "finds posts tagged with 'coding'" do
    repo = PostRepository.new
    tag = repo.find_by_tag('coding')
    posts = tag.posts

    expect(posts.length).to eq 4
    expect(posts.first.title).to eq "How to use Git"
    expect(posts[1].title).to eq "Ruby classes"
    expect(posts[2].id).to eq "3"
    expect(posts.last.title).to eq "SQL basics"
    expect(posts.last.id).to eq "7"
  end
end
