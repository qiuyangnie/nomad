job "fabio" {
  datacenters = ["dc1"]

  group "fabio" {
    count = 1

    task "fabio" {
      driver = "raw_exec"

      config {
        command = "fabio"
        args    = ["-proxy.strategy=rr"] 
      }

      artifact {
        source      = "https://github.com/fabiolb/fabio/releases/download/v1.5.13/fabio-1.5.13-go1.13.4-darwin_amd64"
        destination = "local/fabio"
        mode        = "file"
      }

      # fabio is going to detect that consul is running on my system
    }

  }

}

# Go to fabio, hit the port 9999 (non-admin interface) to route my applications
# 127.0.0.1:9999/http-echo
