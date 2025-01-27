import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio();
    dio.options.baseUrl = 'https://rickandmortyapi.com/api';
    dio.options.connectTimeout =
        Duration(milliseconds: 50000); // Tiempo de espera en milisegundos
    dio.options.receiveTimeout =
        Duration(milliseconds: 3000); // Tiempo de espera en milisegundos

    // Agregar un interceptor para ver las solicitudes y respuestas
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("Request: ${options.uri}");
        return handler.next(options); // Permitir que continúe con la solicitud
      },
      onResponse: (response, handler) {
        debugPrint("Response: ${response.statusCode}");
        return handler.next(response); // Permitir que continúe con la respuesta
      },
      onError: (DioException e, handler) {
        debugPrint("Error: ${e.message}");
        return handler.next(e); // Permitir que continúe con el error
      },
    ));
  }
}
