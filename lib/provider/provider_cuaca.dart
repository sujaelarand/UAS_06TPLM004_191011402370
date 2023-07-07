import 'package:flutter/material.dart';
import 'package:uas_06tplm006_cuaca/models/model_cuaca.dart';
import 'package:uas_06tplm006_cuaca/service/service_cuaca.dart';

class CuacaProvider extends ChangeNotifier {
  TextEditingController kota = TextEditingController();
  CuacaService cuacaService = CuacaService();
  CuacaModel cuacaModel = CuacaModel();

  showData() async {
    cuacaModel = await cuacaService.getCuaca(kota.text);
    notifyListeners();
  }
}
