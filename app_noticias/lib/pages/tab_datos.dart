import 'dart:convert';

import 'package:app_noticias/config/datos.dart';
import 'package:app_noticias/models/data_news.dart';
import 'package:app_noticias/widget/pintar_noticias.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TabDatos extends StatefulWidget {
  const TabDatos({Key? key, required this.tipo}) : super(key: key);
  final CategoriaEnum tipo;

  @override
  _TabDatosState createState() => _TabDatosState();
}

class _TabDatosState extends State<TabDatos> with AutomaticKeepAliveClientMixin {
  late Future getDataRemoto;
  @override
  void initState() {
    super.initState();
    getDataRemoto = getData(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataRemoto,
      builder: (context, snapshot) {
        return snapshot.data != null
            ? PintarNoticias(
                dataIn: snapshot.data as List<Articles>,
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget pintarData(List<Articles> dataIn) {
    return Text("encontrados :" + dataIn.length.toString());
  }

  Future<List<Articles>> getData(CategoriaEnum category) async {
    final response = await http.get(
      Uri.parse(getBaseUrl() + '/v2/top-headlines?country=co&apiKey=' + getKey() + '&category=' + EnumToString.convertToString(category)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var responseJson = json.decode(response.body);
      DataNews resp = DataNews.fromJson(responseJson);
      return resp.articles;
    } else {
      throw Exception('Failed getting data news');
    }
  }

  @override
  bool get wantKeepAlive => true;
}
