terraform {

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "mysticx"

    workspaces {
      prefix = "vpc-"
    }
  }
}
