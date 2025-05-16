part of '../censor_pattern_enum.dart';

final RegExp _seRegExp = RegExp(
  r'(?<![a-zåäö])'
  r'(?:'
  r'fitt[a-zåäö]*' // fitta, fittan, fittor, fittigt ...
  r'|kuk(?:'
  r'' // ren “kuk”
  r'|en' // kuken
  r'|ar(?:na)?' // kukar, kukarna
  r'|s' // kuks
  r')'
  r'|knull[a-zåäö]*' // knull, knulla, knullade, knullat ...
  r'|hor[a-zåäö]*' // hora, horan, horor, horunge ...
  r')'
  r'(?![a-zåäö])',
  caseSensitive: false,
  unicode: true,
);
