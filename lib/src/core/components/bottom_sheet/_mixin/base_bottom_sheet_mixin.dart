// import 'package:flutter/material.dart';
//
// mixin BaseBottomSheetMixin on StatelessWidget {
//   Future<T?> show<T>(BuildContext context) {
//     return showModalBottomSheet<T>(
//       context: context,
//       shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.vertical(top: const Radius.circular(20).r)),
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(0.05, 0.05, 0.05, 0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               //* Drag Indicator
//               Divider(
//                 thickness: 2,
//                 endIndent: 0.35,
//                 indent: 0.35,
//                 color: Theme.of(context).disabledColor,
//               ),
//
//               SizedBox(height: 20),
//               this,
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
