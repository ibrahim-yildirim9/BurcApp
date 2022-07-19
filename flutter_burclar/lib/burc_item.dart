import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_detay.dart';
import 'package:flutter_burclar/model/burclar.dart';

class BurcItem extends StatelessWidget {
  final Burc listenelenBurc;
  const BurcItem({required this.listenelenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTheme = Theme.of(context).textTheme; //varsayılan temayı kullan
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/burcDetay',
                  arguments: listenelenBurc);
            },
            leading: Image.asset(
              "images/" + listenelenBurc.burcKucukResim,
            ),
            title: Text(
              listenelenBurc.burcAdi,
              style: myTheme.headline5,
            ),
            subtitle: Text(
              listenelenBurc.burcTarihi,
              style: myTheme.subtitle1,
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
