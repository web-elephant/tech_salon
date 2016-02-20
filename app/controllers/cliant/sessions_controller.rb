class Cliant::SessionsController < Cliant::Base
  def new
    if current_cliant
      redirect_to :cliant_root
    else
      @form = Cliant::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Cliant::LoginForm.new(params[:cliant_login_form])
    if @form.email.present?
      cliant = Cliant.find_by(email_for_index: @form.email.downcase)
    end
    if Cliant::Authenticator.new(cliant).authenticate(@form.password)
      if cliant.suspended?
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        session[:cliant_id] = cliant.id
        flash.notice = 'ログインしました。'
        redirect_to :cliant_root
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:cliant_id)
    flash.notice = "ログアウトしました。"
    redirect_to :cliant_root
  end
end
