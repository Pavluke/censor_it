part of '../language_pattern.dart';

/// {@template it_pattern}
/// Italian profanity pattern.
///  {@endtemplate}
final class ItPattern implements LanguagePattern {
  /// {@macro it_pattern}
  const ItPattern();

  @override
  String get name => 'italian';

  @override
  String get locale => 'it';

  @override
  RegExp get regExp => RegExp(
        r'(?<![a-zàèéìòù])'
        r'(?:'
        r'vaffanculo' // vaffanculo
        r'|cazz[a-zàèéìòù]*' // cazzo, cazzata, cazzoni ...
        r'|coglion[a-zàèéìòù]*' // coglione, coglioni ...
        r'|stronz[a-zàèéìòù]*' // stronzo, stronzi ...
        r'|troi[a-zàèéìòù]*' // troia, troie ...
        r'|puttan[a-zàèéìòù]*' // puttana, puttane ...
        r'|merd[a-zàèéìòù]*' // merda, merdoso ...
        r')'
        r'(?![a-zàèéìòù])',
        caseSensitive: false,
      );
}
