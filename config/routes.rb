Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:user_id", { :controller => "users", :action => "user_details" })
  get("/add_user", { :controller => "users", :action => "new_user" })
  get("/update_user/:user_id", { :controller => "users", :action => "update_user" })

  get("/photos", { :controller => "photo", :action => "index" })
  get("/photos/:photo_id", { :controller => "photo", :action => "photo_details" })
  get("/delete_photo/:photo_id", { :controller => "photo", :action => "delete" })
  get("/add_photo", { :controller => "photo", :action => "add" })
  get("/add_comment", { :controller => "photo", :action => "new_comment" })
  get("/edit_photo/:photo_id", { :controller => "photo", :action => "update_photo" })

end
