module.exports = class Tester

  constructor: () ->

  t1 :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      true
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
        "web1.2":
          message:  "provisioning servers"
          estimate:  50000
          error:
            code:    1002
            guide:    "http://something"
            summary:  ""
            trace:    "Some multiline message\nnewline"
        "web1.1":
          message:  "provisioning servers"
          estimate:  50000
        database1:
          message:  "migrating data"
          estimate:  10000
        default:
          message:  "parsing Boxfile"
          estimate:  6000
    }

  t1b :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      false
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
        default:
          message:  "parsing Boxfile"
          estimate:  6000
        "web1.1":
          message:  "provisioning servers"
          estimate:  50000
    }

  t1Complete :
    {
      id:           "t1"
      state:        "complete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      false
      summary:
         default:
           message:  "parsing Boxfile"
           estimate:  6000
         web1:
           message:  "provisioning servers"
           estimate:  50000
         database1:
           message:  "migrating data"
           estimate:  10000
    }

  t1Partial :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      false
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
    }

  t2 :
    {
      id:           "t2"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T2 - Deploying Code"
      errored:      false
      summary:
        default:
          message:  "parsing Boxfile"
          estimate:  6000
        web1:
          message:  "provisioning servers"
          estimate:  50000
        database1:
          message:  "migrating data"
          estimate:  10000
    }

  # --------------------------------------------------------

  startEmpty :
    id:           "t1"
    state:        "incomplete"
    status:       "sleeping"
    description:  "Building app and deploying code"
    title:        "T1 - Deploying Code"
    errored:      false
    summary:      {}

  startComplete :
    id:           "t1"
    state:        "complete"
    status:       "sleeping"
    description:  "Building app and deploying code"
    title:        "T1 - Deploying Code"
    errored:      false
    summary:      {}
