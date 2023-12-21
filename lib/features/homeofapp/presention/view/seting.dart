
import 'dart:io';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_state/phone_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_state/phone_state.dart';
import 'package:silent/features/homeofapp/presention/manager/cubit/fav_cubit.dart';
import 'package:sound_mode/permission_handler.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';

class settin extends StatefulWidget {
  @override
  _settinState createState() => _settinState();
}

class _settinState extends State<settin> {
  RingerModeStatus _soundMode = RingerModeStatus.unknown;
  RingerModeStatus _previousSoundMode = RingerModeStatus.unknown;

  @override
  void initState() {
    super.initState();
    setStream();
    _getCurrentSoundMode();
    _openDoNotDisturbSettings();
  }

  void setStream() {
    PhoneState.stream.listen((event) {

      if (event.status == PhoneStateStatus.CALL_INCOMING ||
          event.status == PhoneStateStatus.CALL_STARTED) {
          for(int i=0;i<=BlocProvider.of<FavCubit>(context).contacts.length;i++)
          {
            if(event.number==BlocProvider.of<FavCubit>(context).contacts[i].contacts[i].phones[0].value)
            {
                  _setNormalMode();
            }
          }  
       
      } else if (event.status == PhoneStateStatus.CALL_ENDED) {
      _setSilentMode();
      }
    });
  }

  Future<void> _getCurrentSoundMode() async {
    RingerModeStatus ringerStatus = RingerModeStatus.unknown;

    try {
      ringerStatus = await SoundMode.ringerModeStatus;
    } catch (err) {
      ringerStatus = RingerModeStatus.unknown;
    }

    setState(() {
      _soundMode = ringerStatus;
    });

  }

  Future<void> _setSilentMode() async {
    RingerModeStatus status;

    try {
      status = await SoundMode.setSoundMode(RingerModeStatus.silent);

      setState(() {
        _soundMode = status;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }

  Future<void> _setNormalMode() async {
    RingerModeStatus status;

    try {
      status = await SoundMode.setSoundMode(RingerModeStatus.normal);
      setState(() {
        _soundMode = status;
        _previousSoundMode = status;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }
  
   
  Future<void> _setVibrateMode() async {
    RingerModeStatus status;

    try {
      status = await SoundMode.setSoundMode(RingerModeStatus.vibrate);

      setState(() {
        _soundMode = status;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }

  Future<void> _openDoNotDisturbSettings() async {
    await PermissionHandler.openDoNotDisturbSetting();
  }

  Future<void> _restorePreviousSoundMode() async {
    RingerModeStatus status;

    try {
      status = await SoundMode.setSoundMode(_previousSoundMode);

      setState(() {
        _soundMode = status;
      });
    } on PlatformException {
      print('Do Not Disturb access permissions required!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _setSilentMode(),
              child: Text('Set Silent Mode'),
            ),
            ElevatedButton(
              onPressed: () => _setNormalMode(),
              child: Text('Set Normal Mode'),
            ),
            ElevatedButton(
              onPressed: () => _setVibrateMode(),
              child: Text('Set Vibrate Mode'),
            ),
            ElevatedButton(
              onPressed: () => _setVibrateMode(),
              child: Text('Set Vibrate Mode'),
            ),
          ],
        ),
      ),
    );
  }
}