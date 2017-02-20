require 'rails_helper'
RSpec.describe MailWorker, :type => :worker do
  before do
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
  end

  it 'increases queue size when called' do
    expect {
      MailWorker.perform_async(@movie, :like)
    }.to change(MailWorker.jobs, :size).by(1)
    
  end

  after do
    @movie.delete()
  end
end
