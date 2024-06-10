extension Trans on Enum {
  int get value => index + 1;

  String get capitalized =>
      name[0].toUpperCase() + name.substring(1, name.length);
}

extension ListManipulation on List {
  List<T> lazySublist<T>(int start, int end) {
    if (length > 0 && end < length) {
      return sublist(start, end) as List<T>;
    } else if (length > 0 && end >= length) {
      return sublist(start, length) as List<T>;
    } else {
      return [];
    }
  }
}

extension StringManipulation on String {
  String lazySubString(int start, int end) {
    if (length > 0 && end < length) {
      return substring(start, end);
    } else if (length > 0 && end >= length) {
      return substring(start, length);
    } else {
      return "";
    }
  }

  String ellipsize(int len) {
    String sub = lazySubString(0, len);
    if (sub.length == length) return sub;
    return '$sub... ';
  }

  String get convertDateString {
    if (isEmpty) return "";
    DateTime dateTime = DateTime.parse(this);
    List<String> monthAbbreviations = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    String monthAbbreviation = monthAbbreviations[dateTime.month - 1];

    String formattedDate = "${dateTime.day.toString().padLeft(2, '0')}-"
        "$monthAbbreviation";
    return formattedDate;
  }

  DateTime get parseDateTime => DateTime.parse(this);

  String capitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get capitalise => replaceFirstMapped(
      RegExp(r'^.'), (match) => match.group(0)!.toUpperCase());

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalize())
      .join(' ');

  String getInitials() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.lazySubString(0, 1))
      .join('');
}

extension Special<E> on Iterable<E> {
  E? get(bool Function(E element) test, {E Function()? orElse}) {
    try {
      return firstWhere(test, orElse: orElse);
    } catch (e) {
      return null;
    }
  }
}
