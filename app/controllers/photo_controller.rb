class PhotoController < ApplicationController

  def index

    @all_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos_templates/index.html.erb" })

  end

  def photo_details

    photo_id = params.fetch("photo_id")
    @matching_photo = Photo.where( :id => photo_id )[0]

    render({ :template => "photos_templates/photo_details.html.erb"})

  end

  def delete

    photo_id = params.fetch("photo_id")
    matching_photo = Photo.where( :id => photo_id )[0]
    matching_photo.destroy

    # render({ :template => "photos_templates/delete.html.erb"})

    redirect_to("/photos")

  end

  def add

    #Parameters: {"img_url"=>"https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/285px-FC_Barcelona_%28crest%29.svg.png", "caption"=>"Barcelona rocks", "user_id"=>"82"}

    new_img_url = params.fetch("img_url")
    new_caption = params.fetch("caption")
    user_id = params.fetch("user_id")

    new_photo = Photo.new
    new_photo.image = new_img_url
    new_photo.caption = new_caption
    new_photo.owner_id = user_id
    new_photo.save

    redirect_to("/photos/#{new_photo.id}")

  end

  def new_comment

    #Params: {"photo_id"=>"951", "author_id"=>"81", "comment"=>"Test"}

    photo_id = params.fetch("photo_id")
    author_id = params.fetch("author_id")
    comment = params.fetch("comment")

    #  id         :integer          not null, primary key
    #  body       :text
    #  created_at :datetime         not null
    #  updated_at :datetime         not null
    #  author_id  :integer
    #  photo_id   :integer
    
    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = author_id
    new_comment.body = comment
    new_comment.save

    redirect_to("/photos/#{photo_id}")

  end



  def update_photo

    # Parameters: {"img_url"=>"https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/285px-FC_Barcelona_%28crest%29.svg.png", "caption"=>"Barcelona rocks", "photo_id"=>"951"}

    new_img_url = params.fetch("img_url")
    new_caption = params.fetch("caption")
    photo_id = params.fetch("photo_id")

    #  id             :integer          not null, primary key
    #  caption        :text
    #  comments_count :integer
    #  image          :string
    #  likes_count    :integer
    #  created_at     :datetime         not null
    #  updated_at     :datetime         not null
    #  owner_id       :integer
    
    img_to_update = Photo.where({ :id => photo_id })[0]
    img_to_update.image = new_img_url
    img_to_update.caption = new_caption
    img_to_update.save

    redirect_to("/photos/#{img_to_update.id}")

  end

end
