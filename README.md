#  Swift Camera Capture and Inference

This is a project for testing live inference on camera capture from iPhone or iPad devices.
The project is divided in 2 modules, the file of each module are organized reflecting the MVVM design pattern.
The modules are completely indipendent.

Used frameworks:
- SwiftUI
- AVFoundation

## The camera module
The CameraView is the view responsible for showing the camera capture. It relies on the FrameHandler class for starting the capturring video frames from the camera and showing thanks to the FrameView.
### 1- Requesting authorization
Include the NSCameraUsageDescription key in your Info.plist file

The FrameHandler class will take care of checking if the authorization is granted and start the actual capture session
```
    func requestPermission() {
        // Strong reference not a problem here but might become one in the future.
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
        }
    }
```
### 2- Setup the capture session
The first step is to select the capture device for the video feed, we want the built-in camera in the back of the phone
```
guard permissionGranted else { return }
guard let videoDevice = AVCaptureDevice.default(.builtInDualWideCamera,for: .video, position: .back) else { return }
guard let videoDeviceInput = try? AVCaptureDeviceInput (device: videoDevice) else { return}
guard captureSession.canAddInput (videoDeviceInput) else { return}
captureSession.addInput(videoDeviceInput)
```

Then assign a buffer for the capture session
```
let videoOutput = AVCaptureVideoDataOutput()
videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue (label: "sampleBufferQueue"))
captureSession.addOutput(videoOutput)
videoOutput.connection(with:.video)?.videoOrientation = .portrait
```

### 2- Start the capture session
```
captureSession.startRunning()
```
