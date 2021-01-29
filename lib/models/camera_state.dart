import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

class CameraState extends ChangeNotifierProvider{

  CameraController _controller;
  CameraDescription _cameraDescription;
  bool _isReadyToTakePhoto;

  void getReadyToTakePhoto() async {
    List<CameraDescription> cameras = await availableCameras();

    if (cameras != null && cameras.isNotEmpty)
      setCameraDescription(cameras[0]);

    bool init = false;

    while(!init){
      init = await initialize();
    }
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