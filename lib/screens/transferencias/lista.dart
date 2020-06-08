import 'package:bytebank/models/tranferencia.dart';
import 'package:bytebank/screens/transferencias/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }


}

class ListaTransferenciasState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context,indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencias();
          },

          ));
          future.then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() {
      if(transferenciaRecebida != null) {
        widget._transferencias.add(transferenciaRecebida);
      }
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on), //Icone da lista
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}