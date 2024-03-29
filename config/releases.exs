import Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :website, WebsiteWeb.Endpoint,
  url: [host: "julienurraca.com"],
  https: [
    port: 8443,
    cipher_suite: :strong,
    otp_app: :website,
    keyfile: System.get_env("KEYFILE"),
    certfile: System.get_env("BUNDLE")
  ],
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :website, Website.Repo,
  username: "postgres",
  password: "postgres",
  database: "website_prod",
  pool_size: 0
