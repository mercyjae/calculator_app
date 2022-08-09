class Calculators {
  final String equation;
  final String result;
  final bool showAppend;

  Calculators({this.equation = "0", this.result = "0", this.showAppend = true});
  Calculators copy({
    bool? showAppend,
    String? equation,
    String? result,
  }) =>
      Calculators(
        showAppend: showAppend ?? this.showAppend,
        equation: equation ?? this.equation,
        result: result ?? this.result,
      );
}
