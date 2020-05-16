module ControllerMacros
  def login_user(user = nil)
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user] if @request.present?
      user ||= FactoryBot.create(:user)
      # user.confirm!
      sign_in user
    end
  end
end
