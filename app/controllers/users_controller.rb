class UsersController < ApplicationController

  def index

    @user_array = User.all
    @user_ordered = @user_array.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })

  end

end
