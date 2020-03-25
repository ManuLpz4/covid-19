import 'package:covid_19/src/models/foundation.dart';
import 'package:covid_19/src/ui/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage(this.foundation);

  final Foundation foundation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${foundation.name}'),
        centerTitle: true,
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Hero(
            tag: 'foundation_image_${foundation.id}',
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 4,
              child: Image(
                image: AssetImage('assets/images/foundation_placeholder.png'),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            '${foundation.name}',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Contribuí a ${foundation.name} para la compra de nuevo equipamiento médico con el objetivo de abastecer a nuestros héroes',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          AppContainer(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Meta'),
                      SizedBox(width: 8),
                      Text(
                        '\$${foundation.balance} / \$${foundation.goal}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 12,
                      width: (MediaQuery.of(context).size.width - 64) *
                          (foundation.balance / foundation.goal),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () => _showModalBottomSheet(context),
              padding: EdgeInsets.all(16),
              shape: StadiumBorder(),
              color: Colors.blue,
              child: Text(
                'Donar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 4,
                  width: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                ListTile(title: Text('Medios de pago')),
                ListTile(
                  leading: Image(
                    image: AssetImage('assets/images/mercadopago.png'),
                    width: 24,
                  ),
                  title: Text('Mercado Pago'),
                  onTap: () {
                    Navigator.pop(context);
                    launch('https://www.mercadopago.com.ar');
                  },
                ),
                ListTile(
                  leading: Image(
                    image: AssetImage('assets/images/todo_pago.png'),
                    width: 24,
                  ),
                  title: Text('Todo Pago'),
                  onTap: () {
                    Navigator.pop(context);
                    launch('https://www.todopago.com.ar');
                  },
                ),
              ],
            ),
          );
        });
  }
}
