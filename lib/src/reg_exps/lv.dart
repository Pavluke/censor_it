part of '../censor_pattern_enum.dart';

final RegExp _lvRegExp = RegExp(
  r'(?<![a-zāčēģīķļņšūž])' // слева не латышская буква (или начало)
  r'(?:'
  r'pis[a-zāčēģīķļņšūž]*' // pist, pisies, pisu, pisās ...
  r'|pizd[a-zāčēģīķļņšūž]*' // pizda, pizdets, pizdām ...
  r'|dir[sš][a-zāčēģīķļņšūž]*' // dirsa, dirsā, dirš, diršot ...
  r'|pimp[a-zāčēģīķļņšūž]*' // pimpis, pimpja, pimpi ...
  r'|mauk(?:'
  r'a(?:s|m)?' // mauka, maukas, maukam
  r'|ai' // maukai
  r'|ām' // maukām
  r'|u|us' // mauku, maukus
  r'|i|iem' // mauki, maukiem
  r'|īt(?:e|es)?' // maukīte, maukītes
  r'))'
  r'(?![a-zāčēģīķļņšūž])', // справа не латышская буква (или конец)
  caseSensitive: false,
  unicode: true,
);
