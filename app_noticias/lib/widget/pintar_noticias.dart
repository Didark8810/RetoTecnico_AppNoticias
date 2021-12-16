import 'package:app_noticias/models/data_news.dart';
import 'package:app_noticias/pages/noticia_detalle.dart';
import 'package:flutter/material.dart';

class PintarNoticias extends StatelessWidget {
  const PintarNoticias({Key? key, required this.dataIn}) : super(key: key);
  final List<Articles> dataIn;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataIn.length,
      itemBuilder: (context, index) {
        return NoticiaCard(dataIn: dataIn[index]);
      },
    );
  }
}

class NoticiaCard extends StatelessWidget {
  const NoticiaCard({
    Key? key,
    required this.dataIn,
  }) : super(key: key);

  final Articles dataIn;

  @override
  Widget build(BuildContext context) {
    //dataIn.heroId = getRandomString(10);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoticiaDetalle(
              noticia: dataIn,
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  dataIn.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Hero(
                      tag: dataIn.heroId!,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const AssetImage('images/descarga.png'),
                            image: NetworkImage(dataIn.urlToImage),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Text(dataIn.description),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Fuente:" + dataIn.source.name,
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
                    ),
                    Text(
                      dataIn.publishedAt,
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
