import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burclar.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc detayBurc;
  const BurcDetay({required this.detayBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    print('init state çalıştı');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) =>
        appbarRenginiBul()); //WidgetsBinding ilk önce build çalışsın sonra rengini bulsun
    //_generator = PaletteGenerator.fromImageProvider(AssetImage(assetName));
  } //initState ilk atamalar yağılırken kullanılır

  @override
  Widget build(BuildContext context) {
    print('build çalıştı');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.detayBurc.burcAdi + 'Burcu Ve Özellikleri'),
              centerTitle: true,
              background: Image.asset(
                'images/' + widget.detayBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Text(
                  widget.detayBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    print('build bitti renk bulunacak');
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/' + widget.detayBurc.burcBuyukResim));
    appbarRengi = _generator.vibrantColor!.color;
    print('renk bulundu');
    setState(() {});
    print(appbarRengi);
  }
}
