// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/usr.dart';
import 'package:http/http.dart' as http;
import 'second_screen.dart';

final fetchUserProvider =
    FutureProvider.family.autoDispose((ref, String input) {
  final userRepo = ref.watch(userRepoProvider);
  return userRepo.fetchUserData(input);
});

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 100];
});
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// final nameProvider = StateProvider<String?>((ref) => null);
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//     (ref) => UserNotifier(const User(name: "", email: 0)));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage2(),
    );
  }
}

// class MyWidget extends ConsumerWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final name2 = ref.read(nameProvider) ?? "";
//     final name2 = ref.watch(userProvider);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Center(
//           child: Text(name2.name),
//         ),
//       ),
//     );
//   }
// }
