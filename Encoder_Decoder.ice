{
  "version": "1.2",
  "package": {
    "name": "Completed Encoder_Decoder Block",
    "version": "1.0",
    "description": "Encoder Decoder",
    "author": "Gabriel Quiroz",
    "image": ""
  },
  "design": {
    "board": "TinyFPGA-BX",
    "graph": {
      "blocks": [
        {
          "id": "8e35b7a0-b736-49a1-b325-4d195ae2970c",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "fuchsia",
            "name": "msb",
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 216,
            "y": 160
          }
        },
        {
          "id": "29530258-2458-4bcf-82ad-636424d1bbef",
          "type": "basic.input",
          "data": {
            "name": "i",
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "PIN_4",
                "value": "C2"
              },
              {
                "index": "2",
                "name": "PIN_3",
                "value": "B1"
              },
              {
                "index": "1",
                "name": "PIN_2",
                "value": "A1"
              },
              {
                "index": "0",
                "name": "PIN_1",
                "value": "A2"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": 96,
            "y": 176
          }
        },
        {
          "id": "8d6ab7d2-e9a6-4f32-8371-2092851baf45",
          "type": "basic.output",
          "data": {
            "name": "D",
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "PIN_19",
                "value": "B8"
              },
              {
                "index": "2",
                "name": "PIN_20",
                "value": "A8"
              },
              {
                "index": "1",
                "name": "PIN_21",
                "value": "B7"
              },
              {
                "index": "0",
                "name": "PIN_22",
                "value": "A7"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 696,
            "y": 176
          }
        },
        {
          "id": "2ff65df5-fbbc-4af9-adaa-cc0dc93cfc8c",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "fuchsia",
            "name": "msb",
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 576,
            "y": 296
          }
        },
        {
          "id": "37e76863-ab29-461d-90a6-5a8b2aa7b95c",
          "type": "basic.output",
          "data": {
            "name": "ed",
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "PIN_14",
                "value": "H9"
              },
              {
                "index": "0",
                "name": "PIN_15",
                "value": "D9"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 432,
            "y": 336
          }
        },
        {
          "id": "d9d973fc-05e3-4135-8924-8c5baa118edc",
          "type": "483d671e662a8de006133489a2ae3c4cc1a5753b",
          "position": {
            "x": 288,
            "y": 224
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "da09899e-f1a1-4da5-a0e8-31c995315684",
          "type": "a2ebddf69febe0629e5476b820f257c97709131e",
          "position": {
            "x": 488,
            "y": 224
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "30248109-a267-46a8-b989-1cf850258321",
          "type": "basic.info",
          "data": {
            "info": "Quirozity\nENCODER/DECODER",
            "readonly": false
          },
          "position": {
            "x": 336,
            "y": 48
          },
          "size": {
            "width": 192,
            "height": 128
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "29530258-2458-4bcf-82ad-636424d1bbef",
            "port": "out"
          },
          "target": {
            "block": "d9d973fc-05e3-4135-8924-8c5baa118edc",
            "port": "f0e519ca-d410-4367-9cdf-ba9ec11d36c2"
          },
          "size": 4
        },
        {
          "source": {
            "block": "d9d973fc-05e3-4135-8924-8c5baa118edc",
            "port": "8813c213-1b2d-4939-a44a-cee8771ae21d"
          },
          "target": {
            "block": "37e76863-ab29-461d-90a6-5a8b2aa7b95c",
            "port": "in"
          },
          "size": 2
        },
        {
          "source": {
            "block": "da09899e-f1a1-4da5-a0e8-31c995315684",
            "port": "ccae0ff5-b612-4e72-9330-4a6a7cb9ea72"
          },
          "target": {
            "block": "8d6ab7d2-e9a6-4f32-8371-2092851baf45",
            "port": "in"
          },
          "size": 4
        },
        {
          "source": {
            "block": "d9d973fc-05e3-4135-8924-8c5baa118edc",
            "port": "8813c213-1b2d-4939-a44a-cee8771ae21d"
          },
          "target": {
            "block": "da09899e-f1a1-4da5-a0e8-31c995315684",
            "port": "f64b669d-4c30-4067-b9d7-d691259476cb"
          },
          "size": 2
        }
      ]
    }
  },
  "dependencies": {
    "483d671e662a8de006133489a2ae3c4cc1a5753b": {
      "package": {
        "name": "ENCODER_LDGFN_AB2",
        "version": "1.0",
        "description": "Encoder for Lab 2",
        "author": "Gabriel Quiroz",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "f0e519ca-d410-4367-9cdf-ba9ec11d36c2",
              "type": "basic.input",
              "data": {
                "name": "i",
                "range": "[3:0]",
                "clock": false,
                "size": 4
              },
              "position": {
                "x": 72,
                "y": 248
              }
            },
            {
              "id": "8813c213-1b2d-4939-a44a-cee8771ae21d",
              "type": "basic.output",
              "data": {
                "name": "Q",
                "range": "[1:0]",
                "size": 2
              },
              "position": {
                "x": 792,
                "y": 280
              }
            },
            {
              "id": "422d1ea2-62d3-44a0-8687-3fe63eea30e7",
              "type": "basic.info",
              "data": {
                "info": "Quirozity\n4:2 Encoder BLOCK cw always",
                "readonly": false
              },
              "position": {
                "x": 304,
                "y": 88
              },
              "size": {
                "width": 296,
                "height": 80
              }
            },
            {
              "id": "b37c2089-488a-4257-86e3-bb2e21c67049",
              "type": "basic.code",
              "data": {
                "code": "reg [1:0] Q;\n\n\nalways@(*) //Looks for a change on any defined input\nbegin\n    Q[0] = i[1] | i[3];// Add your code here\n    Q[1] = i[3] | i[2];\nend",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ],
                  "out": [
                    {
                      "name": "Q",
                      "range": "[1:0]",
                      "size": 2
                    }
                  ]
                }
              },
              "position": {
                "x": 224,
                "y": 192
              },
              "size": {
                "width": 504,
                "height": 264
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "f0e519ca-d410-4367-9cdf-ba9ec11d36c2",
                "port": "out"
              },
              "target": {
                "block": "b37c2089-488a-4257-86e3-bb2e21c67049",
                "port": "i"
              },
              "size": 4
            },
            {
              "source": {
                "block": "b37c2089-488a-4257-86e3-bb2e21c67049",
                "port": "Q"
              },
              "target": {
                "block": "8813c213-1b2d-4939-a44a-cee8771ae21d",
                "port": "in"
              },
              "size": 2
            }
          ]
        }
      }
    },
    "a2ebddf69febe0629e5476b820f257c97709131e": {
      "package": {
        "name": "DECODER DGFN LAB 2",
        "version": "1.0",
        "description": "DECODER",
        "author": "Gabriel Quiroz",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "ccae0ff5-b612-4e72-9330-4a6a7cb9ea72",
              "type": "basic.output",
              "data": {
                "name": "D",
                "range": "[3:0]",
                "size": 4
              },
              "position": {
                "x": 784,
                "y": 200
              }
            },
            {
              "id": "f64b669d-4c30-4067-b9d7-d691259476cb",
              "type": "basic.input",
              "data": {
                "name": "i",
                "range": "[1:0]",
                "clock": false,
                "size": 2
              },
              "position": {
                "x": 40,
                "y": 232
              }
            },
            {
              "id": "9319fedd-f7a5-4a63-88d4-c2bc879d0ebd",
              "type": "basic.info",
              "data": {
                "info": "Quirozity\n2:4 Decoder Block (Always)\n\nTHIS IS COMPLETE",
                "readonly": false
              },
              "position": {
                "x": 288,
                "y": 24
              },
              "size": {
                "width": 296,
                "height": 112
              }
            },
            {
              "id": "67daf31b-6182-44e8-85a4-8255f95026e5",
              "type": "basic.code",
              "data": {
                "code": "reg [3:0] D;\n\nalways@(i)\nbegin\n    D[0] = ~i[1] & ~i[0];\n    D[1] = ~i[1] & i[0];\n    D[2] = i[1] & ~i[0];\n    D[3] = i[1] & i[0];\nend\n    ",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[1:0]",
                      "size": 2
                    }
                  ],
                  "out": [
                    {
                      "name": "D",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ]
                }
              },
              "position": {
                "x": 200,
                "y": 144
              },
              "size": {
                "width": 504,
                "height": 264
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "f64b669d-4c30-4067-b9d7-d691259476cb",
                "port": "out"
              },
              "target": {
                "block": "67daf31b-6182-44e8-85a4-8255f95026e5",
                "port": "i"
              },
              "size": 2
            },
            {
              "source": {
                "block": "67daf31b-6182-44e8-85a4-8255f95026e5",
                "port": "D"
              },
              "target": {
                "block": "ccae0ff5-b612-4e72-9330-4a6a7cb9ea72",
                "port": "in"
              },
              "size": 4
            }
          ]
        }
      }
    }
  }
}