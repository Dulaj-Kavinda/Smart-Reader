import 'package:image_picker/image_picker.dart';

Future<String> getImage(ImageSource imageSource) async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: imageSource);
  return pickedFile.path;
}
