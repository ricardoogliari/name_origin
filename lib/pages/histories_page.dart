import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name_origin/controller/history_controller.dart';
import 'package:name_origin/model/history.dart';

class HistoriesPage extends GetView<HistoryController> {

  @override
  Widget build(BuildContext context) {
    controller.listHistories();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("History"),
        actions: [
          IconButton(
              onPressed: (){
                controller.clearHistories();
              },
              icon: const Icon(Icons.clear_all))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.obx((state) {
              return mainSection(state ?? []);
            },
            onEmpty: mainSection([]),
            onLoading: const CircularProgressIndicator(),
            onError: (error) => Center(child: Text(error ?? "Erro"),),
          )
      ),
    );
  }

  Widget mainSection(List<History> histories) => SingleChildScrollView(
    child: ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(histories[index].name),
      ),
      separatorBuilder: (context, index) => const Divider(height: 1,),
      itemCount: histories.length)
  );
}
