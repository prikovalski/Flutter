import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoConta = 'Número da Conta';
const _dicaCampoConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{

  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(controlador: _controllerNumeroConta,rotulo: _rotuloCampoConta,dica: _dicaCampoConta),
              Editor(controlador: _controllerValor,rotulo: _rotuloCampoValor,dica: _dicaCampoValor,icone: Icons.monetization_on),

              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              )
            ],
          ),
        )
    );
  }
  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
    int.tryParse(_controllerNumeroConta.text);
    final double valor = double.tryParse(_controllerValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
        Navigator.pop(context, transferenciaCriada);
    }
  }

}