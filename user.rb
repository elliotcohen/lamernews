DataMapper.setup(:default, {:adapter  => "redis"})

class User
  include DataMapper::Resource
  property :id, Serial
  property :username
  property :password
  property :ctime
  property :karma, Integer
  property :about
  property :email
  property :auth
  property :apisecret
  property :flags
  property :karma_incr_time
  
  def increment_user_karma_by(increment)
    self.karma += increment
    self.save
  end
end

DataMapper.finalize
DataMapper.auto_upgrade!

use OmniAuth::Strategies::Twitter, TwitterConsumerKey, TwitterConsumerSecret
