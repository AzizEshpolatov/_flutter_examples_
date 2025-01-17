// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:tmp/core/common/words.dart';
// import 'package:tmp/core/extensions/size_extension.dart';
// import 'package:tmp/core/utils/colors.dart';
// import 'package:tmp/core/utils/text_styles.dart';
// import 'package:tmp/di.dart';
// import 'package:tmp/pages/auth_group/login/pages/login_page.dart';
// import 'navigation_extensions.dart';
//
// void showError(Exception exception) {
//   String message = "Error";
//   if (exception is DioException) {
//     if (exception.response!.statusCode! == 401) {
//       message = "${Words.expiredToken.tr()}\n${Words.userNotFoundError.tr()}";
//       pushAndRemoveUntil(const LoginPage());
//     } else if (exception.response!.statusCode! >= 500) {
//       message = Words.serverError.tr();
//     } else {
//       try {
//         message = exception.response?.data["error"];
//       } catch (e) {
//         message = Words.somethingWentWrong.tr();
//       }
//     }
//   } else if (exception is FormatException) {
//     message = Words.somethingWentWrong.tr();
//   }
//   showDialog(
//       context: mainKey.currentContext!,
//       barrierDismissible: false,
//       barrierColor: AppColors.black.withOpacity(0.2),
//       builder: (_) {
//         Future.delayed(const Duration(seconds: 2), () {
//           pop();
//         });
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               margin: const EdgeInsets.all(12),
//               width: double.infinity,
//               alignment: Alignment.topRight,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xFFffd9d9),
//                 border: Border.all(width: 1, color: AppColors.red),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       message,
//                       style: AppTextStyles.style500.copyWith(
//                         color: AppColors.red,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(),
//                 ],
//               ),
//             ),
//           ],
//         );
//       });
// }
//
// void showSuccess(String e) {
//   var duration = 2000 + e.length * 50;
//   toast.successToast(
//     message: e,
//     alignment: Alignment.topCenter,
//     duration: duration < 4000 ? duration : 4000,
//   );
// }
//
// void showErrors(String e) {
//   var duration = 2000 + e.length * 50;
//   toast.errorToast(
//     message: e,
//     alignment: Alignment.topCenter,
//     duration: duration < 4000 ? duration : 4000,
//   );
// }
//
// extension MyException on Object {
//   String get message {
//     return "$this";
//   }
// }
//
// void showCustomSnackBar(BuildContext context, String message,
//     {Duration duration = const Duration(seconds: 2)}) {
//   final snackBar = SnackBar(
//     content: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         const Icon(Icons.error, color: AppColors.white),
//         const SizedBox(width: 5),
//         Expanded(child: Text(message)),
//       ],
//     ),
//     duration: duration,
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: AppColors.cf04438,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//   );
//
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
//
// void showCustomDialog({
//   required BuildContext context,
//   required String message,
//   required String title,
//   required VoidCallback okButtonOnPressed,
// }) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     barrierColor: AppColors.black.withOpacity(0.2),
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.w),
//         ),
//         elevation: 5.w,
//         backgroundColor: AppColors.white,
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 20.w,
//           vertical: 15.h,
//         ),
//         title: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 20.w,
//               fontWeight: FontWeight.bold,
//               color: AppColors.black,
//             ),
//           ),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               message,
//               style: TextStyle(
//                 fontSize: 16.w,
//                 color: AppColors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     height: 48.h,
//                     child: ElevatedButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.grey,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.w),
//                         ),
//                       ),
//                       child: Text(
//                         Words.cancel.tr(),
//                         style: AppTextStyles.style400.copyWith(
//                           fontSize: 14.w,
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 10.getW(),
//                 Expanded(
//                   child: SizedBox(
//                     height: 48.h,
//                     child: ElevatedButton(
//                       onPressed: okButtonOnPressed,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.red,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.w)),
//                       ),
//                       child: Text(
//                         Words.ok.tr(),
//                         style: AppTextStyles.style400.copyWith(
//                           fontSize: 14.w,
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
