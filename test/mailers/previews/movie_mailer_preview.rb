#Preview mails in browser
require 'dotenv'
Dotenv.load! '.env.test'

# https://movierama.dev/rails/mailers/movie_mailer/like_email
class MovieMailerPreview < ActionMailer::Preview
  def like_email    
    @movie = Movie[2]
    email = MovieMailer.like_or_hate_email(@movie, :like)
    email
  end
# https://movierama.dev/rails/mailers/movie_mailer/hate_email
  def hate_email    
    @movie = Movie[2]
    email = MovieMailer.like_or_hate_email(@movie, :hate)
    email
  end

#   def _setup
#     @movie = Movie[2]
#     puts @movie.inspect
#   end
#   def _teardown
#     @movie.delete()
#   end
end