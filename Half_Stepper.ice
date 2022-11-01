{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "TinyFPGA-BX",
    "graph": {
      "blocks": [
        {
          "id": "90daa639-4ce2-4ad0-a50c-4bdfcfbe14c8",
          "type": "basic.output",
          "data": {
            "name": "Q",
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "PIN_14",
                "value": "H9"
              },
              {
                "index": "2",
                "name": "PIN_15",
                "value": "D9"
              },
              {
                "index": "1",
                "name": "PIN_16",
                "value": "D8"
              },
              {
                "index": "0",
                "name": "PIN_17",
                "value": "C9"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 840,
            "y": 240
          }
        },
        {
          "id": "0a80dcb8-1681-46b4-8109-dbc07f893098",
          "type": "basic.input",
          "data": {
            "name": "Reset",
            "pins": [
              {
                "index": "0",
                "name": "PIN_23",
                "value": "B6"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -720,
            "y": 704
          }
        },
        {
          "id": "ade14e66-2330-49bd-baf3-70148d2260c7",
          "type": "basic.output",
          "data": {
            "name": "Q_led",
            "pins": [
              {
                "index": "0",
                "name": "LED",
                "value": "B3"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 832,
            "y": 1112
          }
        },
        {
          "id": "5c3875e8-9612-4cac-8a2a-f4e17f904834",
          "type": "basic.output",
          "data": {
            "name": "Q1_led",
            "pins": [
              {
                "index": "0",
                "name": "PIN_18",
                "value": "A9"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 832,
            "y": 1208
          }
        },
        {
          "id": "9efb3ae8-40dd-40bf-88b6-75001e38988b",
          "type": "basic.input",
          "data": {
            "name": "Dir",
            "pins": [
              {
                "index": "0",
                "name": "PIN_24",
                "value": "A6"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -688,
            "y": 1256
          }
        },
        {
          "id": "bbe6f242-eb66-4d27-864d-f7dfd11b5d75",
          "type": "basic.info",
          "data": {
            "info": "Quirozity\n\n## The Verilog code for control of a stepper motor (Half-step Mode)\n\nThis will cause the Motor speed to ramp down from a higher speed (relative), \nit then repeats.\n\nThe 'Dir' input reverse's direction at any time - ** you need to add the case and sequences* *\n\nThe 'Reset' input - restarts from higher speed.\n\n**Over-time the delay between stepper motor input state updates gets longer - slowing down the \ntransistion between steps, then it resets.** \n\n**The Stepper sequences are updated at a rate of ~500Hz down to ~33Hz, 15 stages therefore 15 speeds.**\n\n**Higher the frequency - the faster the Stepper rotates.**\n\nAdapted from:-\nhttps://trandi.wordpress.com/2014/09/17/fpga-rc-servo-and-stepper-motor/  ",
            "readonly": false
          },
          "position": {
            "x": -248,
            "y": -488
          },
          "size": {
            "width": 752,
            "height": 232
          }
        },
        {
          "id": "3a1283e8-be10-4705-acc7-4be32d8424f7",
          "type": "8026abbda6bfa79c6f4c6debd4e97ae7b51ee8d3",
          "position": {
            "x": -544,
            "y": 1256
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "fff31c07-9b97-451a-8fde-ef7873786939",
          "type": "8026abbda6bfa79c6f4c6debd4e97ae7b51ee8d3",
          "position": {
            "x": -568,
            "y": 704
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "3a5e472a-a831-4313-a5f3-32a37883b517",
          "type": "basic.info",
          "data": {
            "info": "Connections from BX to the VMA401\n\n         BX           \n          _________    VMA401 cw 28 BYJ-48\n         |         |   _______\n/Reset --|23   Vin |--|+5v    |\n         |      G  |--|-      |\n         |         |  |       |\n         |         |  |       |\n /Dir  --|24     17|--| In4   |\n         |       16|--| In3   |\n         |       15|--| In2   |\n         |       14|--| In1   |\n         |         |   -------\n          --------- ",
            "readonly": false
          },
          "position": {
            "x": -752,
            "y": -488
          },
          "size": {
            "width": 360,
            "height": 296
          }
        },
        {
          "id": "b6cc4bbc-9456-47e8-82d4-3263e3e6fdac",
          "type": "basic.code",
          "data": {
            "code": "//Modified by Quirozity\nreg [3:0] secondsCounter;\nreg [31:0] clockCount1;\nreg [3:0] Q;\nreg led;\n\n/////////// 4 bit/LED counter ///////////////\nlocalparam SECOND_DIVIDER = 16000000; // - suit the BX clock\n \nalways @ (posedge clk)\nbegin\n    if(secondsCounter == 4'b1111 || rst == 0) // resets after 15 iterations\n        secondsCounter <= 1'b0;\n        \n    clockCount1 = clockCount1 + 1'b1; // inc to slow down motor\n    if(clockCount1 == SECOND_DIVIDER)\n        begin\n            clockCount1 <= 1'b0;\n            secondsCounter <= secondsCounter + 1'b1; // inc to 15, the increase delay time per stage\n        end\nend\n \n\n/////////// Stepper Motor - half step method (using 28BYJ-48) ///////////////\n \nparameter STEPPER_DIVIDER = 16000; // every 1ms, minimum dewel time between changes - suits the 28BYJ -48\n \n\nreg [31:0] clockCount3;\nreg [4:0] step; // 16 positions for half steps\n \nalways @ (posedge clk)\nbegin\n    if(clockCount3 >= STEPPER_DIVIDER * (secondsCounter + 1)) //inc the delay between output update by the Case\n        begin\n            step <= step + 1'b1;\n            clockCount3 <= 1'b0;\n        end\n    else\n        clockCount3 <= clockCount3 + 1'b1;\nend\n \nalways @ (step) // use blocking\nbegin\n    led = step[0]; // used to sample sequnce updating Hz\n    if (dir) begin // ***\n            case(step) // move motor clockwise, by passing these sequence's when step changes [0 . . 15]\n                0: Q = 4'b1000;\n                1: Q = 4'b1100;\n                2: Q = 4'b0100;\n                3: Q = 4'b0110;\n                4: Q = 4'b0010;\n                5: Q = 4'b0011;\n                6: Q = 4'b0001;\n                7: Q = 4'b1001;\n                8: Q = 4'b1000;\n                9: Q = 4'b1100;\n                10: Q = 4'b0100;\n                11: Q = 4'b0110;                    \n                12: Q = 4'b0010;\n                13: Q = 4'b0011;\n                14: Q = 4'b0001;\n                15: Q = 4'b1001;\n            endcase\n        end\n    else // ***\n        begin // Add another case statement, so that the stepper rotates in the other direction\n            case (step)\n                0: Q = 4'b1001;\n                1: Q = 4'b0001;\n                2: Q = 4'b0011;\n                3: Q = 4'b0010;\n                4: Q = 4'b0110;\n                5: Q = 4'b0100;\n                6: Q = 4'b1100;\n                7: Q = 4'b1000;\n                8: Q = 4'b1001;\n                9: Q = 4'b0001;\n                10: Q = 4'b0011;\n                11: Q = 4'b0010;                    \n                12: Q = 4'b0110;\n                13: Q = 4'b0100;\n                14: Q = 4'b1101;\n                15: Q = 4'b1000;\n            endcase\n        end // ***\n        \nend\n\n    ",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "rst"
                },
                {
                  "name": "dir"
                }
              ],
              "out": [
                {
                  "name": "Q",
                  "range": "[3:0]",
                  "size": 4
                },
                {
                  "name": "led"
                }
              ]
            }
          },
          "position": {
            "x": -368,
            "y": -96
          },
          "size": {
            "width": 1032,
            "height": 1656
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "b6cc4bbc-9456-47e8-82d4-3263e3e6fdac",
            "port": "Q"
          },
          "target": {
            "block": "90daa639-4ce2-4ad0-a50c-4bdfcfbe14c8",
            "port": "in"
          },
          "size": 4
        },
        {
          "source": {
            "block": "3a1283e8-be10-4705-acc7-4be32d8424f7",
            "port": "a139fa0d-9b45-4480-a251-f4a66b49aa23"
          },
          "target": {
            "block": "b6cc4bbc-9456-47e8-82d4-3263e3e6fdac",
            "port": "dir"
          }
        },
        {
          "source": {
            "block": "9efb3ae8-40dd-40bf-88b6-75001e38988b",
            "port": "out"
          },
          "target": {
            "block": "3a1283e8-be10-4705-acc7-4be32d8424f7",
            "port": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150"
          }
        },
        {
          "source": {
            "block": "0a80dcb8-1681-46b4-8109-dbc07f893098",
            "port": "out"
          },
          "target": {
            "block": "fff31c07-9b97-451a-8fde-ef7873786939",
            "port": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150"
          }
        },
        {
          "source": {
            "block": "fff31c07-9b97-451a-8fde-ef7873786939",
            "port": "a139fa0d-9b45-4480-a251-f4a66b49aa23"
          },
          "target": {
            "block": "b6cc4bbc-9456-47e8-82d4-3263e3e6fdac",
            "port": "rst"
          },
          "vertices": [
            {
              "x": -424,
              "y": 736
            }
          ]
        },
        {
          "source": {
            "block": "b6cc4bbc-9456-47e8-82d4-3263e3e6fdac",
            "port": "led"
          },
          "target": {
            "block": "ade14e66-2330-49bd-baf3-70148d2260c7",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "b6cc4bbc-9456-47e8-82d4-3263e3e6fdac",
            "port": "led"
          },
          "target": {
            "block": "5c3875e8-9612-4cac-8a2a-f4e17f904834",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {
    "8026abbda6bfa79c6f4c6debd4e97ae7b51ee8d3": {
      "package": {
        "name": "Pull-up",
        "version": "1.0.0",
        "description": "FPGA internal pull-up configuration on the connected input port",
        "author": "Juan González",
        "image": "%3Csvg%20id=%22svg2%22%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%22-265%20401.5%2063.5%2038.4%22%3E%3Cstyle%3E.st0%7Bdisplay:none%7D.st1%7Bfill:none;stroke:#000;stroke-width:.75;stroke-linejoin:round;stroke-miterlimit:10%7D.st2%7Bfill:#010002%7D%3C/style%3E%3Cpath%20class=%22st0%22%20d=%22M-242.5%20411.8v11.8h-5.4v-11.8h5.4m1-1h-7.4v13.8h7.4v-13.8z%22/%3E%3Cpath%20d=%22M-212%20425.6l-15.4-8.7v8.5h-17.4v-2.7c0-.2-.1-.4-.3-.4l-2.3-1.2%205.6-2.9c.2-.1.3-.3.3-.5s-.1-.4-.3-.4l-5.7-2.7%202.4-1.6c.1-.1.2-.2.2-.4v-2.7h3.1l-3.5-6.1-3.5%206.1h3v2.5l-2.9%202c-.1.1-.2.3-.2.5s.1.3.3.4l5.6%202.6-5.6%202.9c-.2.1-.3.3-.3.4s.1.4.3.4l2.9%201.5V425.5H-265v1.2h37.6v8.5l15.4-8.7h10.5v-.8H-212zm-33.3-20.4l2.2%203.9h-4.5l2.3-3.9zm19.2%2027.7v-13.8l12.3%206.9-12.3%206.9z%22/%3E%3C/svg%3E"
      },
      "design": {
        "config": "true",
        "pullup": "true",
        "graph": {
          "blocks": [
            {
              "id": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 64,
                "y": 200
              }
            },
            {
              "id": "a139fa0d-9b45-4480-a251-f4a66b49aa23",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 760,
                "y": 200
              }
            },
            {
              "id": "2b245a71-2d80-466b-955f-e3d61839fe25",
              "type": "basic.code",
              "data": {
                "code": "// Pull up\n\nwire din, dout, outen;\n\nassign o = din;\n\nSB_IO #(\n    .PIN_TYPE(6'b 1010_01),\n    .PULLUP(1'b 1)\n) io_pin (\n    .PACKAGE_PIN(i),\n    .OUTPUT_ENABLE(outen),\n    .D_OUT_0(dout),\n    .D_IN_0(din)\n);",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i"
                    }
                  ],
                  "out": [
                    {
                      "name": "o"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 104
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "bb4a1ca9-1b30-471e-92ca-ca7ff2fc1150",
                "port": "out"
              },
              "target": {
                "block": "2b245a71-2d80-466b-955f-e3d61839fe25",
                "port": "i"
              }
            },
            {
              "source": {
                "block": "2b245a71-2d80-466b-955f-e3d61839fe25",
                "port": "o"
              },
              "target": {
                "block": "a139fa0d-9b45-4480-a251-f4a66b49aa23",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}