Given(/^a user exists with the following details:$/) do |users|
  users.hashes.each do |user|
    User.create(user)
  end
end
