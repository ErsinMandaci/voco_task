import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/controller/riverpod_management.dart';
import 'package:voco_task/view/view_home/home_mixin.dart';

final class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userNotifierProvider).data;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await handleLogout();
            },
            icon: const Icon(Icons.close_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.06,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: Card(
                child: ListView.builder(
                  itemCount: userData?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(userData?[index].avatar ?? ''),
                      ),
                      subtitle: Text(userData?[index].email ?? ''),
                      title: Text("${userData?[index].first_name ?? ''} ${userData?[index].last_name ?? ''}"),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(userNotifierProvider.notifier).nextPage();
                  },
                  child: const Text('Next Page'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(userNotifierProvider.notifier).previousPage();
                  },
                  child: const Text('Previous Page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
