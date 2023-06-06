import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropManager {
  final ImageCropper imageCropper = ImageCropper();

  Future<CroppedFile?> crop(
          {required XFile file,
          CropStyle cropStyle = CropStyle.rectangle}) async =>
      await imageCropper.cropImage(
        cropStyle: cropStyle,
        sourcePath: file.path,
      );
}
