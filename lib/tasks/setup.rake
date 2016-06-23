namespace :setup do
  desc "makes an admin user based on application.yml settings"
  task make_admin: :environment do
    user = User.find_or_create_by(email: ENV['admin_email'])
    user.password = ENV['admin_password']
    user.admin = true
    user.save
  end
end
