require 'post'
require 'tag'
require 'database_connection'

class TagRepository
  def find_by_post(post_id)
    sql = 'SELECT posts.id,
                  posts.title,
                  tags.id AS tag_id,
                  tags.name AS tag_name
           FROM posts
           JOIN posts_tags ON posts_tags.post_id = posts.id
           JOIN tags ON tags.id = posts_tags.tag_id
           WHERE posts.id = $1;'
    params = [post_id]
    result = DatabaseConnection.exec_params(sql, params)

    post = Post.new

    post.id = result.first['id']
    post.title = result.first['title']

    result.each do |record|
      tag = Tag.new
      tag.id = record['tag_id']
      tag.name = record['tag_name']

      post.tags << tag
    end

    post
  end
end
