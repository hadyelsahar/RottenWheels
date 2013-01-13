class RegistrationsController <  Devise::RegistrationsController 
  def create  
  super  
    if  session[:omniauth] != nil
      omniauth =  session[:omniauth]
      @user.firstname = omniauth.info.name
      @user.thumbnail = omniauth.info.image
      @user.save
    end
  
  session[:omniauth] = nil unless @user.new_record?   
  end  
  
  
  def update  
    
    @user = User.find(current_user.id)
    
    if params[:user][:current_password].eql? @user.password or !@user.password_required?
   
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      
      successfully_updated = @user.update_without_password(params[:user])
      
      if successfully_updated
        set_flash_message :notice, :updated
        
        # Sign in the user bypassing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to after_update_path_for(@user)
      else
        render "edit"
      end
      
    else 
        render "edit"
    end 
  end
  
 
 

  private  
  def build_resource(*args)  
    super  
    if session[:omniauth]  
      @user.apply_omniauth(session[:omniauth])  
      @user.valid?  
    end  
  end
  
 
end
