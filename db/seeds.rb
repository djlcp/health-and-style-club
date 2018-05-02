# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin.create email: 'admin@admin.com', password: 'password'

# An example post and four items of example content with joins
#    to demonstrate post_content functionality

example_post = Post.create(title: 'An Example Post with Content', body_text: 'In this exciting example post, we are going to add some awesome content for your enjoyment.', user_id: 1)

text_content = Content.create(content_type: 1, description: 'This is a piece of content that we can use in posts. It is a chunky chunk of text. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
video_content = Content.create(content_type: 2, description: 'Video of kerazy cats.', file_url: "https://player.vimeo.com/video/20732587")
image_content = Content.create(content_type: 3, description: 'Yoga photo', file_url: "https://healthandstyleclub.com/wp-content/uploads/2017/09/10things-pic.png")
link_content = Content.create(content_type: 4, description: 'What does dress down really mean in the corporate office?', file_url: 'https://healthandstyleclub.com/2018/03/22/dress-really-mean-corporate-office/')

PostContent.create(post: example_post, content: video_content, order: 1)
PostContent.create(post: example_post, content: text_content, order: 2)
PostContent.create(post: example_post, content: image_content, order: 3)
PostContent.create(post: example_post, content: link_content, order: 4)
