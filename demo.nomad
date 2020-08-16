# Job - a specification provided by users that declares a workload for Nomad.
# This declares a job named "docs".
# There can be exactly one job declaration per job file.
job "docs" {
  
  # Task Group - a set of tasks that must be run together on the same client node.
  # All tasks in this group will run on the same node.
  group "web" {

    # Task - the smallest unit of work in Nomad
    task "server" {

      # Driver - represents the basic means of executing your Tasks, e.g., Docker, Java, Qemu, etc.
      driver = "docker"

    }

  }
  
  # These tasks must also run together but maybe a different node from group "web".
  group "logging" {

  }

}
