part of '../censor_pattern_enum.dart';

final RegExp _plRegexp = RegExp(
    r'\b(?:chuj(?:a|em|om|u)?|jeba(?:ć|ł(?:a|em|o|y)|n(?:a|ę|o|y)|c(?:y|ią|ę))|kurwa(?:(?:(?:m|n)a)|(?:(?:m|n)i)|(?:(?:m|n)y))|pierdol(?:a|eń|ę|ą)|piźd(?:a|z|zą)|kutas(?:y|em|a)|kurde(?:(?:ł|l)a)|pizd(?:a|ę|z)|jebał(?:a|em|o|y)|kurw(?:a|y|o|ie|ą)|chuj(?:u|em|a)|pierdol(?:ę|ą)|kutas(?:ów|ach)|kurw(?:ski|skie)|jeb(?:anie|ał|ła)|kurw(?:ą|ski|skie)|chuj(?:u|om|a)|pierdol(?:eń|ę)|piźd(?:z|zą)|kutas(?:ów|ach)|kurde(?:ł|ła))\b',
    caseSensitive: false,
    unicode: true);
