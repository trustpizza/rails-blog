# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end
Post.delete_all
Element.delete_all
Comment.delete_all
admin = {email: "admin@email.com", password:"123456", password_confirmation:"123456", role: "admin"}
author = {email: "author@email.com", password:"123456", password_confirmation:"123456", role: "author"}

def find_or_create_user(user_attributes)
    user = User.find_or_create_by(email: user_attributes[:email])
    
    if user.persisted?
        return user
    end
    user = User.create!(user_attributes)
    return user
end

commenter1 = {email: 'user1@example.com', password: 'password1', password_confirmation: 'password1'}
commenter2 = {email: 'user2@example.com', password: 'password2', password_confirmation: 'password2'}

admin = find_or_create_user(admin)
author = find_or_create_user(author)
commenter1 = find_or_create_user(commenter1)
commenter2 = find_or_create_user(commenter2)

commenters = [commenter1, commenter2]
# Define how much data to seed
num_of_posts = 6
elements_per_post = 3
comments_per_post = 2

num_of_posts.times do
    img_url = Faker::LoremFlickr.image(size: '800x800', search_terms: ["nature"])
    
    post = author.posts.create!(
        title: Faker::Lorem.sentence(word_count: 6),
        description: Faker::Lorem.paragraph(sentence_count: 4),
        published: true,
        published_at: Time.now
        )
    img_io = URI.open(img_url)
    post.header_image.attach(io:img_io, filename: File.basename(img_url))
    img_io.close

    elements_per_post.times do
        post.elements.create!(
            content: Faker::Lorem.paragraphs(number: 15).join("\n\n"),
            element_type: "paragraph"
        )
        
        element = post.elements.create!(
            element_type: "image",
            )
        img_url = Faker::LoremFlickr.image(size: '1000x1000', search_terms: ["nature"])
        img_io = URI.open(img_url)
        element.image.attach(io:img_io, filename: File.basename(img_url))
    end

    comments_per_post.times do
        commenters.each do |commenter|
            comment = commenter.comments.build(body: Faker::Lorem.sentence(word_count: 12))
            comment.post = post
            comment.save!
        end
    end
end
puts "Seeded #{Post.count} posts with #{Element.count} elements and #{Comment.count} comments."

