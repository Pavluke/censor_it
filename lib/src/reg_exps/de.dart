part of '../censor_pattern_enum.dart';

final RegExp _deRegExp = RegExp(
  r'(?<![a-zäöüß])'
  r'(?:'
  r'(?:ver)?fick(?:'
  r'|en' // ficken
  r'|st' // fickst
  r'|t' // fickt
  r'|e' // ficke
  r'|er?s?' // ficker, fickers
  r'|te' // fickte
  r'|test' // ficktest
  r'|tet' // ficktet
  r'|st?e?n?' // gefickt / verfickt
  r')'
  r'|schei(?:ß|ss)(?:e|er|t|lich|dreck)?' // scheiße & Co.
  r'|arschloch'
  r'|drecksau'
  r'|hurensohn'
  r'|fotze(?:n)?'
  r'|wichser'
  r')'
  r'(?![a-zäöüß])',
  caseSensitive: false,
  unicode: true,
);
