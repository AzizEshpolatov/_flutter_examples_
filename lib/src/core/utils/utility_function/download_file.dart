// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:tmp/core/extensions/error_extensions.dart';
//
// class FileDownloader {
//   static Future<void> downloadAndOpenPdf(
//       String url, {
//         required Function(int progress) onProgress,
//       }) async {
//     try {
//       final tempDir = await getTemporaryDirectory();
//       final filePath = '${tempDir.path}/${url.split('/').last}';
//
//       await Dio().download(
//         url,
//         filePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             final progress = (received / total * 100).toInt();
//             onProgress(progress);
//           }
//         },
//       );
//       debugPrint("Fayl saqlandi: $filePath");
//
//       final result = await OpenFile.open(filePath);
//       if (result.type == ResultType.error) {
//         showErrors("Faylni ochib bo'lmadi!");
//       }
//     } catch (e) {
//       throw Exception("Fayl yuklashda xatolik: $e");
//     }
//   }
// }
