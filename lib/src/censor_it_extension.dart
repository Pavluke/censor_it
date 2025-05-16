part of 'censor_it_base.dart';

/// Extension on [String] to provide censoring functionality.
///
/// This extension adds a method to [String] that allows for the creation of a [CensorIt] instance,
/// which can be used to censor parts of the string based on a specified pattern and characters.
extension CensorItExt on String {
  /// Creates an instance of [CensorIt] with the given text, censor pattern, and characters.
  ///
  /// [pattern] is the censor pattern to use. Defaults to [CensorPattern.all].
  /// [chars] is the list of characters to use for censoring. Defaults to a predefined set of characters.
  CensorIt censorIt(
          {CensorPattern pattern = CensorPattern.all,
          List<String> chars = const [
            '!',
            '#',
            '%',
            '&',
            '?',
            '@',
            '\$',
          ]}) =>
      CensorIt(this, pattern: pattern, chars: chars);
}
