class OurTimeLeft {
  List<String> timeLeft(DateTime due) {
    List<String> retval = List(2);

    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil =
        _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds -
        (_daysUntil * 24 * 60 * 60) -
        (_hoursUntil * 60 * 60) -
        (_minUntil * 60);

    // if (_daysUntil > 0) {

    // } else if(_hoursUntil > 0) {

    // } else if(_minUntil > 0) {

    retval[0] = _daysUntil.toString() +
        " days\n" +
        _hoursUntil.toString() +
        " hours\n" +
        _minUntil.toString() +
        " mins\n" +
        _secUntil.toString() +
        " secs";
    retval[1] = "value 2";

    return retval;
  }
}
