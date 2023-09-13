library bottom;

import 'dart:convert';

import 'package:characters/characters.dart';

const _charsValues = {
  200: '🫂',
  50: '💖',
  10: '✨',
  5: '🥺',
  1: ',',
  0: '❤️',
};

const _sectionSeparator = '👉👈';

class Bottom {
  const Bottom();

  String toBottom(final String text) {
    List<int> out = [];
    for (var char in utf8.encode(text)) {
      while (char != 0) {
        for (final MapEntry(key: value, value: emoji) in _charsValues.entries) {
          if (char >= value) {
            char -= value;
            out += utf8.encode(emoji);
            break;
          }
        }
      }

      out += utf8.encode(_sectionSeparator);
    }

    return utf8.decode(out);
  }

  String fromBottom(String text) {
    List<int> out = [];
    text = text.trim();

    if (text.endsWith(_sectionSeparator)) {
      text = text.substring(0, text.length - _sectionSeparator.length);
    }

    if (text.isEmpty) {
      return '';
    }

    if (![for (final c in text.characters.replaceAll(_sectionSeparator.characters, ''.characters).split(''.characters)) c].every((e) => _charsValues.containsValue(e.string))) {
      throw Exception('Invalid bottom text: $text');
    }

    for (final char in text.split(_sectionSeparator)) {
      final reversedMapping = {
        for (final MapEntry(key: value, value: emoji) in _charsValues.entries) emoji: value
      };

      int value = 0;

      for (final emoji in char.characters.split(''.characters)) {
        value += reversedMapping[emoji.string]!;
      }

      out += [value];
    }

    return utf8.decode(out);
  }
}

const bottom = Bottom();
