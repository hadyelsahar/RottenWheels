class AuthenticationsController < ApplicationController
  def index
    @authentications =    @authentications = current_user.authentications if current_user  
    
  end

  def create
      omniauth = request.env["omniauth.auth"]  
      authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid']) 
       
      #if the user added this authenticatio before then sign in 
      if authentication  
        flash[:notice] = "Signed in successfully."  
        sign_in_and_redirect(:user, authentication.user)  
      
      # if the user didnt add this authentication before but he's an logged  user > add it 
      elsif current_user
        current_user.authentications.create(:provider => omniauth ['provider'], :uid => omniauth['uid'])  
        flash[:notice] = "Authentication successful."  
        redirect_to authentications_url  
        
      #sign up scenario if the user is not an existing user nor signed in ofcourse
      else 
        
        if omniauth.provider.eql? "twitter"
          firstname = omniauth.info.name 
          user = User.new({:firstname => firstname ,:thumbnail => omniauth.info.image})
        else 
          user = User.new({:email => omniauth.info.email,:firstname => omniauth.info.first_name,:lastname => omniauth.info.last_name,:thumbnail => omniauth.info.image})        
        end
        
        user.apply_omniauth(omniauth)  
       
        if user.save  
          flash[:notice] = "Signed in successfully."  
          sign_in_and_redirect(:user, user)  
        else  
          session[:omniauth] = omniauth.except('extra')  
          redirect_to new_user_registration_url  
        end  
      end
  end 

  def destroy
    @authentication = current_user.authentications.find(params[:id])  
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end

