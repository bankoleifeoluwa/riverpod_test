import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/main.dart';
import 'package:flutter_riverpod_test/usr.dart';

class MyHomePage2 extends ConsumerStatefulWidget {
  const MyHomePage2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends ConsumerState<MyHomePage2> {
  String userNo = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(fetchUserProvider(userNo)).when(
        data: (data) {
          return Scaffold(
            appBar: AppBar(
              title: Text("email is ${data.email}"),
            ),
            body: Column(
              children: [
                TextField(
                  onSubmitted: (value) {
                    setState(() {
                      userNo = value;
                    });
                  },
                ),
                Center(
                  child: Text(data.name),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(fetchUserProvider).when(
//       data: (data) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("email is ${data.email}"),
//           ),
//           body: Column(
//             children: [
//               TextField(),
//               Center(
//                 child: Text(data.name),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         );
//       },
//       error: (error, stackTrace) {
//         return Center(child: Text(error.toString()));
//       },
//       loading: () {
//         return Center(child: CircularProgressIndicator());
//       },
//     );

    // return Scaffold(
    //     body: ref.watch(streamProvider).when(
    //   data: (data) {
    //     return (Text(data.toString()));
    //   },
    //   error: (error, stackTrace) {
    //     return (Center(child: Text(error.toString())));
    //   },
    //   loading: () {
    //     return const Center(child: CircularProgressIndicator());
    //   },
    // ));
//   }
// }
