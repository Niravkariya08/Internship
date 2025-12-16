import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class PickerDemo extends StatefulWidget {
  const PickerDemo({super.key});

  @override
  State<PickerDemo> createState() => _PickerDemoState();
}

class _PickerDemoState extends State<PickerDemo> {
  DateTime? SelectDate;
  TimeOfDay? SelectTime;
  CroppedFile? _croppedFile;
  String crop_Path = "";
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future<void> cropImage(String img_Path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: img_Path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPresetCustom(),
          ],
        ),
        WebUiSettings(
          context: context,
          presentStyle: WebPresentStyle.dialog,
          size: const CropperSize(width: 520, height: 520),
        ),
      ],
    );
    if (croppedFile != null) {
      setState(() {
        _croppedFile = croppedFile;
        crop_Path = croppedFile.path;
        image = File(croppedFile.path);
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      cropImage(pickedFile.path);
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      cropImage(pickedFile.path);
      // setState(() {
      //   image = File(pickedFile.path);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picker Demo", style: TextStyle(fontFamily: 'Bold')),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          IconButton(
            onPressed: () async {
              SelectTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                helpText: 'Enter Birthtime',
                switchToInputEntryModeIcon: Icon(Icons.change_circle),
                switchToTimerEntryModeIcon: Icon(Icons.change_circle),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      timePickerTheme: TimePickerThemeData(
                        backgroundColor: Colors.blue[100],
                      ),
                      colorScheme: ColorScheme.light(primary: Colors.orange),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
            },
            icon: Icon(Icons.watch_later),
          ),
          Divider(),
          IconButton(
            onPressed: () async {
              SelectDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2005),
                lastDate: DateTime(2035),
                initialDate: DateTime.now(),
                barrierDismissible: false,
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      datePickerTheme: DatePickerThemeData(
                        headerBackgroundColor: Color.fromARGB(255, 60, 61, 69),
                        headerForegroundColor: Colors.white,
                      ),
                      colorScheme: ColorScheme.light(primary: Colors.pink),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              setState(() {
                print("--------Time Format--------");
                print(DateFormat('dd/MM/yyyy').format(SelectDate!));
                print(DateFormat('MM/dd/yyyy').format(SelectDate!));
                print(DateFormat('dd MM yyyy').format(SelectDate!));
                print(DateFormat('dd-MM-yyyy').format(SelectDate!));
                print(DateFormat('dd-MM-yy').format(SelectDate!));
                print(DateFormat('dd MMM yyyy').format(SelectDate!));
                print(DateFormat('dd MMMM yyyy').format(SelectDate!));
                print(DateFormat('MMM dd yyyy').format(SelectDate!));
                print(DateFormat('MMMM dd yyyy').format(SelectDate!));
                print(DateFormat('yyyy MMM dd').format(SelectDate!));
                print(DateFormat('yyyy MMMM dd').format(SelectDate!));
                print("--------End--------");
              });
            },
            icon: Icon(Icons.calendar_month),
          ),
          Divider(),
          image != null
              ? ClipOval(
                  child: Image.file(
                    image!,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(150)),
                  ),
                  child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                ),
          SizedBox(height: 30),
          Row(
            children: [
              ElevatedButton(
                onPressed: _pickImageFromGallery,
                child: Text('Pick from Gallery'),
              ),
              ElevatedButton(
                onPressed: _pickImageFromCamera,
                child: Text('Take a Picture'),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    image = null;
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3';
}
