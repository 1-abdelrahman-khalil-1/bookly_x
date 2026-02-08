// create function calculateOffer

String calculateOffer(double price, double offer) {
  final double result = (price - offer) / price * 100;
  return '${result.floor()}% ';
}
