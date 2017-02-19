require 'spec_helper'
#https://blog.lucascaton.com.br/index.php/2010/10/25/how-to-test-mailers-in-rails-3-with-rspec/

RSpec.describe MovieMailer, type: :mailer do
  describe '.like_or_hate_email' do
    before :all do
      @author = User.create(
        uid: 'matty',
        name: 'Matthew',
        email: 'movierama_fan@gmail.com'
      )
      @movie = Movie.create(
        title: 'Attack of the clones',
        date: Time.now(),
        description: 'The best Star wars Episode ever',
        user: @author
      )
      @mail =  described_class.like_or_hate_email(@movie, :like).deliver 

    end
    
    context 'User likes Movie'
      it 'renders the subject' do
        expect(@mail.subject).to eq('Your movie has a new like :)')
      end

      it 'sent to the authors email' do
        expect(@mail.to).to eq([@author.email])
      end

      it 'sent from correct senders address' do
        expect(@mail.from).to eq([ENV.fetch('NOTIFICATION_FROM_EMAIL')])
      end

      it 'name of movie is in email body' do
        expect(@mail.body.encoded).to match(@movie.title)
      end

      it 'correct user name is in email body' do
        expect(@mail.body.encoded).to match(@movie.user.name)
      end
  end
end