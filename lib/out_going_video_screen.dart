import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_call_ui/system_ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_call_ui/video_call_screen.dart';
import 'package:video_call_ui/zijemu_on_call_screen.dart';

class OutgoingVideoCallScreen extends StatefulWidget {
  const OutgoingVideoCallScreen({super.key});

  @override
  State<OutgoingVideoCallScreen> createState() =>
      _OutgoingVideoCallScreenState();
}

class _OutgoingVideoCallScreenState extends State<OutgoingVideoCallScreen> {
  bool isCamOn = true;
  bool isMicOn = true;
  bool isVolOn = true;

  String them =
      'https://images.pexels.com/photos/12784538/pexels-photo-12784538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

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
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.grey,
        //   size: 24,
        // ),
      ),
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(them), fit: BoxFit.cover),
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
                                borderRadius: BorderRadius.circular(99))))))),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 138.0),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(me), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Column(
              children: [
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Calling +234 25 5845 3692',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(83.0),
                  child: LoadingAnimationWidget.prograssiveDots(
                    color: Colors.grey,
                    size: 80,
                  ),
                ),
                CallActionsWidget(),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

class CallActionsWidget extends StatefulWidget {
  const CallActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CallActionsWidget> createState() => _CallActionsWidgetState();
}

class _CallActionsWidgetState extends State<CallActionsWidget> {
  bool isSpeakerSelected = false;
  bool isVideoSelected = false;
  bool isAudioSelected = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        padding:
            const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 120),
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              width: double.infinity,
              height: 64,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Color.fromARGB(66, 213, 213, 213).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSpeakerSelected = !isSpeakerSelected;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: isSpeakerSelected
                              ? Colors.green
                              : Color(0x24262499)),
                      child: Icon(
                        isSpeakerSelected
                            ? Icons.volume_up_outlined
                            : Icons.volume_off_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isVideoSelected = !isVideoSelected;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: isVideoSelected
                              ? Colors.green
                              : Color(0x24262466)),
                      child: Icon(
                        isVideoSelected
                            ? Icons.videocam_outlined
                            : Icons.videocam_off,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isAudioSelected = !isAudioSelected;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: isAudioSelected
                              ? Colors.green
                              : Color(0x24262499)),
                      child: Icon(
                        isAudioSelected ? Icons.mic : Icons.mic_off_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoCallScreen()));
                    },

                    //() => Navigator(initialRoute: MaterialPageRoute(builder: (context) =>)),
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Colors.red),
                      child: const Icon(
                        Icons.call_end_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
