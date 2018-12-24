RSpec.describe 'static_pages home, signed in', type: :view do
  include Devise::TestHelpers
  before(:each) do
    @user = build(:user)
    sign_in(@user)
  end

  it 'should display the correct links when signed in' do

    visit root_path

    # links which persist in both states
    expect(page).to have_link('CONFLAGRATION', href: root_path, count: 1)

    # links which drop out after login
    expect(page).not_to have_link('Login', href: new_user_session_path)
    expect(page).not_to have_link('Sign up', href: new_user_registration_path)
  end
end

