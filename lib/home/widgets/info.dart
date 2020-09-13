import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var commonText = new RichText(
  textAlign: TextAlign.justify,
  text: new TextSpan(
    style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black
    ),
    children: <TextSpan>[
      new TextSpan(text: 'O resultado da enquisa '),
      new TextSpan(text: 'NON ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: 'ten que comunicarse cada día aos centros educativos, '
          'senón que o afectado deberá seguir o protocolo oportuno en caso de '
          'detectar síntomas.\n\n')
    ],
  ),
);

var teachersText = new RichText(
  textAlign: TextAlign.justify,
  text: new TextSpan(
    style: new TextStyle(
      fontSize: 14.0,
      color: Colors.black
    ),
    children: <TextSpan>[
      new TextSpan(text: 'Protocolo a seguir polo persoal en caso de detectar un '
      'ou mais síntomas:\n\n', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: '1. '),
      new TextSpan(text: 'Non acudir ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: 'ao centro educativo.\n\n'),
      new TextSpan(text: '2. '),
      new TextSpan(text: 'Comunicar os síntomas ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: 'ao servizo sanitario.\n\n'),
      new TextSpan(text: '3. Comunicar a situación ao '),
      new TextSpan(text: 'equipo covid ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: 'do seu centro educativo.\n\n'),
      new TextSpan(text: '4. De forma preventiva, debe manterse en '),
      new TextSpan(text: 'illamento domiciliario ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: ', ata que os facultativos correspondentes dean as indicación oportunas.\n\n'),
    ],
  ),
);

var studentsText = new RichText(
  textAlign: TextAlign.justify,
  text: new TextSpan(
    style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black
    ),
    children: <TextSpan>[
      new TextSpan(text: 'Protocolo a seguir polo alumno (ou pais/nais ou titores legais) '
          'en caso de detectar un ou mais síntomas:\n\n', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: '1. '),
      new TextSpan(text: 'Non acudir ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: 'ao centro educativo.\n\n'),
      new TextSpan(text: '2. '),
      new TextSpan(text: 'Comunicar os síntomas ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: 'ao servizo sanitario.\n\n'),
      new TextSpan(text: '3. Comunicar ao centro a ausencia do alumno ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: '(non é necesario certificado médico, so xustificante dos pais. '
          'Non computará como falta) '),
      new TextSpan(text: '4. De forma preventiva, debe manterse ao alumno en '),
      new TextSpan(text: 'illamento domiciliario ', style: new TextStyle(fontWeight: FontWeight.bold)),
      new TextSpan(text: ', ata que os facultativos correspondentes dean as indicación oportunas.\n\n'),
    ],
  ),
);

class Info extends StatelessWidget {
  Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _TeachersInfo(),
          _StudentsInfo()
        ],
      ),
    );
  }
}

class _TeachersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
                leading: Icon(FontAwesomeIcons.graduationCap, color: Colors.white,),
                title: Text('Persoal dos centros',
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
                tileColor: Color.fromARGB(255, 0, 112, 174),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 5,
                      right: 15,
                      bottom: 5,
                    ),
                    child: Column(
                        children: [commonText, teachersText]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

class _StudentsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
                leading: Icon(FontAwesomeIcons.child, color: Colors.white,),
                title: Text('Alumnado',
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
                tileColor: Color.fromARGB(255, 0, 112, 174),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 5,
                      right: 15,
                      bottom: 5,
                    ),
                    child: Column(
                        children: [commonText, studentsText]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}