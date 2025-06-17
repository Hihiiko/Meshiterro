class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  #device利用機能（ユーザ登録、ログイン認証など）が使われる前に
  #configure_permitted_parametersメソッドが実行されます。↓
  
  def after_sign_in_path_for(resource) #after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッドです
    about_path                          #after_sign_in_path_forは、Deviseの初期設定ではroot_pathになっています。サインイン後にルートパスに遷移していたのはこのためです。
                                         # 上記のような記述をすることで、初期設定を上書きすることができます。
  end

  def aboutfter_sign_out_path_for(resource) #サインアウト後
    about_path
  end


  protected

  def configure_permitted_parameters    #configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
                                          #ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end

