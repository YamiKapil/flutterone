// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_one/screen_utils_testing/testing_screen_two.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// void main() {
//   runApp(const ScreenUtilsTesting());
// }

// class ScreenUtilsTesting extends StatelessWidget {
//   const ScreenUtilsTesting({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: false,
//       designSize: const Size(360, 640),
//       builder: () => MaterialApp(
//         //... other code
//         builder: (context, child) {
//           //add this line
//           ScreenUtil.setContext(context);
//           log(MediaQuery.of(context).textScaleFactor.toString());
//           final scale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2);
//           return MediaQuery(
//             //Setting font does not change with system font size
//             data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
//             child: child!,
//           );
//         },
//         home: TestingOne(),
//         // home: TestingScreenTwo(),
//       ),
//     );
//   }
// }

// class TestingOne extends StatelessWidget {
//   const TestingOne({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 52.h),
//                 Text(
//                   'Sign up to code himalaya',
//                   style: TextStyle(
//                     fontSize: 18.sm,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(height: 4.h),
//                 Wrap(
//                   children: [
//                     Text(
//                       'Already have an account?',
//                       style: TextStyle(
//                         fontSize: 14.sm,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 14.sm,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.purple,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24.h),
//                 SvgPicture.asset('assets/images/lighting.svg'),
//                 getTextField(hintText: 'Full Name'),
//                 SizedBox(height: 16.h),
//                 getTextField(hintText: 'Email'),
//                 SizedBox(height: 16.h),
//                 getTextField(hintText: 'Password'),
//                 SizedBox(height: 16.h),
//                 getTextField(hintText: 'Confirm Password'),
//                 SizedBox(height: 16.h),
//                 SizedBox(
//                   width: double.infinity,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Text('Create Account'),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.purple),
//                       foregroundColor: MaterialStateProperty.all(Colors.white),
//                       padding: MaterialStateProperty.all(
//                         EdgeInsets.symmetric(
//                           vertical: 14.h,
//                         ),
//                       ),
//                       textStyle: MaterialStateProperty.all(
//                         TextStyle(
//                           fontSize: 14.sm,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 Row(
//                   children: [
//                     const Expanded(
//                       child: Divider(),
//                     ),
//                     SizedBox(width: 16.w),
//                     Text(
//                       'or sign up via',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey.shade500,
//                         fontSize: 14.sm,
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     const Expanded(
//                       child: Divider(),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16.h),
//                 SizedBox(
//                   width: double.infinity,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.network(
//                           'https://freesvg.org/img/1534129544.png',
//                           height: 15.w,
//                           width: 15.w,
//                         ),
//                         SizedBox(width: 10.w),
//                         const Text('Google'),
//                       ],
//                     ),
//                     style: ButtonStyle(
//                       side: MaterialStateProperty.all(
//                         BorderSide(color: Colors.grey),
//                       ),
//                       // backgroundColor: MaterialStateProperty.all(Colors.purple),
//                       foregroundColor: MaterialStateProperty.all(Colors.black),
//                       padding: MaterialStateProperty.all(
//                         EdgeInsets.symmetric(
//                           vertical: 14.h,
//                         ),
//                       ),
//                       textStyle: MaterialStateProperty.all(
//                         TextStyle(
//                           fontSize: 14.sm,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 Wrap(
//                   children: [
//                     Text(
//                       'By signing up to CodeHimalaya you agree to our',
//                       style: TextStyle(
//                         fontSize: 12.sm,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Text(
//                       'terms and conditions',
//                       style: TextStyle(
//                         fontSize: 12.sm,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.purple,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getTextField({required String hintText}) {
//     return TextField(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: const BorderSide(color: Colors.transparent, width: 0),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: const BorderSide(color: Colors.transparent, width: 0),
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//         filled: true,
//         fillColor: Colors.grey.shade200,
//         hintText: hintText,
//         hintStyle: TextStyle(
//           fontSize: 14.sm,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//   }
// }
