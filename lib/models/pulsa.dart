class Pulsa {
  final int id;
  final int nominal;
  final int price;

  Pulsa({
    required this.id,
    required this.nominal,
    required this.price,
  });
}

class PulsaReguler {
  final int id;
  final String title;
  final List<Pulsa> pulsa;

  PulsaReguler({
    required this.id,
    required this.title,
    required this.pulsa,
  });
}
