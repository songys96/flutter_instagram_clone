import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/screens_size.dart';
import 'package:flutter_app/models/camera_state.dart';
import 'package:flutter_app/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  MyProgressIndicator _progress = MyProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, CameraState cameraState, Widget child) {
        return  Column(
          children: [
            Container(
              width: size.width,
              height: size.width,
              color: Colors.blue,
              child: (cameraState.isReadyToTakePhoto) ? _getPreview(cameraState) : _progress,
            ),
            Expanded(
                child: OutlineButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  borderSide: BorderSide(color: Colors.grey, width: 20),
                ))
          ],
        );
      },
    );
  }

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            width: size.width,
            height: size.width / cameraState.cameraController.value.aspectRatio,
            child: CameraPreview(cameraState.cameraController),
          ),
        ),
      ),
    );
  }
}
