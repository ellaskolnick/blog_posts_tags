require 'post_repository'

RSpec.describe PostRepository do
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
