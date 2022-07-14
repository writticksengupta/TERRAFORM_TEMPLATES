variables "users" {
  type = list
  default = ["root", "user1", "user2"]
}

username = var.users[0]
