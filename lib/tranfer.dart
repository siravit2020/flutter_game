String tranfer(data) {
  int secound = data % 60;
  int minute = data ~/ 60;
  String textTime = '$minute : $secound';
  if (minute < 10 && secound < 10) {
    textTime = '0$minute : 0$secound';
  } else if (minute < 10) {
    textTime = '0$minute : $secound';
  } else if (secound < 10) {
    textTime = '$minute : 0$secound';
  }
  return textTime;
}
