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
      ifUse++;
      countYesUse++;
    }
    if (ifUse > 16 && ifUse <= 34 && answer == 'Yes') {
      investigativeUse++;
      ifUse++;
      countYesUse++;
      print(countYesUse);
    }
    if (ifUse > 35 && ifUse <= 47 && answer == 'Yes') {
      artisticUse++;
      ifUse++;
      countYesUse++;
      print(countYesUse);
    }
    if (ifUse > 48 && ifUse <= 64 && answer == 'Yes') {
      socialUse++;
      ifUse++;
      countYesUse++;
      print(countYesUse);
    }
    if (ifUse > 65 && ifUse <= 81 && answer == 'Yes') {
      enterprisingUse++;
      ifUse++;
      countYesUse++;
      print(countYesUse);
    }
    if (ifUse > 65 && ifUse <= 81 && answer == 'Yes') {
      conventionalUse++;
      ifUse++;
      countYesUse++;
    }
  }
  /* print('artisticUse:');
  print(artisticUse);
  print('/n');
  print('countYesUse:');
  print(countYesUse);
  print('/n'); */
  //
  ////realisticCalculation
  double reaslisticValue = reaslisticUse / 17;
  var reaslisticString = (reaslisticValue * 100).toStringAsFixed(0);
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

  return [
    reaslisticString,
    investigativeString,
    artisticString,
    socialString,
    enterprisingString,
    conventionalString,
    countYesUseString
  ];
}
