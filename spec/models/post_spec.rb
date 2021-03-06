require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe '#created_at_formatted' do
    it 'returns date in Septemper 17, 2015' do
      post = Post.create

      expect(post.created_at_formatted).to eq expected_date
   end
  end

  describe '#by_newest' do
    it 'orders by newest posts' do
      post_from_yesterday = Post.create(created_at: 1.day.ago)
      post_from_today = Post.create(created_at: Time.now)

      expect(Post.by_newest).to start_with [post_from_today, post_from_yesterday]
    end
  end
  private
  def expected_date
    day = '%02d' % Time.now.day
    "#{Time.now.strftime("%B")} #{day}, #{Time.now.year}"
  end
end
