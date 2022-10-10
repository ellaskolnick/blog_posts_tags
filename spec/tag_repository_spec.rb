require 'tag_repository'

RSpec.describe TagRepository do
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
