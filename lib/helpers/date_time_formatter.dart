class DateTimeFormatter {
  static List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static DateTime parse(String dateString) {
    List<String> list = dateString.split(new RegExp(r'\s|:'));
    DateTime now = DateTime.now();
    int month =
        months.contains(list[2]) ? months.indexOf(list[2]) + 1 : now.month;
    DateTime result = DateTime(now.year, month, int.parse(list[1]),
        int.parse(list[3]), int.parse(list[4]));
    return result;
  }
}
