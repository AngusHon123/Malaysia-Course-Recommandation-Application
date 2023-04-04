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
    }
    if (ifUse > 16 && ifUse <= 34 && answer == 'Yes') {
      investigativeUse++;
      countYesUse++;
    }
    if (ifUse > 35 && ifUse <= 47 && answer == 'Yes') {
      artisticUse++;
      countYesUse++;
    }
    if (ifUse > 48 && ifUse <= 64 && answer == 'Yes') {
      socialUse++;
      countYesUse++;
    }
    if (ifUse > 65 && ifUse <= 81 && answer == 'Yes') {
      enterprisingUse++;
      countYesUse++;
    }
    if (ifUse > 65 && ifUse <= 81 && answer == 'Yes') {
      conventionalUse++;
      countYesUse++;
    }
  }
  //realisticCalculation
  double reaslisticValue = reaslisticUse / 17;
  String reaslisticString = (reaslisticValue * 100).toStringAsFixed(0) + '%';
  //investigativeCalculation
  double investigativeValue = investigativeUse / 17;
  String investigativeString =
      (investigativeValue * 100).toStringAsFixed(0) + '%';
  //artisticCalculation
  double artisticValue = artisticUse / 17;
  String artisticString = (artisticValue * 100).toStringAsFixed(0) + '%';
  //SosialCalculation
  double socialValue = socialUse / 17;
  String socialString = (socialValue * 100).toStringAsFixed(0) + '%';
  //enterprisingCalculation
  double enterprisingValue = enterprisingUse / 17;
  String enterprisingString =
      (enterprisingValue * 100).toStringAsFixed(0) + '%';
  //conventionalCalculation
  double conventionalValue = conventionalUse / 17;
  String conventionalString =
      (conventionalValue * 100).toStringAsFixed(0) + '%';

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
