class FriendsController < ApplicationController
  
  def index
    
    # array = []
    # arraytext = []
  
    
    # client = Twitter::REST::Client.new do |config|
    #   config.consumer_key        = "vxqqi7E2pjKY4OsfwqO6sRERx"
    #   config.consumer_secret     = "xP8LNHVlADlnEgNkfhVkTL0wnUWAEqeh46lOT9BjVXv4BCpCNr"
    #   config.access_token        = "780980557731598336-GqlLLxhVq78gKlZGq6IxEPgc1ez0wN9"
    #   config.access_token_secret = "oT6LE4sFmGrSdnFuNrfSsvXTYYauSoYYvOuXnZoDlkTla"
    # end
    
    # query = "hcs"
    # since_id = nil
    # # count : 取得する件数
    # # result_type : 内容指定。recentで最近の内容、popularで人気の内容。
    # # exclude : 除外する内容。retweetsでリツイートを除外。
    # # since_id : 指定ID以降から検索だが、検索結果が100件以上の場合は無効。
    # result_tweets = client.search(query, count: 10, result_type: "recent", exclude: "retweets", since_id: since_id)
    
    # result_tweets.take(10).each_with_index do |tw, i|
    #   array.push "#{tw.user.screen_name}"
    #   arraytext.push "#{tw.full_text}"
    #   # puts "#{tw.media.first.expanded_url.to_s}"
    # end
    # @twitter = arraytext
    # @twittertext = array
    
    #@userid = friend.find_by()
    #@friendid = friend.find_by(id: 1)
    #@name = friend.find_by()
    
    array = []
    arraytext = []
    
    #@userid.each do |id|
    # array.push id
    #end
    
    #@name.each do |name|
    #  arraytext.push name
    #end

    
     @users = User.all

    @twitter = arraytext
    @twittertext = array
    # @user=User.where("name like '%" + search + "%'")
    # String @datas = @user
    @datas=[]
    return @datas
    


  end
    
    def create
      @users = User.all
      if request.post? then
      search = params[:search]
       @user=User.where("name like '%" + search + "%'")
      end
       String @datas = @user
      return @datas
    end
end
