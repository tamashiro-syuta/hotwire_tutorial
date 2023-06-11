class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  # NOTE: プログレスバーを表示や挙動を確認する際にコメントアウトを解除する
  # before_action -> { sleep 3 }

  private

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
end
