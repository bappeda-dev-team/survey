alias Survey.Repo
alias Survey.Accounts.User

# test user
# TODO: delete user
password = "random_password_123"

Repo.insert!(%User{
  email: "admin@test.com",
  password: password,
  hashed_password: Bcrypt.hash_pwd_salt(password)
})
