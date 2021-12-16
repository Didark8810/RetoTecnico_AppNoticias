import 'package:app_noticias/config/colors.dart';
import 'package:app_noticias/models/data_news.dart';
import 'package:flutter/material.dart';

class NoticiaDetalle extends StatelessWidget {
  const NoticiaDetalle({Key? key, required this.noticia}) : super(key: key);
  final Articles noticia;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticia"),
        centerTitle: true,
        backgroundColor: colorAppBar(),
      ),
      body: BodyNoticiaDetalle(noticia: noticia),
    );
  }
}

class BodyNoticiaDetalle extends StatelessWidget {
  const BodyNoticiaDetalle({
    Key? key,
    required this.noticia,
  }) : super(key: key);

  final Articles noticia;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          noticia.source.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: noticia.heroId!,
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('images/descarga.png'),
                  image: NetworkImage(noticia.urlToImage),
                ),
              ),
            ),
          ),
        ),
        Text(
          noticia.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(child: Text(noticia.description)),
      ],
    );
  }
}
