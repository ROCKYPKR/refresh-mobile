class EventFilterValues {
  EventFilterValues(
      {this.name = "",
      this.location = "",
      this.start,
      this.startToggle = "Before",
      this.end,
      this.endToggle = "Before"});

  String name, location, startToggle, endToggle;
  DateTime start, end;

  @override
  int get hashCode =>
      location.hashCode ^
      start.hashCode ^
      startToggle.hashCode ^
      end.hashCode ^
      endToggle.hashCode;

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is EventFilterValues &&
            location == other.location &&
            start == other.start &&
            startToggle == other.startToggle &&
            end == other.end &&
            endToggle == other.endToggle;
  }
}