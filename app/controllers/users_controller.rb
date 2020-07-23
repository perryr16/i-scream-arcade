class UsersController < ApplicationController 

  def show
    @user = current_user if current_user 
    @user = backup_user  if !current_user
  end

  private

  def backup_user 
    binding.pry
    User.create!(
      name: "George Washington",
      google_token: "123344567dgafgarga",
      email: "george@delaware.com",
      photo: "https://www.americanhistorycentral.com/wp-content/uploads/2016/08/george-washington-portrait-843x1024.jpg"
    )
  end 
  
end