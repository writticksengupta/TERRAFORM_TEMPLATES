variables "plans" {
  type = map
  default = {
    "5USD" = "1*CPU-1GB"
    "10USD" = "1*CPU-2GB"
  }
}

plan = var.plans["5USD"]
