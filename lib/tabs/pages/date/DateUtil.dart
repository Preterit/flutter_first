/* formatDate 使用案例 */
import 'package:date_format/date_format.dart';


/// formatDate 使用
void printTime() {
  print(
      "1 --- " + formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
  print("2 --- " + formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));
  print("3 --- " + formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));

  print("4 --- " + formatDate(DateTime(1989, 2, 1), [yy, '-', MM, '-', d]));
  print("5 --- " + formatDate(DateTime(1989, 2, 21), [yy, '-', M, '-', d]));

  print("6 --- " + formatDate(DateTime(1989, 2, 1), [yy, '-', M, '-', d]));

  print("7 --- " + formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', DD]));
  print("8 --- " + formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', D]));

  print("9 --- " +
      formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss]));

  print("10 --- " +
      formatDate(DateTime(1989, 02, 1, 15, 40, 10),
          [hh, ':', nn, ':', ss, ' ', am]));

  print("11 --- " +
      formatDate(DateTime(1989, 02, 1, 15, 40, 10),
          [hh, ':', nn, ':', ss, ' ', am]));

  print("12 --- " + formatDate(DateTime(1989, 02, 1, 15, 40, 10), [hh]));
  print("13 --- " + formatDate(DateTime(1989, 02, 1, 15, 40, 10), [h]));

  print("14 --- " + formatDate(DateTime(1989, 02, 1, 5), [am]));
  print("15 --- " + formatDate(DateTime(1989, 02, 1, 15), [am]));

  print("16 --- " +
      formatDate(
          DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, z]));

  print("17 --- " +
      formatDate(
          DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));

  print("18 --- " + formatDate(DateTime(1989, 02, 21), [yy, ' ', w]));
  print("19 --- " + formatDate(DateTime(1989, 02, 21), [yy, ' ', W]));

  print("20 --- " + formatDate(DateTime(1989, 12, 31), [yy, '-W', W]));
  print("21 --- " + formatDate(DateTime(1989, 1, 1), [yy, '-', mm, '-w', W]));

  print("22 --- " +
      formatDate(
          DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));
  ///I/flutter (14748): 1 --- 1989-02-21
  ///I/flutter (14748): 2 --- 89-2-21
  ///I/flutter (14748): 3 --- 89-2-1
  ///I/flutter (14748): 4 --- 89-February-1
  ///I/flutter (14748): 5 --- 89-Feb-21
  ///I/flutter (14748): 6 --- 89-Feb-1
  ///I/flutter (14748): 7 --- 18-Jan-Sunday
  ///I/flutter (14748): 8 --- 18-Jan-Sun
  ///I/flutter (14748): 9 --- 15:40:10
  ///I/flutter (14748): 10 --- 03:40:10 PM
  ///I/flutter (14748): 11 --- 03:40:10 PM
  ///I/flutter (14748): 12 --- 03
  ///I/flutter (14748): 13 --- 3
  ///I/flutter (14748): 14 --- AM
  ///I/flutter (14748): 15 --- PM
  ///I/flutter (14748): 16 --- 15:40:10+0800
  ///I/flutter (14748): 17 --- 15:40:10 CST
  ///I/flutter (14748): 18 --- 89 4
  ///I/flutter (14748): 19 --- 89 8
  ///I/flutter (14748): 20 --- 89-W53
  ///I/flutter (14748): 21 --- 89-01-w1
  ///I/flutter (14748): 22 --- 15:40:10 CST
}