import 'dart:async';
import 'dart:math';

import 'package:gerencia_de_estado_pura/bloc_pattern/imc_state.dart';

class ImcBlocPatternController {
  final _imcStreamController = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));

  Stream<ImcState> get imcOut => _imcStreamController.stream;

  // Sink<ImcState> get imcIn => _imcStreamController.sink;

  Future<void> calcularImc(
      {required double peso, required double altura}) async {
    try {
      _imcStreamController.add(ImcStateLoading());

      await Future.delayed(Duration(seconds: 1));

      _imcStreamController.add(ImcState(imc: 50));

      await Future.delayed(Duration(seconds: 1));

      var imc = peso / pow(altura, 2);

      _imcStreamController.add(ImcState(imc: imc));

      //   throw Exception();
    } on Exception catch (e) {
      _imcStreamController.add(ImcStateError(message: "Erro ao carregar imc"));
    }
  }

  void dispose() {
    _imcStreamController.close();
  }
}
