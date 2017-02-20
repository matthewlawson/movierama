class MovieMailer < ActionMailer::Base
  default from: ENV.fetch('NOTIFICATION_FROM_EMAIL')
 
  def like_or_hate_email(movie, like_or_hate)
    @movie  = movie
    @like_or_hate = like_or_hate
    
    @user = User[movie.user_id]
    subject = if like_or_hate == :like then "Your movie has a new like :)" else "Your movie has a new hate :(" end
    mail(to: @user.email, subject: subject)
  end
end
