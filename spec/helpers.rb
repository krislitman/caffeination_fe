module Helpers
  def log_in(user)
    visit log_in_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
  end
end
