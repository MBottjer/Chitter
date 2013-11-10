Given(/^a User exists with the following details:$/) do |users|
  users.hashes.each do |user|
    User.create(user)
  end
end

