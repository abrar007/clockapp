import 'package:clock_app/controller/set_time_controller.dart';
import 'package:clock_app/service/bluetooth_services.dart';
import 'package:clock_app/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import 'discover_device_screen.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  BluetoothState state = BluetoothState.UNKNOWN;
  BlueToothService blueToothService = Get.put(BlueToothService());
  final SetTimeController setTimeController = Get.put(SetTimeController());
  Future<void> _show(BuildContext context) async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setTimeController.setTime = result.format(context);
      print(result.hour.toString());

      setTimeController.setHour(result.hour);
      setTimeController.setMinute(result.minute);

      // setState(() {
      //   _selectedTime = result.format(context);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 27, 41, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * (85 / 812),
            ),
            GetBuilder<BlueToothService>(
                init: BlueToothService(),
                builder: (context) {
                  return ButtonWidget(
                    title: blueToothService.bluetoothState !=
                            BluetoothState.STATE_ON
                        ? "Tap to Connect To Clock"
                        : "Tap To Disconnect",
                    radius: 30,
                    height: 60,
                    width: 220,
                    bgColor: Colors.transparent,
                    onButtonPressed: () async {
                      //blueToothService.turnOnBluetooth();
                      await blueToothService.initialize();
                      print(blueToothService.bluetoothState);

                      // print(blueToothService.bluetoothState);
                      //await _show(context);
                      if (await blueToothService.toggleBluetoothState() ==
                          true) {
                        Get.to(const DiscoveryPage());
                      } else {
                        print("hoise");
                      }
                    },
                    textColor: Colors.white,
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          1.0
                        ],
                        colors: [
                          Color.fromRGBO(246, 45, 168, 1),
                          Color.fromRGBO(252, 4, 65, 1),
                        ]),
                  );
                }),
            const SizedBox(
              height: 34,
            ),
            Container(
              width: 320,
              height: 483,
              color: const Color.fromRGBO(46, 50, 62, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Enter Time (24 hrs)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 13, 30, 0),
                    child: InkWell(
                      onTap: () async {
                        await _show(context);
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 51,
                              height: 48,
                              color: const Color.fromRGBO(77, 80, 91, 1),
                              child: Center(
                                child: GetBuilder(
                                    init: SetTimeController(),
                                    builder: (context) {
                                      double value =
                                          setTimeController.hour / 10;
                                      setTimeController.h = value.toInt();
                                      return Text(value.toInt().toString());
                                    }),
                              ),
                            ),
                            Container(
                              width: 51,
                              height: 48,
                              color: const Color.fromRGBO(77, 80, 91, 1),
                              child: Center(
                                child: GetBuilder(
                                    init: SetTimeController(),
                                    builder: (context) {
                                      double value =
                                          (setTimeController.hour % 10);
                                      setTimeController.hh = value.toInt();
                                      return Text(value.toInt().toString());
                                    }),
                              ),
                            ),
                            Container(
                              width: 5,
                              height: 48,
                              color: Colors.transparent,
                              child: const Center(
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(77, 80, 91, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 51,
                              height: 48,
                              color: const Color.fromRGBO(77, 80, 91, 1),
                              child: Center(
                                child: GetBuilder(
                                    init: SetTimeController(),
                                    builder: (context) {
                                      double value =
                                          (setTimeController.minute / 10);
                                      setTimeController.min = value.toInt();
                                      return Text(value.toInt().toString());
                                    }),
                              ),
                            ),
                            Container(
                              width: 51,
                              height: 48,
                              color: const Color.fromRGBO(77, 80, 91, 1),
                              child: Center(
                                // ignore: prefer_const_constructors
                                child: GetBuilder(
                                    init: SetTimeController(),
                                    builder: (context) {
                                      double value =
                                          (setTimeController.minute % 10);
                                      setTimeController.minn = value.toInt();
                                      return Text(value.toInt().toString());
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder(
                      init: SetTimeController(),
                      builder: (contextt) {
                        return ButtonWidget(
                          title: "SEND",
                          radius: 24,
                          height: 48,
                          width: 144,
                          bgColor: Colors.transparent,
                          onButtonPressed: () async {
                            //_show(context);
                            //setTimeController.setState(0);
                            await blueToothService.sendMessage(
                                await setTimeController.sendTime(context));
                          },
                          textColor: Colors.white,
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [
                                0.0,
                                1.0
                              ],
                              colors: [
                                Color.fromRGBO(246, 45, 168, 1),
                                Color.fromRGBO(252, 4, 65, 1),
                              ]),
                        );
                      }),
                  const SizedBox(
                    height: 43,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Container(
                    //color: Colors.black,
                    margin: EdgeInsets.only(top: 43),
                    width: 83,
                    height: 83,
                    child: Stack(alignment: Alignment.center, children: [
                      ButtonWidget(
                        title: "Auto Sync",
                        radius: 50,
                        height: 83,
                        width: 83,
                        bgColor: Colors.transparent,
                        onButtonPressed: () async {
                          setTimeController.setCurrentTime(context);
                          print("messageSent");
                        },
                        textColor: Colors.white,
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                              0.0,
                              1.0
                            ],
                            colors: [
                              Color.fromRGBO(246, 45, 168, 1),
                              Color.fromRGBO(252, 4, 65, 1),
                            ]),
                      ),
                      // Positioned(
                      //   child: Container(
                      //     // color: Colors.amber,
                      //     padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //     child: Text(
                      //       "",
                      //       style: TextStyle(color: Colors.white, fontSize: 18),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      // ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
