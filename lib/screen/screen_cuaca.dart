import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:uas_06tplm006_cuaca/models/model_cuaca.dart';
import 'package:uas_06tplm006_cuaca/provider/provider_cuaca.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CuacaProvider cuacaProvider = CuacaProvider();

  String formatDate = DateFormat("MMMM dd, yyyy").format(DateTime.now());
  var date = DateFormat("EEEE").format(DateTime.now());

  get provider => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 75, 72),
      appBar: AppBar(
        title: const Text("UAS_Sujaela Rando_191011402370"),
      ),
      body: Consumer<CuacaProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "${provider.cuacaModel.name}",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${date}, ${formatDate}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${provider.cuacaModel.main?.temp}°K",
                  style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              TextFormField(
                controller: provider.kota,
                decoration: InputDecoration(
                  hintText: "Kota",
                  labelText: "Nama Kota",
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.greenAccent,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  provider.showData();
                },
                child: Text("Submit"),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${provider.cuacaModel.clouds}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${provider.cuacaModel.main?.tempMin}°K / ${provider.cuacaModel.main?.tempMax}°K",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
