import 'package:intl/intl.dart';

String getTime(time){
  if(DateTime.now().difference(DateTime.parse(time)).inDays >= 1)
  {
    if(DateTime.now().difference(DateTime.parse(time)).inDays > 7)
    {
      return '${DateTime.parse(time).day} ${DateFormat.MMMM().format(DateTime.parse(time))} ${DateTime.parse(time).year} ';
    }
    else if(DateTime.now().difference(DateTime.parse(time)).inDays >= 1)
    {
      return'${DateTime.now().difference(DateTime.parse(time)).inDays} days ago';
    }
  }
  else if(DateTime.now().difference(DateTime.parse(time)).inHours >= 1)
  {
    return '${DateTime.now().difference(DateTime.parse(time)).inHours} hours ago';
  }
  else if(DateTime.now().difference(DateTime.parse(time)).inMinutes >= 1)
  {
    return '${DateTime.now().difference(DateTime.parse(time)).inMinutes} m';
  }
  else if(DateTime.now().difference(DateTime.parse(time)).inMinutes < 1 && DateTime.now().difference(DateTime.parse(time)).inSeconds > 0)
  {
    return '${DateTime.now().difference(DateTime.parse(time)).inSeconds} s';
  }
  else if(DateTime.now().difference(DateTime.parse(time)).inSeconds == 0)
  {
    return 'Just now';
  }
  return'';
}