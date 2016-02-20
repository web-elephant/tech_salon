class Admin::SessionsController < Admin::Base

  def new
    if current_admin
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      admin = Admin.find_by(email_for_index: @form.email.downcase)
    end
    if Admin::Authenticator.new(admin).authenticate(@form.password)
      if admin.suspended?
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        session[:admin_id] = admin.id
        flash.notice = 'ログインしました。'
        redirect_to :admin_root
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:admin_id)
    flash.notice = "ログアウトしました。"
    redirect_to :admin_root
  end
end
