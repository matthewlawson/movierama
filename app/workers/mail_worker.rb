class MailWorker
  include Sidekiq::Worker

  def perform(movie, like_or_hate)
    MovieMailer.like_or_hate_email(movie, like_or_hate).deliver
  end
end
