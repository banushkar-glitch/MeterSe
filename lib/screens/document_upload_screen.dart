import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'driver_details_screen.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

  @override
  _DocumentUploadScreenState createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  XFile? licenseFront;
  XFile? licenseBack;
  List<XFile> rickshawPhotos = [];
  XFile? selfie;

  final ImagePicker _picker = ImagePicker();
  bool isUploading = false;

  Future<void> pickLicense() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage(limit: 2);
    if (pickedFiles.isNotEmpty) {
      setState(() {
        licenseFront = pickedFiles.first;
        if (pickedFiles.length > 1) {
          licenseBack = pickedFiles[1];
        }
      });
    }
  }

  Future<void> pickRickshawPhotos() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage(limit: 4);
    if (pickedFiles.isNotEmpty) {
      setState(() {
        rickshawPhotos = pickedFiles;
      });
    }
  }

  Future<void> pickSelfie() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        selfie = pickedFile;
      });
    }
  }

  Future<void> uploadDocuments() async {
    if (licenseFront == null || licenseBack == null || rickshawPhotos.isEmpty || selfie == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please upload all required documents")),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt_token');
      print("TOKEN READ: $token");

      var uri = Uri.parse("http://192.168.0.34:5000/api/documents/upload");
      var request = http.MultipartRequest("POST", uri);

      if (token != null) {
        request.headers['Authorization'] = token;
      }

      request.files.add(await http.MultipartFile.fromPath('license_front', licenseFront!.path));
      request.files.add(await http.MultipartFile.fromPath('license_back', licenseBack!.path));

      for (var file in rickshawPhotos) {
        request.files.add(await http.MultipartFile.fromPath('rickshaw', file.path));
      }

      request.files.add(await http.MultipartFile.fromPath('selfie', selfie!.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Documents Uploaded Successfully")),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DriverDetailsScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Upload failed: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE3C65A),
      body: SafeArea(
        child: Stack(
          children: [
            // 🔹 MAIN CONTENT
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),

                  Text(
                    "Please upload the required documents to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: height * 0.06),

                  // DRIVER LICENSE
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Driver’s License",
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.12,
                        vertical: height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: pickLicense,
                    child: Text(licenseFront != null && licenseBack != null ? "Change Pictures" : "Open Camera App / Gallery"),
                  ),

                  SizedBox(height: height * 0.015),
                  Text("(take front and back picture)"),
                  if (licenseFront != null && licenseBack != null)
                    Text("✅ License selected", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),

                  SizedBox(height: height * 0.05),

                  // RICKSHAW
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Photo of your Rickshaw",
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.12,
                        vertical: height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: pickRickshawPhotos,
                    child: Text(rickshawPhotos.isNotEmpty ? "Change Pictures" : "Open Camera App / Gallery"),
                  ),

                  SizedBox(height: height * 0.015),
                  Text("(you can upload 4 pictures)"),
                  if (rickshawPhotos.isNotEmpty)
                    Text("✅ ${rickshawPhotos.length} Rickshaw photo(s) selected", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),

                  SizedBox(height: height * 0.05),

                  // SELFIE
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Driver Selfie",
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.12,
                        vertical: height * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: pickSelfie,
                    child: Text(selfie != null ? "Change Selfie" : "Open Camera App"),
                  ),

                  SizedBox(height: height * 0.015),

                  Text(
                    "(Take a clear picture of yourself in good lighting)",
                    textAlign: TextAlign.center,
                  ),
                  if (selfie != null)
                    Text("✅ Selfie selected", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),

                  SizedBox(height: height * 0.20), // space for buttons
                ],
              ),
            ),

            // ✅ FIXED BOTTOM BUTTONS
            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🔙 BACK BUTTON
                  CircleAvatar(
                    radius: width * 0.058,
                    backgroundColor: Colors.grey[300],
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  // ➡️ NEXT BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      minimumSize: Size(width * 0.030, height * 0.050),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    onPressed: isUploading ? null : uploadDocuments,
                    child: isUploading
                        ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : Text(
                      "Next →",
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}