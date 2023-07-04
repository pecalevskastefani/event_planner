class Event {
  final String eventName;
  final String eventType;
  final String eventDate;
  final String eventTime;
  final String address;
  late final String? cateringPrice;
  late final String? sweetsPrice;
  late final String? musicPrice;
  late final String totalPrice;

  Event({ this.eventName = "",
    this.eventType = "",
    this.eventDate = "",
    this.eventTime = "",
    this.address = "",
    this.cateringPrice = "",
    this.sweetsPrice = "",
    this.musicPrice = "",
    this.totalPrice = ""});
}