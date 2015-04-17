class StaticPagesController < ApplicationController
  def home

      if logged_in?
      @micropost  = current_user.microposts.build
      #should be as above but somehow I get nil in the @client local variable which trigger an error message in the form afterwards
      @client = Client.new 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end


end
