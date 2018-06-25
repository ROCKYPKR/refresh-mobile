class FormattedDateTime extends DateTime {
  FormattedDateTime(this.dateTime)
      : super.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);

  final DateTime dateTime;

  @override
  String toString(){
    String hour = dateTime.hour < 10 ? "0${dateTime.hour}" : dateTime.hour;
    String minute = dateTime.minute < 10 ? "0${dateTime.minute}" : dateTime.minute;
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}, $hour:$minute";
  }
}