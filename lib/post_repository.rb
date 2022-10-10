require 'post'
require 'tag'
require 'database_connection'

class PostRepository
  def find_by_tag(tag_name)
    sql = 'SELECT posts.id,
                  posts.title,
                  tags.id AS tag_id,
                  tags.name AS tag_name
           FROM posts
           JOIN posts_tags ON posts_tags.post_id = posts.id
           JOIN tags ON tags.id = posts_tags.tag_id
           WHERE tags.name = $1;'
    params = [tag_name]
    result = DatabaseConnection.exec_params(sql, params)

    tag = Tag.new

    tag.id = result.first['tag_id']
    tag.name = result.first['tag_name']

    result.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']

      tag.posts << post
    end

    tag
  end
end
