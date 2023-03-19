terraform {
	required_providers{
		docker = {
			source = "kreuzwerker/docker"
			#version = "~>2.21.0"
}
}
}

provider "docker" {
  
}

resource "docker_image" "jenkins" {
  name = "jenkins/jenkins"
  keep_locally = false
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.image_id
  name = "jenkins"
  ports {
	internal = 8080
	external = 8010
  }
}

