locals {
  # Must match ENV PORT in intern-task-app/Dockerfile.
  app_port = 8080

  user_data = templatefile("${path.module}/user_data.yaml.tftpl", {})
}