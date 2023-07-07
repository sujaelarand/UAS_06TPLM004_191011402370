import 'package:dio/dio.dart';
import 'package:uas_06tplm006_cuaca/models/model_cuaca.dart';

class CuacaService {
  final dio = Dio();

  Future<CuacaModel> getCuaca(String kota) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$kota&appid=e3a34b38b556caeca5d131cac9055b29');
    print(response.requestOptions.path);
    return CuacaModel.fromJson(response.data);
  }
}
