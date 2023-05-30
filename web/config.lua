local config = require("lapis.config")

config("development", {
  server = "nginx",
  code_cache = "off",
  num_workers = "1",
  port = os.getenv("PORT")
})

config("production", {
  server = "nginx",
  code_cache = "on",
  num_workers = "4"
})
