// import 'dart:html' as html;
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:trabalho_mobile/http/file_http.dart';

// class FileTestPage extends StatefulWidget {
//   @override
//   _FileTestPageState createState() => _FileTestPageState();
// }

// class _FileTestPageState extends State<FileTestPage> {
//   final FileHttp fileHttp = FileHttp();
//   bool isLoading = false;
//   String? errorMessage;

//   void pickFileAndUpload() async {
//     final html.FileUploadInputElement uploadInput =
//         html.FileUploadInputElement();
//     uploadInput.accept = 'image/*';
//     uploadInput.click();

//     uploadInput.onChange.listen((e) async {
//       final files = uploadInput.files;
//       if (files!.isEmpty) return;

//       final file = files[0];
//       setState(() {
//         isLoading = true;
//         errorMessage = null;
//       });

//       try {
//         final reader = html.FileReader();
//         reader.readAsArrayBuffer(file);

//         reader.onLoadEnd.listen((e) async {
//           final fileBytes = reader.result as Uint8List;
//           await fileHttp.uploadFileFromBytes(fileBytes, file.name);
//         });

//         reader.onError.listen((e) {
//           setState(() {
//             errorMessage = "Failed to read the file.";
//           });
//         });
//       } catch (e) {
//         setState(() {
//           errorMessage = e.toString();
//         });
//       } finally {
//         setState(() {
//           isLoading = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Upload File")),
//       body: Center(
//         child: isLoading
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: pickFileAndUpload,
//                     child: Text("Pick and Upload File"),
//                   ),
//                   if (errorMessage != null)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         errorMessage!,
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
