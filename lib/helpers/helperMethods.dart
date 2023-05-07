List<String> weekdays = [
  "Sat",
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
];
List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

String getDateString(DateTime dateTime) {
  if (DateTime.now().year - dateTime.year >= 1) {
    return "${dateTime.year} ${months[dateTime.month - 1]} ${dateTime.day}   ";
  }
  if (DateTime.now().month - dateTime.month >= 1) {
    return "${months[dateTime.month - 1]}  ${dateTime.day}   ";
  }
  return DateTime.now().day - dateTime.day > 7
      ? "${weekdays[dateTime.weekday]}   "
      : "";
}

String getTimeString(DateTime dateTime) {
  return "${dateTime.hour == 0 || dateTime.hour == 12 ? '12' : dateTime.hour % 12}:${dateTime.minute > 10 ? dateTime.minute : '0${dateTime.minute}'} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
}

String displayNumber(int num) {
  return num > 1000000000000
      ? "${(num / 1000000000000).toStringAsFixed(1)}T"
      : num > 1000000000
          ? "${(num / 1000000000).toStringAsFixed(1)}B"
          : num > 1000000
              ? "${(num / 1000000).toStringAsFixed(1)}M"
              : num > 1000
                  ? "${(num / 1000).toStringAsFixed(1)}K"
                  : num.toString();
}
