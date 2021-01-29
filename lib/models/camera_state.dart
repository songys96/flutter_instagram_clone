import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class CameraState extends ChangeNotifier{

  CameraController _controller;
  CameraDescription _cameraDescription;
  bool _isReadyToTakePhoto = false;

  void getReadyToTakePhoto() async {
    List<CameraDescription> cameras = await availableCameras();

    if (cameras != null && cameras.isNotEmpty)
      setCameraDescription(cameras[0]);

    bool init = false;

    while(!init){
      init = await initialize();
    }
    _isReadyToTakePhoto = true;
    notifyListeners();
  }

  void setCameraDescription(CameraDescription cameraDescription){
    _cameraDescription = cameraDescription;
    _controller = CameraController(_cameraDescription, ResolutionPreset.medium);
  }

  Future<bool> initialize() async {
    try {
      await _controller.initialize();
      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }

  CameraController get cameraController => _controller;
  CameraDescription get cameraDescription => _cameraDescription;
  bool get isReadyToTakePhoto => _isReadyToTakePhoto;


}