# Migration Guide: v1.x → v2.0.0

This guide helps you migrate from CensorIt v1.x to v2.0.0.

## Overview of Breaking Changes

Version 2.0.0 introduces several breaking changes and major improvements:

1. **Main constructor replaced with factory constructors** → Use
   `CensorIt.random()`, `CensorIt.mask()`, etc.
2. **`CensorPattern` renamed to `LanguagePattern`** and changed from `enum` to
   `sealed class`
3. **Four different censoring strategies** → `random()`, `mask()`, `builder()`,
   `replace()`
4. **`regenerateCensoredText()` removed** → Use `regenerate()` instead (only for
   `CensorIt.random()`)
5. **Extension method renamed** → `censorIt()` → `toCensorIt()` (removed in
   v2.0.0)
6. **Simplified `.censored()` extension** for direct string output
7. **Minimum SDK version raised to 3.10.0**

---

## 1. Factory Constructors (MAJOR CHANGE)

### ❌ Old Code (v1.x)

```dart
// v1.x: Single constructor with parameters
final censor = CensorIt(
  'fuck this',
  pattern: CensorPattern.english,
  chars: ['!', '#', '%'],
);
```

### ✅ New Code (v2.0.0)

```dart
// v2.0.0: Multiple factory constructors for different strategies

// 1. Random characters (replaces old behavior)
final random = CensorIt.random(
  'fuck this',
  pattern: LanguagePattern.english,
  chars: ['!', '#', '%'],
);

// 2. Mask with single character
final masked = CensorIt.mask(
  'fuck this',
  char: '*',
  pattern: LanguagePattern.english,
);

// 3. Custom builder function
final custom = CensorIt.builder(
  'This is shit',
  builder: (word) => '***',
  pattern: LanguagePattern.english,
);

// 4. Fixed replacement string
final replaced = CensorIt.replace(
  'fuck this',
  replacement: '[censored]',
  pattern: LanguagePattern.english,
);
```

### Migration Path

**Find all:** `CensorIt(`\
**Replace with:** `CensorIt.random(`

---

## 2. CensorIt.random() - Random Character Replacement

Replaces the old default constructor behavior.

### ❌ Old (v1.x)

```dart
final censor = CensorIt(
  'fuck this',
  pattern: CensorPattern.english,
  chars: ['!', '#', '%'],
);
print(censor.censored); // %#!! this
```

### ✅ New (v2.0.0)

```dart
final censor = CensorIt.random(
  'fuck this',
  pattern: LanguagePattern.english,
  chars: ['!', '#', '%'],
);
print(censor.censored); // %#!! this
```

---

## 3. CensorIt.mask() - Simple Character Masking

New factory for masking with a repeated character.

### ✅ New in v2.0.0

```dart
final masked = CensorIt.mask(
  'fuck this',
  char: '*',
  pattern: LanguagePattern.english,
);
print(masked.censored); // **** this
```

**Use case:** Simple, consistent masking without randomness.

---

## 4. CensorIt.builder() - Custom Replacement Logic

New factory for complete control over replacement.

### ✅ New in v2.0.0

```dart
// Replace with word length
final lengthBased = CensorIt.builder(
  'fuck this',
  builder: (word) => '[$word.length]',
  pattern: LanguagePattern.english,
);
print(lengthBased.censored); // [4] this

// Conditional replacement
final conditional = CensorIt.builder(
  'fucking shit, fuck this',
  builder: (word) => word.length > 4 ? '****' : '***',
  pattern: LanguagePattern.english,
);
print(conditional.censored); // ******* this ***
```

**Use case:** Complex logic, analytics, custom formatting.

---

## 5. CensorIt.replace() - Fixed String Replacement

New factory for replacing with a fixed string.

### ✅ New in v2.0.0

```dart
final fixed = CensorIt.replace(
  'fuck this',
  replacement: '[censored]',
  pattern: LanguagePattern.english,
);
print(fixed.censored); // [censored] this

// With case preservation
final preserved = CensorIt.replace(
  'fuck this',
  replacement: 'BEEP',
  pattern: LanguagePattern.english,
);
print(preserved.censored); // BEEP this
```

**Use case:** Consistent, readable replacements.

---

## 6. Pattern Naming: CensorPattern → LanguagePattern

### ❌ Old Code (v1.x)

```dart
final pattern = CensorPattern.english;
final combined = CensorPattern.fromPatterns([
  CensorPattern.russian,
  CensorPattern.english,
]);
```

### ✅ New Code (v2.0.0)

```dart
final pattern = LanguagePattern.english;
final combined = CensorPattern.multi([
  LanguagePattern.russian,
  LanguagePattern.english,
]);
```

### Migration

**Find:** `CensorPattern.`\
**Replace:** `LanguagePattern.`

**Find:** `CensorPattern.fromPatterns(`\
**Replace:** `CensorPattern.multi(`

---

## 7. Regeneration (Only for CensorIt.random)

### ❌ Old Code (v1.x)

```dart
final censor = CensorIt('fuck', pattern: CensorPattern.english);
censor.regenerateCensoredText(); // Mutates
```

### ✅ New Code (v2.0.0)

```dart
// Only works with CensorIt.random()
final censor = CensorIt.random('fuck', pattern: LanguagePattern.english);
final regenerated = censor.regenerate(); // Returns new instance
```

**Note:** `regenerate()` only available for `CensorIt.random()` instances.

---

## 8. String Extension Changes

### ❌ Old Code (v1.x)

```dart
final text = 'fuck this';

// v1.x had .censorIt()
final censor = text.censorIt(pattern: CensorPattern.english);
print(censor.censored);
```

### ✅ New Code (v2.0.0)

```dart
final text = 'fuck this';

// Simplified .censored() extension
print(text.censored(pattern: LanguagePattern.english));
```

**Note:** `toCensorIt()` was removed. Use factory constructors directly.

---

## 9. New Locale-Based Pattern Selection

### ✅ New in v2.0.0

```dart
// Get pattern by locale code
final latvian = LanguagePattern.fromLocale('lv');

// With fallback
final pattern = LanguagePattern.fromLocale(
  'unknown',
  fallback: LanguagePattern.russian,
);

// Multiple locales
final multi = LanguagePattern.fromLocales(['en', 'ru', 'es']);
```

---

## 10. Comparison Table

| Feature           | v1.x                        | v2.0.0                                     |
| ----------------- | --------------------------- | ------------------------------------------ |
| Constructor       | `CensorIt(text, ...)`       | `CensorIt.random(text, ...)`               |
| Pattern class     | `CensorPattern.english`     | `LanguagePattern.english`                  |
| Masking           | `chars: ['*']`              | `CensorIt.mask(text, char: '*')`           |
| Custom logic      | Not available               | `CensorIt.builder(text, builder: ...)`     |
| Fixed replacement | Not available               | `CensorIt.replace(text, replacement: ...)` |
| Combine patterns  | `fromPatterns([...])`       | `CensorPattern.multi([...])`               |
| Extension         | `.censorIt()`               | `.censored()`                              |
| Regenerate        | `.regenerateCensoredText()` | `.regenerate()` (random only)              |

---

## Migration Checklist

- [ ] Update SDK constraint to `^3.10.0` in pubspec.yaml
- [ ] Run `dart pub upgrade`
- [ ] Replace `CensorIt(` with `CensorIt.random(`
- [ ] Replace `CensorPattern.` with `LanguagePattern.`
- [ ] Replace `CensorPattern.fromPatterns(` with `CensorPattern.multi(`
- [ ] Replace `.regenerateCensoredText()` with `.regenerate()`
- [ ] Replace `.censorIt()` with `.censored()` extension
- [ ] Consider using new factories: `.mask()`, `.builder()`, `.replace()`
- [ ] Test locale-based pattern selection if needed
- [ ] Run tests and fix any analyzer warnings

---

## Automated Migration Script

### Step 1: Update Constructors

```regex
Find: CensorIt(
Replace: CensorIt.random(
```

### Step 2: Update Patterns

```regex
Find: CensorPattern.
Replace: LanguagePattern.
```

### Step 3: Update Pattern Combining

```regex
Find: CensorPattern.fromPatterns(
Replace: CensorPattern.multi(
```

### Step 4: Update Regeneration

```regex
Find: .regenerateCensoredText()
Replace: = .regenerate()
```

---

## Code Comparison

### Before (v1.x)

```dart
import 'package:censor_it/censor_it.dart';

void main() {
  // Old constructor
  final censor = CensorIt(
    'fuck this',
    pattern: CensorPattern.english,
    chars: ['!', '#', '%'],
  );
  print(censor.censored);

  // Old regeneration (mutating)
  censor.regenerateCensoredText();

  // Old extension
  final text = 'fuck this';
  final c = text.censorIt(pattern: CensorPattern.english);
}
```

### After (v2.0.0)

```dart
import 'package:censor_it/censor_it.dart';

void main() {
  // New factory constructors

  // 1. Random (replaces old behavior)
  final random = CensorIt.random(
    'fuck this',
    pattern: LanguagePattern.english,
    chars: ['!', '#', '%'],
  );
  print(random.censored);

  // 2. Mask with character
  final masked = CensorIt.mask(
    'fuck this',
    char: '*',
    pattern: LanguagePattern.english,
  );
  print(masked.censored); // **** this

  // 3. Custom builder
  final custom = CensorIt.builder(
    'fuck this',
    builder: (word) => '[${word.length}]',
    pattern: LanguagePattern.english,
  );
  print(custom.censored); // [4] this

  // 4. Fixed replacement
  final fixed = CensorIt.replace(
    'fuck this',
    replacement: '[censored]',
    pattern: LanguagePattern.english,
  );
  print(fixed.censored); // [censored] this

  // New regeneration (immutable, only for random)
  final regenerated = random.regenerate();

  // New extension
  final text = 'fuck this';
  print(text.censored(pattern: LanguagePattern.english));

  // Locale-based patterns
  final latvian = LanguagePattern.fromLocale('lv');
  final multi = LanguagePattern.fromLocales(['en', 'ru']);
}
```

---

## Need Help?

If you encounter issues during migration:

1. Check the [CHANGELOG.md](CHANGELOG.md) for detailed changes
2. Review the [README.md](README.md) for updated examples
3. Open an issue: https://github.com/pavluke/censor_it/issues

---

## Rollback to v1.x

If you need to stay on v1.x temporarily:

```yaml
dependencies:
  censor_it: ^1.2.4
```

However, we strongly recommend migrating to v2.0.0 to get:

- 🎯 Multiple censoring strategies
- 🔒 Better immutability
- 🌍 Locale-based pattern selection
- 🐛 Critical bug fixes
