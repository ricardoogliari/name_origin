import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name_origin/controller/history_controller.dart';
import 'package:name_origin/controller/name_controller.dart';
import 'package:name_origin/model/country.dart';
import 'package:name_origin/model/history.dart';

class HomePage extends GetView<NameController> {

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Names"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/history');
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.obx(
                (state) {
              return mainSection(state?.country ?? []);
            },
            onEmpty: mainSection([]),
            onLoading: const CircularProgressIndicator(),
            onError: (error) => Center(child: Text(error ?? "Erro"),),
          )
      ),
    );
  }

  Widget mainSection(List<Country> countries) => SingleChildScrollView(
    child: Column(
      children: <Widget>[
        TextFormField (
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: 'Type the name',
            labelText: 'Name',
          ),
          validator: (String? value) {
            return (value != null) ? 'Do not use the @ char.' : null;
          },
        ),
        const SizedBox(height: 24,),
        ElevatedButton(
            onPressed: () {
              Get.find<HistoryController>().insertHistory(
                  History(name: _nameController.text, timestamp: DateTime.now().millisecond)
              );
              controller.searchOrigin(_nameController.text);
            },
            child: const Text("Check")),
        const SizedBox(height: 24,),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text("Country: ${countries[index].country_id}. Probabilidade: ${countries[index].probability.toStringAsPrecision(4)}%"),
            ),
            separatorBuilder: (context, index) => const Divider(height: 1,),
            itemCount: countries.length)
      ],
    ),
  );
}
