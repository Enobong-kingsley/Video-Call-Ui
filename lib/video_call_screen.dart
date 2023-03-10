import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_call_ui/out_going_video_screen.dart';
import 'package:video_call_ui/system_ui.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isCamOn = true;
  bool isMicOn = true;
  bool isVolOn = true;

  String them =
      'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  String me =
      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'End-to-End Encrypted',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        // actions: [
        //   Container(
        //     padding: const EdgeInsets.all(12),
        //     margin: const EdgeInsets.symmetric(horizontal: 12),
        //     decoration: const BoxDecoration(
        //         shape: BoxShape.circle, color: Colors.white),
        //     child: const Center(
        //       child: Icon(
        //         Icons.person_add_alt_1_outlined,
        //         color: Colors.grey,
        //         size: 16,
        //       ),
        //     ),
        //   )
        // ]
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(me), fit: BoxFit.cover),
            ),
            child: Center(
              child: Text(
                isVolOn ? '' : 'Audio is muted',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 24, top: 64),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.5)
              ], stops: const [
                0.1,
                0.9
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(99)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        callButton(
                            onTap: () {
                              setState(() {
                                isCamOn = !isCamOn;
                              });
                            },
                            icon: Icon(
                              isCamOn
                                  ? Icons.video_camera_front_outlined
                                  : Icons.video_camera_back_outlined,
                              color: Colors.white,
                              size: 24,
                            )),
                        callButton(
                            onTap: () {
                              setState(() {
                                isMicOn = !isMicOn;
                              });
                            },
                            icon: Icon(
                              isMicOn
                                  ? Icons.mic_outlined
                                  : Icons.mic_off_outlined,
                              color: Colors.white,
                              size: 24,
                            )),
                        callButton(
                            onTap: () {
                              setState(() {
                                isVolOn = !isVolOn;
                              });
                            },
                            icon: Icon(
                              isVolOn
                                  ? Icons.volume_up_outlined
                                  : Icons.volume_mute_outlined,
                              color: Colors.white,
                              size: 24,
                            )),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             OutgoingCallScreen()));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                color: Colors.red),
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 96, bottom: 124),
            padding: const EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 144,
                width: 96,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(them), fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 24,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: isCamOn ? 0 : 4, sigmaY: isCamOn ? 0 : 4),
                    child: Center(
                      child: Icon(
                        Icons.mic_off_rounded,
                        color: isMicOn ? Colors.transparent : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget callButton({onTap, icon}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          color: Color(0x24262466)),
      child: icon,
    ),
  );
}
