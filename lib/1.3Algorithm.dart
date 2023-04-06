List<String> calculateValues(List<String> answers) {
  int reaslisticUse = 0;
  int investigativeUse = 0;
  int artisticUse = 0;
  int socialUse = 0;
  int enterprisingUse = 0;
  int conventionalUse = 0;
  int ifUse = 0;
  int countYesUse = 0;

  for (String answer in answers) {
    if (ifUse <= 16 && answer == 'Yes') {
      reaslisticUse++;
      countYesUse++;
    } else if (ifUse > 16 && ifUse <= 34 && answer == 'Yes') {
      investigativeUse++;
      countYesUse++;
      print(countYesUse);
    } else if (ifUse > 35 && ifUse <= 47 && answer == 'Yes') {
      artisticUse++;
      countYesUse++;
      print(countYesUse);
    } else if (ifUse > 48 && ifUse <= 64 && answer == 'Yes') {
      socialUse++;
      countYesUse++;
      print(countYesUse);
    } else if (ifUse > 65 && ifUse <= 81 && answer == 'Yes') {
      enterprisingUse++;
      countYesUse++;
      print(countYesUse);
    } else if (ifUse > 82 && ifUse <= 98 && answer == 'Yes') {
      conventionalUse++;
      countYesUse++;
    }
    print(ifUse);
    ifUse++;
  }

  ////realisticCalculation
  double reaslisticValue = reaslisticUse / 17;
  var reaslisticString = (reaslisticValue * 100).toStringAsFixed(0);
  /* var reaslisticString = (reaslisticValue * 100).toStringAsFixed(0); */
  //
  //investigativeCalculation
  double investigativeValue = investigativeUse / 18;
  var investigativeString = (investigativeValue * 100).toStringAsFixed(0);
  //
  ////artisticCalculation
  double artisticValue = artisticUse / 14;
  var artisticString = (artisticValue * 100).toStringAsFixed(0);
  ////SosialCalculation
  double socialValue = socialUse / 18;
  var socialString = (socialValue * 100).toStringAsFixed(0);
  //
  ////enterprisingCalculation
  double enterprisingValue = enterprisingUse / 17;
  var enterprisingString = (enterprisingValue * 100).toStringAsFixed(0);
  //
  //conventionalCalculation
  double conventionalValue = conventionalUse / 16;
  var conventionalString = (conventionalValue * 100).toStringAsFixed(0);

  String countYesUseString = countYesUse.toStringAsFixed(0);
  /* print('Number of "Yes" answers: $countYesUseString ');
  print('Number of "reaslisticUse" answers: $reaslisticUse ');
  print('Number of "reaslisticValue" answers: $reaslisticValue ');
  print('Number of "reaslisticString" answers: $reaslisticString ');
  print('Number of "investigativeUse" answers: $investigativeUse ');

  print('Number of "investigativeValue" answers: $investigativeValue ');
  print('Number of "investigativeString" answers: $investigativeString ');

  print('Number of "artisticUse" answers: $artisticUse ');
  print('Number of "artisticValue" answers: $artisticValue ');
  print('Number of "artisticString" answers: $artisticString ');

  print('Number of "socialUse" answers: $socialUse ');
  print('Number of "socialValue" answers: $socialValue ');
  print('Number of "socialString" answers: $socialString ');

  print('Number of "enterprisingUse" answers: $enterprisingUse ');
  print('Number of "enterprisingValue" answers: $enterprisingValue ');
  print('Number of "enterprisingString" answers: $enterprisingString ');

  print('Number of "conventionalUse" answers: $conventionalUse ');
  print('Number of "conventionalValue" answers: $conventionalValue ');
  print('Number of "conventionalString" answers: $conventionalString '); */
  return [
    reaslisticString,
    investigativeString,
    artisticString,
    socialString,
    enterprisingString,
    conventionalString,
    //countYesUseString
  ];
}

List<String> findCategories(List<String> resultStrings) {
  List<String> Categories = [
    'realistic',
    'investigative',
    'artistic',
    'social',
    'enterprising',
    'conventional'
  ];

  List<int> resultInts = resultStrings.map(int.parse).toList();

  Map<String, int> categoryMap = Map.fromIterables(Categories, resultInts);
  List<MapEntry<String, int>> sortedCategories = categoryMap.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  List<String> topThreeCategories =
      sortedCategories.take(3).map((entry) => entry.key).toList();
  print(Categories);
  print(topThreeCategories);
  return topThreeCategories;
}
