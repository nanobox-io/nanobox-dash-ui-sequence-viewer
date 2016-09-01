module.exports = class Tester

  ###
  View Classes:
    - root
       + Root level of a sequence
       + No progress bar
    - default
       +
    - component
    - componentInstance
  ###

  constructor: () ->
  x :
    {
      "id": "11d09925-bfb3-4501-bf31-9a82f76f19f2",
      "status": "waiting",
      "title": "App Activate",
      "description": "Ordering and provisioning a server for your app.",
      "summaries": {
        "test-summaries": {
          "title": null,
          "message": "Building Platform Services",
          "estimate": 120000,
          "viewClass": "default",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/logger": {
          "title": "Logger",
          "message": "activating platform service components",
          "estimate": 5000,
          "viewClass": "default",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/mesh": {
          "title": "Mesh",
          "message": "activating platform service components",
          "estimate": 5000,
          "viewClass": "default",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/pusher": {
          "title": "Message Bus",
          "message": "activating platform service components",
          "estimate": 5000,
          "viewClass": "default",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/warehouse": {
          "title": "Warehouse",
          "message": "activating platform service components",
          "estimate": 5000,
          "viewClass": "default",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/logger/data.logvac": {
          "title": "data.logvac",
          "message": "creating new component",
          "estimate": 20000,
          "viewClass": "component",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/pusher/data.mist": {
          "title": "data.mist",
          "message": "creating new component",
          "estimate": 20000,
          "viewClass": "component",
          "error": null,
          "internal_error": false
        },
        "test-summaries/platform/warehouse/data.hoarder": {
          "title": "data.hoarder",
          "message": "creating new component",
          "estimate": 20000,
          "viewClass": "component",
          "error": null,
          "internal_error": false
        }
      }
    }

  a :
    id            : "some_id"
    title         : "App Activate"
    description   : "Launching an app and building a platform"
    status        : "initialized"
    summaries     :
      "platform"  :
        message   : "Building Platform Services"
        viewClass : "default"
        estimate  : 5000
      "platform/logger1" :
        title     : "Logger"
        message   : "Installing Components"
        viewClass : "default"
        internal_error:true
        estimate  : 5000
      "platform/logger2" :
        title     : "Logger"
        message   : "Installing Components"
        viewClass : "default"
        estimate  : 5000
      "platform/logger3" :
        title     : "Logger"
        message   : "Installing Components"
        viewClass : "default"
        estimate  : 5000
        error     :
          meta       :
            abc:"asdf"
            "assadf-asaf":"zxcv"
            c:"qwer"
          retry_path : "http://some.retry.path.nanobox.io/path"
          code       : 1002,
          doc        : "https://docs.nanobox.io/cloud/",
          summary    : "Unable to communicate with AWS Servers",
          trace      : """[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
                          [09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
                          [09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
                          [09:10:36] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
                          [09:10:36] coffee-script: recompiling... server/js/jade/sequence.js
                          [09:10:37] coffee-script: recompiling... server/js/jade/task.js
                          [09:10:37] coffee-script: recompiling... server/js/jade/sequence-error.js
                          [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:11:41] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
                          [09:11:53] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
                          [09:13:14] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
                          [09:13:14] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:13:14] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:13:32] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
                          [09:13:32] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:13:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:13:47] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
                          [09:13:47] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:13:47] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:13:50] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
                          [09:13:51] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:13:51] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-error.js reloaded.
                          [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
                          [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
                          [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
                          [09:15:01] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
                          [09:15:02] coffee-script: recompiling... server/js/jade/sequence.js
                          [09:15:03] coffee-script: recompiling... server/js/jade/task.js
                          [09:15:03] coffee-script: recompiling... server/js/jade/sequence-error.js
                          [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:16:24] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
                          [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-error.js reloaded.
                          [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
                          [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
                          [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
                          [09:18:07] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
                          [09:18:07] coffee-script: recompiling... server/js/jade/sequence.js
                          [09:18:08] coffee-script: recompiling... server/js/jade/task.js
                          [09:18:08] coffee-script: recompiling... server/js/jade/sequence-error.js
                          [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
                          [09:18:08] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
                          [09:18:20] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
                          [09:18:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded."""
      "platform/logger1/data.logvac" :
        title     : "Logvac"
        message   : "Installing Instances"
        viewClass : "component"
        estimate  : 3000
      "platform/logger1/data.logvac/1" :
        title     : "1"
        message   : "Starting Docker Container"
        viewClass : "instance"
        estimate  : 3000

  b :
    id            : "some_id"
    title         : "App Activate"
    description   : "Launching an app and building a platform"
    status        : "initialized"
    summaries     :
      "platform"  :
        message   : "Building Platform Services"
        viewClass : "default"
        estimate  : 5000
      "platform/logger1" :
        title     : "Logger"
        message   : "Installing Components"
        viewClass : "default"
        estimate  : 5000
      "platform/logger1/data.logvac" :
        title     : "Logvac"
        message   : "Installing Instances"
        viewClass : "component"
        estimate  : 3000
      "platform/logger1/data.logvac/1" :
        title     : "1"
        message   : "Starting Docker Container"
        viewClass : "instance"
        estimate  : 3000

  newStruct :
    id : "abcdef12345-a"
    status : "sleeping"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : [
      id : "abcdef12345-b"
      status : "started"
      title : "asdf"
      message : "activating platform service"
      estimate : "200"
      children : [
        id : "abcdef12345-c"
        status : "resumed"
        title : "data.portal"
        message : "planning component"
        estimate : "20000"
        viewClass : "component"
        children : [
          id : "abcdef12345-d"
          status : "started"
          title : "Mesh"
          message : "activating platform service"
          estimate : "20000"
          viewClass : "instance"
        ]
      ]
    ]

  newStruct4 :
    id : "abcdef12345-a"
    status : "running"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : [
      id : "abcdef12345-b"
      status : "started"
      title : "asdf"
      message : "activating platform service"
      estimate : "200"
      children : [
        id : "abcdef12345-c"
        status : "resumed"
        title : "data.portal"
        message : "planning component"
        estimate : "20000"
        viewClass : "component"
        children : [
          id : "abcdef12345-d"
          status : "started"
          title : "Mesh"
          message : "activating platform service"
          estimate : "20000"
          viewClass : "instance"
          children : [
            id : "abcdef12345-a"
            status : "sleeping"
            title : "App Activate"
            message : "Activating app by placing it on your selected provider."
            estimate : "20000"
            viewClass : "root"
            children : [
              id : "abcdef12345-b"
              status : "started"
              title : "asdf"
              message : "activating platform service"
              estimate : "200"
              children : [
                id : "abcdef12345-c"
                status : "resumed"
                title : "data.portal"
                message : "planning component"
                estimate : "20000"
                viewClass : "component"
                children : [
                  id : "abcdef12345-d"
                  status : "started"
                  title : "Mesh"
                  message : "activating platform service"
                  estimate : "20000"
                  viewClass : "instance"
                  children : [
                    id : "abcdef12345-a"
                    status : "sleeping"
                    title : "App Activate"
                    message : "Activating app by placing it on your selected provider."
                    estimate : "20000"
                    viewClass : "root"
                    children : [
                      id : "abcdef12345-b"
                      status : "started"
                      title : "asdf"
                      message : "activating platform service"
                      estimate : "200"
                      children : [
                        id : "abcdef12345-c"
                        status : "resumed"
                        title : "data.portal"
                        message : "planning component"
                        estimate : "20000"
                        viewClass : "component"
                        children : [
                          id : "abcdef12345-d"
                          status : "started"
                          title : "Mesh"
                          message : "activating platform service"
                          estimate : "20000"
                          viewClass : "instance"
                          children : [
                            id : "abcdef12345a-b"
                            status : "started"
                            title : "asdf"
                            message : "activating platform service"
                            estimate : "200"
                            children : [
                              id : "abcdef12345a-c"
                              status : "resumed"
                              title : "data.portal"
                              message : "planning component"
                              estimate : "20000"
                              viewClass : "component"
                              children : [
                                id : "abcdef12345a-d"
                                status : "started"
                                title : "Mesh"
                                message : "activating platform service"
                                estimate : "20000"
                                viewClass : "instance"
                                children : [
                                  id : "abcdef12345a-a"
                                  status : "sleeping"
                                  title : "App Activate"
                                  message : "Activating app by placing it on your selected provider."
                                  estimate : "20000"
                                  viewClass : "root"
                                  children : [
                                    id : "abcdef12345a-b"
                                    status : "started"
                                    title : "asdf"
                                    message : "activating platform service"
                                    estimate : "200"
                                    children : [
                                      id : "abcdef12345a-c"
                                      status : "resumed"
                                      title : "data.portal"
                                      message : "planning component"
                                      estimate : "20000"
                                      viewClass : "component"
                                      children : [
                                        id : "abcdef12345a-d"
                                        status : "started"
                                        title : "Mesh"
                                        message : "activating platform service"
                                        estimate : "20000"
                                        viewClass : "instance"
                                        children : []
                                      ]
                                    ]
                                  ]
                                ]
                              ]
                            ]
                          ]
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]

  newStruct2 :
    id : "abcdef12345-a"
    status : "brushing"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : [
      id : "abcdef12345-b"
      status : "started"
      title : "asdf"
      message : "activating platform service"
      estimate : "200"
      children : [
        id : "abcdef12345-c"
        status : "resumed"
        title : "data.portal"
        message : "planning component"
        estimate : "20000"
        viewClass : "component"
        children : []
      ]
    ]

  newStruct3 :
    id : "abcdef12345-a"
    status : "distracted"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : []

  newStruct5 :
    id       : "abcdef12345-a",
    status   : "curious",
    title    : "App Activate",
    message  : "Activating app by placing it on your selected provider.",
    estimate : "20000",
    children : [
      {
        id       : "abcdef12345-b",
        status   : "sleeping",
        title    : "mesh",
        message  : "activating platform service",
        estimate : "20000",
        children : [
          {
            id          : "abcdef12345-c",
            status      : "errored",
            title       : "data.portal",
            message     : "planning component",
            estimate    : "20000",
            error       : {
              retry_path : "http://some.retry.path.nanobox.io/path"
              code       : 1002,
              doc        : "https://docs.nanobox.io/cloud/",
              summary    : "Unable to communicate with AWS Servers",
              trace      : """[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
  [09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
  [09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
  [09:10:36] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
  [09:10:36] coffee-script: recompiling... server/js/jade/sequence.js
  [09:10:37] coffee-script: recompiling... server/js/jade/task.js
  [09:10:37] coffee-script: recompiling... server/js/jade/sequence-error.js
  [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:11:41] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
  [09:11:53] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
  [09:13:14] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
  [09:13:14] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:13:14] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:13:32] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
  [09:13:32] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:13:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:13:47] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
  [09:13:47] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:13:47] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:13:50] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
  [09:13:51] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:13:51] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-error.js reloaded.
  [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
  [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
  [09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
  [09:15:01] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
  [09:15:02] coffee-script: recompiling... server/js/jade/sequence.js
  [09:15:03] coffee-script: recompiling... server/js/jade/task.js
  [09:15:03] coffee-script: recompiling... server/js/jade/sequence-error.js
  [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:16:24] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
  [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-error.js reloaded.
  [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
  [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
  [09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
  [09:18:07] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
  [09:18:07] coffee-script: recompiling... server/js/jade/sequence.js
  [09:18:08] coffee-script: recompiling... server/js/jade/task.js
  [09:18:08] coffee-script: recompiling... server/js/jade/sequence-error.js
  [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
  [09:18:08] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
  [09:18:20] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
  [09:18:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded."""
            },
            children : [],
          }
        ],
      }
    ]

  empty : {}
