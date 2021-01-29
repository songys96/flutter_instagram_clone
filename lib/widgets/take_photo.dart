import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/screens_size.dart';
import 'package:flutter_app/widgets/my_progress_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {

  CameraController _controller;
  MyProgressIndicator _progress = MyProgressIndicator();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: availableCameras(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              width: size.width,
              height: size.width,
              color: Colors.blue,
              child: (snapshot.hasData)?_getPreview(snapshot.data):_progress,
            ),
            Expanded(
                child: OutlineButton(
                  onPressed: (){},
                  shape: CircleBorder(),
                  borderSide: BorderSide(color: Colors.grey, width: 20),
                ))
          ],
        );
      }
    );
  }

  Widget _getPreview (cameras) {
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    return FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done)
            return ClipRect(
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    width: size.width,
                    height: size.width / _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
              ),
            );
          else {
            return _progress;
          }
        },
    );
  }
}
