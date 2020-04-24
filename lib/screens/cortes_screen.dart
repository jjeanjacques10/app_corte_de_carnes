import 'package:app_corte_de_carnes/models/cortes_model.dart';
import 'package:app_corte_de_carnes/repository/cortes_repository.dart';
import 'package:flutter/material.dart';

class CortesSreen extends StatefulWidget {
  @override
  _CortesSreenState createState() => _CortesSreenState();
}

class _CortesSreenState extends State<CortesSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        title: Text('Açougue do Jean'),
        backgroundColor: Colors.red[900],
        leading: IconButton(
          icon: Image.asset('assets/images/bull.png'),
          onPressed: null,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: CorteRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<CorteModel> cortes) {
    return ListView.builder(
      itemCount: cortes == null ? 0 : cortes.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardCorte(cortes[index]);
      },
    );
  }

  Card cardCorte(CorteModel corte) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 50.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 6.0,
                  color: Colors.red[900],
                ),
              ),
            ),
            child: _construirImagemCard(corte.image),
          ),
          title: Text(
            corte.name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${corte.qtd.toString()} Kg",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "R\$${corte.preco.toString()}",
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/cortes_detalhes",
              arguments: corte,
            );
          },
        ),
      ),
    );
  }

  Widget _construirImagemCard(foto) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Image.asset(
          foto,
          fit: BoxFit.cover,
          height: 900,
          width: 90,
        ));
  }
}
