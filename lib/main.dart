import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        body: PageAccueil(),
      ),
    );
  }
}

// Create a Form widget.
class PageAccueil extends StatefulWidget {
  @override
  PageAccueilState createState() {
    return PageAccueilState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class PageAccueilState extends State<PageAccueil> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  var texteTemp = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height:150),
          Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                    child:                  
                      Image.asset(
                        'images/logo.jpg',
                        width:300,
                        height:60,
                        fit:BoxFit.contain,
                        //alignment: Alignment.center,
                      ),
                )
              ),
            Container(height:120),
            Text('Bienvenue!', style: TextStyle(fontSize:16)
            ),
            Container(height:10),
            Text('Pour débuter, entrez votre nom',
            style: TextStyle(
              //color: Colors.black,
              //fontStyle: FontStyle.italic,
              fontSize:18,
              //fontFamily: 'Times New Roman',
              //fontWeight: FontWeight.w100,
              ),
            ),
            Container(height:30),
            Container(
              width:220,
              height: 30,
              child:
              TextFormField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: myController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Veuillez ne laisser pas le champ vide';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: ('Entrez votre nom ici'),
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  ),
              ),
            ),
            Container(height:15),
            Container(
              height: 30,
              child: RaisedButton(
                    textColor: Colors.black,
                    color: Colors.grey[75],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black12),
                    ),
                    child: 
                      Text('Continuer', style:TextStyle(fontSize: 16)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        texteTemp = myController.text;                      
                        _naviguerPageUn(context);
                        /*return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the user has entered by using the
                              // TextEditingController.
                              content: Text("Bienvenue, $texteTemp!"),
                            );
                          },
                        );*/                                              
                      }                  
                    }
              )
            ),
        ],
      ),
    );
  }
  void _naviguerPageUn(BuildContext context) {
  String texteTemp = myController.text;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageUn(text: texteTemp),
      ));
  }
}

// Page Un

class PageUn extends StatelessWidget {
  final String text;
  PageUn({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height:110),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                    child:                  
                      Image.asset(
                        'images/logo.jpg',
                        width:310,
                        height:60,
                        fit:BoxFit.contain,
                        //alignment: Alignment.center,
                      ),
                )
              )
              ]
            ),
            Container(height: 17.5),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
                  child: 
                  Text("Bienvenue $text!",
                    style: TextStyle(fontSize: 16)
                  ),
              )
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
                  child: 
                  Text("Pour accéder au campus aujourd'hui, tu dois compléter le questionnaire.",
                    style: TextStyle(fontSize: 16)
                  ),
              )
            ),
            Container(height:15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  height: 25,
                  width: 310,
                  child:
                  RaisedButton(
                    textColor: Colors.black,
                          color: Colors.grey[75],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black12),
                          ),
                    child: Text('Completer le questionnaire',
                            style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.pop(context);
                      _naviguerPageDeux(context);
                    },
                  )
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
  void _naviguerPageDeux(BuildContext context) {
  String texteTemp = text;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDeux(text: texteTemp),
      ));
  }
}


// Page Deux


class PageDeux extends StatefulWidget {
  final String text;
  final int hScore;
  PageDeux({Key key, this.text, this.hScore}) : super(key: key);
  


  @override
  _PageDeuxState createState() => _PageDeuxState();
}

class _PageDeuxState extends State<PageDeux> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                    child:                  
                      Image.asset(
                        'images/logo.jpg',
                        width:310,
                        height:60,
                        fit:BoxFit.contain,
                        //alignment: Alignment.center,
                      ),
                )
              )
              ]
            ),
            Container(height: 17.5),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
                  child: 
                  Text("Formulaire COVID-19 pour ${widget.text}",
                    style: TextStyle(fontSize: 16)
                  ),
              )
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
                  child: 
                  Text("Date 2020-11-25",
                    style: TextStyle(fontSize: 16)
                  ),
              )
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: 
                  Text("Aujourd'hui, je me sens: ${widget.hScore}",
                    style: TextStyle(fontSize: 16)
                  ),
              )
            ),
            
            //icônes

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SadWidget(),
                NeutralWidget(),
                HappyWidget(),
              ],
            ),
            Row(
              children: <Widget> [
                Container(
                  width: 190,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
                      child: 
                      Text("J'ai voyagé hors du Canada dans les derniers 14 jours:",
                        style: TextStyle(fontSize: 16)
                      ),
                  )
                ),
                CrossmarkWidget(),
                CheckmarkWidget(),
              ]
            ),
            Row(
              children: <Widget> [
                Container(
                  width: 190,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
                      child: 
                      Text("J'ai été en contacte avec un individu qui a eu COVID-19 dans les derniers 14 jours:",
                        style: TextStyle(fontSize: 16)
                      ),
                  )
                ),
                CrossmarkWidget(),
                CheckmarkWidget(),
              ]
            ),
            Container(height:15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  height: 25,
                  width: 125,
                  child:
                  RaisedButton(
                    textColor: Colors.black,
                          color: Colors.grey[75],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black12),
                          ),
                    child: Text('Soumettre',
                            style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.pop(context);
                      _naviguerPageUn(context);
                    },
                  )
                ),                
              ]
            ),
          ],
        ),
      ),
    );
  }

  void _naviguerPageUn(BuildContext context) {
  String texteTemp = widget.text;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageUn(text: texteTemp),
      ));
  }
}

class SadWidget extends StatefulWidget {
  @override
  _SadWidgetState createState() => _SadWidgetState();
}

class _SadWidgetState extends State<SadWidget> {
  bool _isFavorited = false;
  int healthScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.do_not_disturb_alt, color: Colors.red) : Icon(Icons.do_not_disturb_alt, color: Colors.red[100])),
            //color: Colors.red[500],
            onPressed: _toggleActif, 
          ),
        ),
          SizedBox(
          width: 18,
          child: Container(
            child: Text('$healthScore'),
          ),
        ),
      ],
    );
  }
  void _toggleActif() {
  setState(() {
    if (_isFavorited) {
      healthScore -= 1;
      _isFavorited = false;
    } else {
      healthScore += 1;
      _isFavorited = true;
    }
    /*
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDeux(hScore: healthScore),
      ));
      */
  });
}
}


class NeutralWidget extends StatefulWidget {
  @override
  _NeutralWidgetState createState() => _NeutralWidgetState();
}

class _NeutralWidgetState extends State<NeutralWidget> {
  bool _isFavorited = false;
  int healthScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.brightness_1, color: Colors.yellow[600]) : Icon(Icons.brightness_1_outlined, color: Colors.yellow[300])),
            //color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$healthScore'),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      healthScore -= 2;
      _isFavorited = false;
    } else {
      healthScore += 2;
      _isFavorited = true;
    }
    /*
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDeux(hScore: healthScore),
      ));
    */
  });
}
}


class HappyWidget extends StatefulWidget {
  @override
  _HappyWidgetState createState() => _HappyWidgetState();
}

class _HappyWidgetState extends State<HappyWidget> {
  bool _isFavorited = false;
  int healthScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.brightness_1, color: Colors.green,) : Icon(Icons.brightness_1_outlined, color: Colors.green[100])),
            //color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$healthScore'),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      healthScore -= 3;
      _isFavorited = false;
    } else {
      healthScore += 3;
      _isFavorited = true;
    }
    /*
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDeux(hScore: healthScore),
      ));
    */
  });
}
}


class CrossmarkWidget extends StatefulWidget {
  @override
  _CrossmarkWidgetState createState() => _CrossmarkWidgetState();
}

class _CrossmarkWidgetState extends State<CrossmarkWidget> {
  bool _isFavorited = false;
  int healthScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.clear, color: Colors.black) : Icon(Icons.clear, color: Colors.black26)),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$healthScore'),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      healthScore -= 1;
      _isFavorited = false;
    } else {
      healthScore += 1;
      _isFavorited = true;
    }
    /*
       Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDeux(hScore: healthScore1),
      ));
    */
  });
}
}


class CheckmarkWidget extends StatefulWidget {
  @override
  _CheckmarkWidgetState createState() => _CheckmarkWidgetState();
}

class _CheckmarkWidgetState extends State<CheckmarkWidget> {
  bool _isFavorited = false;
  int healthScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.check, color: Colors.black) : Icon(Icons.check, color: Colors.black26)),
            //color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$healthScore'),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      healthScore += 1;
      _isFavorited = false;
    } else {
      healthScore -= 1;
      _isFavorited = true;
    }
    /*
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDeux(hScore: healthScore3),
      ));
    */
  });
}
}