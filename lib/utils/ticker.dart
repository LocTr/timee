class Ticker {
  final int initialTime;

  const Ticker({this.initialTime = 0});

  Stream<int> tick() {
    return Stream.periodic(
        const Duration(seconds: 1), (count) => initialTime + count);
  }
}
