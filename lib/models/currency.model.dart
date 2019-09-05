class Currency {
  Currency(
      {this.symbol,
      this.name,
      this.symbolNative,
      this.code,
      this.namePlural,
      this.decimalDigits,
      this.rounding});
  String symbol, name, symbolNative, code, namePlural;

  int decimalDigits;
  double rounding;
}