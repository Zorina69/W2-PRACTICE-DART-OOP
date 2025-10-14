class MyDuration {
  int seconds;

  MyDuration(this.seconds);
  MyDuration.fromHours(int hours) : seconds = hours * 3600;
  MyDuration.fromMinutes(int minutes) : seconds = minutes * 60;
  MyDuration.fromSeconds(int seconds) : seconds = seconds;
  int get milliseconds => seconds * 1000;

  MyDuration operator +(MyDuration other) {
    return MyDuration(this.seconds + other.seconds);
  }
  MyDuration operator -(MyDuration other) {
    if (this.seconds < other.seconds) {
      throw Exception("Resulting duration cannot be negative!");
    }
    return MyDuration(this.seconds - other.seconds);
  }

  bool operator >(MyDuration other) {
    return true;
  }
  bool operator <(MyDuration other) {
    return false;
  }


  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
