import 'package:adhan_dart/adhan_dart.dart';
import 'package:chalk/chalk.dart';
import 'package:intl/intl.dart';
import 'package:args/args.dart';
import 'package:dart_inquirer/dart_inquirer.dart';
import 'Client.dart';

Future askForMissingArgs() async {
  // final dialog = CLI_Dialog(listQuestions: [
  //   [
  //     {
  //       "question": "What you want to do?",
  //       "options": [
  //         "See today's Salah timimgs",
  //         "Configure Salah Daemon Settings",
  //         "Help",
  //         "Quit"
  //       ],
  //     },
  //     "action"
  //   ]
  // ]);

  // final result = dialog.ask();

  // return result["action"];

  List<Question> questions = [
    ListQuestion("action", "What you want to do?", [
      "See today's Salah timimgs",
      "Configure Salah Daemon Settings",
      "Help",
      "Quit"
    ])
  ];

  Prompt prompt = Prompt(questions);

  String action = (await prompt.execute())["action"];

  return action;
}

void main(List<String> arguments) async {
  print(
    chalk.blue("As-salamu alaykum wa Ra'hmatullaahi wa Barakaatuhu!\n").bold(),
  );

  final parser = ArgParser();
  parser.addFlag("configure", abbr: "c", help: "Configure Salah Daemon");
  parser.addFlag("help", abbr: "h", help: "Help");
  parser.addFlag("today", abbr: "t", help: "See today's Salah timimgs");

  // print(arguments);

  if (arguments.isEmpty) {
    final action = await askForMissingArgs();

    print(action);
  }

  // final parser = ArgParser();
  // parser.addOption('latitude', abbr: 'l', defaultsTo: '0.0');
  // parser.addOption('longitude', abbr: 'g', defaultsTo: '0.0');
  // parser.addFlag('help', abbr: 'h', defaultsTo: false);
  // parser.addFlag('configure', abbr: 'c', defaultsTo: false);

  // if (arguments.contains('--configure')) {
  //   ConfigWizard wizard = ConfigWizard();

  //   wizard.startWizard();
  // }

  // final myCoordinates = Coordinates(23.9088, 89.1220);
  // final date = DateTime.now();
  // final params = CalculationMethod.Karachi();
  // params.madhab = Madhab.Hanafi;
  // final prayerTimes = PrayerTimes(myCoordinates, date, params);

  // print('My Prayer Times');
  // print(DateFormat.jm().format(prayerTimes.fajr!));
  // print(DateFormat.jm().format(prayerTimes.sunrise!));
  // print(DateFormat.jm().format(prayerTimes.dhuhr!));
  // print(DateFormat.jm().format(prayerTimes.asr!));
  // print(DateFormat.jm().format(prayerTimes.maghrib!));
  // print(DateFormat.jm().format(prayerTimes.isha!));
}
