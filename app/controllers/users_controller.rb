class UsersController < ApplicationController

  def index

    @user_array = User.all
    @user_ordered = @user_array.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })

  end

  def user_details

    @user_id = params.fetch("user_id")
    @matching_user = User.where({ :username => @user_id })[0]
    
    @photos_by_user = Photo.where({ :owner_id => @matching_user.id })

    render({ :template => "user_templates/user_details.html.erb" })

  end

  def new_user
    # Parameters: {"new_username"=>"test"}

    new_username = params.fetch("new_username")

    add_user = User.new
    add_user.username = new_username
    add_user.save

    redirect_to("/users/#{add_user.username}")

  end

  def update_user
    #Parameters: {"new_username"=>"chi2", "user_id"=>"114"}

    user_id_to_update = params.fetch("user_id")
    new_username = params.fetch("new_username")

    user_to_update = User.where({ :id => user_id_to_update})[0]
    user_to_update.username = new_username
    user_to_update.save

    redirect_to("/users/#{user_to_update.username}")

  end


end
