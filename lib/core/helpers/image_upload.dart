// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'image_crop.dart';

abstract class ImageUploadService {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> fetchPhoto();
}

class ImageUploadManager {
  final ImageUploadService imageUploadService;
  final ImageCropManager imageCropManager = ImageCropManager();

  ImageUploadManager(this.imageUploadService);

  Future<CroppedFile?> cropWithFetch() async {
    XFile? selectFile = await imageUploadService.fetchPhoto();
    if (selectFile != null) {
      return await imageCropManager.crop(file: selectFile);
    }
    return null;
  }
}

class ImageUploadFromLibary extends ImageUploadService {
  @override
  Future<XFile?> fetchPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}

class ImageUploadFromCamera extends ImageUploadService {
  @override
  Future<XFile?> fetchPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
