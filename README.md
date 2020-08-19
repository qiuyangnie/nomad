# nomad

## Nomenclature
* **Job**
  * A specification provided by users that declares a workload for Nomad.
```
job "docs" {}             # There can be exactly one job declaration per job file.

```
* **Task Group**
  * A set of tasks that must be run together on the same client node.
```
job "docs" {              # There can be exactly one job declaration per job file.
  grout "web" {}          # All tasks in this group will run on the same node.
  group "logging" {}      # These tasks must also run together but may be a different node from web.
}
```
* **Task**
  * The smallest unit of work in Nomad.
```
job "docs" {              # There can be exactly one job declaration per job file.
  grout "web" {}          # All tasks in this group will run on the same node.
  group "logging" {}      # These tasks must also run together but may be a different node from web.
  group "example" {       # These tasks must also run together but may be a different node from web.
    task "server" {}      # The smallest unit of work in Nomad.
  }
}
```
* **Driver**
  * It represents the basic means of executing your Tasks, e.g., docker, java, qemu, etc.
```
job "docs" {              # There can be exactly one job declaration per job file.
  grout "web" {}          # All tasks in this group will run on the same node.
  group "logging" {}      # These tasks must also run together but may be a different node from web.
  group "example" {       # These tasks must also run together but may be a different node from web.
    task "server" {       # The smallest unit of work in Nomad.
      driver = "docker"   # It represents the basic means of executing your Tasks, e.g., docker, java, qemu, etc.
    }      
  }
}
```

## Allocation
* A mapping between a task group in a job and a client node.

## Evaluation
* The mechanism by which Nomad makes scheduling decisions.

## Bin Packing
* Optimises resources by efficiently bin packing tasks onto client machines to maximise utilisation.

## Architecture
### Client
* A machine that tasks can be run on.

### Server
* Manages all jobs and clients, run evaluations, and create task allocations.
