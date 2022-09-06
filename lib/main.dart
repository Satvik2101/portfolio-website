import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/helpers/constants.dart';

import 'package:portfolio_website/helpers/data.dart';
import 'package:portfolio_website/helpers/ui_helper.dart';
import 'package:portfolio_website/widgets/experience_widget.dart';

import 'models/person.dart';

void main() {
  final Person person = Person.fromJson(rawData);

  runApp(MyApp(person: person));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.person,
  }) : super(key: key);
  final Person person;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: UIHelper.generateMaterialColor(primaryColor),
          textTheme: GoogleFonts.sourceCodeProTextTheme().copyWith(
            bodyText2: GoogleFonts.sourceCodePro(
              color: Colors.white,
              fontSize: 16,
            ),
          )),
      home: MyHomePage(person: person),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.person,
  }) : super(key: key);
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio Website"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                person.name,
              ),
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return ExperienceWidget(exp: person.experiences[idx]);
                },
                itemCount: person.experiences.length,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
