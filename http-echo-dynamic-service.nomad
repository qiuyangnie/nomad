job "http-echo-dynamic-service" {
  datacenters = ["dc1"]

  group "echo" {

    count = 5
    task "server" {

      driver = "docker"

      config {
        image = "hashicorp/http-echo:latest"
        args = [
          "-listen", ":${NOMAD_PORT_http}",
          "-text", "Hello and welcome to ${NOMAD_IP_http} running on port ${NOMAD_PORT_http}",
        ]
      }

      resources {
        network {
          mbits = 10
          port "http" {}
        }
      }

      # service stanza: register it in consul
      service {
        name = "http-echo"
        port = "http"

        tags = [
          "macbook",
          "urlprefix-/http-echo",
        ]

        check {
          type     = "http"
          path     = "/health"
          interval = "2s"
          timeout  = "2s"
        }
      }

    }

  }

}
