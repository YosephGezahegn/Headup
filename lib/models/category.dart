import 'package:flutter/material.dart';

class GameCategory {
  final String title;
  final String amharicTitle;
  final IconData icon;
  final Color iconColor;
  final List<String> words;

  GameCategory({
    required this.title,
    required this.amharicTitle,
    required this.icon,
    required this.iconColor,
    required this.words,
  });
}

final List<GameCategory> defaultCategories = [
  GameCategory(
    title: 'Culture',
    amharicTitle: 'ባህል',
    icon: Icons.coffee_rounded,
    iconColor: const Color(0xFFFEDD00),
    words: ['ቡና', 'ጀበና', 'ጎጆ', 'ቀሚስ', 'ጉርሻ', 'እሰይ', 'ሻይ'],
  ),
  GameCategory(
    title: 'History',
    amharicTitle: 'ታሪክ',
    icon: Icons.castle_rounded,
    iconColor: const Color(0xFF009B4D),
    words: ['ፋሲለደስ', 'ላሊበላ', 'አክሱም', 'አፄ ቴዎድሮስ', 'ቢትወደድ', 'አድዋ'],
  ),
  GameCategory(
    title: 'Music',
    amharicTitle: 'ሙዚቃ',
    icon: Icons.music_note_rounded,
    iconColor: const Color(0xFFEF3340),
    words: ['ቴዲ አፍሮ', 'ማህሙድ አህመድ', 'ጥላሁን ገሠሠ', 'አስቴር አወቀ', 'ኪራር', 'ገና'],
  ),
  GameCategory(
    title: 'Food',
    amharicTitle: 'ምግብ',
    icon: Icons.restaurant_rounded,
    iconColor: const Color(0xFFF39C12),
    words: ['እንጀራ', 'ዶሮ ወጥ', 'ጥብስ', 'ሺሮ', 'ኪትፎ', 'ዳቦ', 'ቆሎ'],
  ),
  GameCategory(
    title: 'Places',
    amharicTitle: 'ቦታዎች',
    icon: Icons.location_on_rounded,
    iconColor: const Color(0xFF009B4D),
    words: ['አዲስ አበባ', 'ጎንደር', 'ላሊበላ', 'ሐዋሳ', 'ባህር ዳር', 'ድሬዳዋ'],
  ),
  GameCategory(
    title: 'Language',
    amharicTitle: 'ቋንቋ',
    icon: Icons.translate_rounded,
    iconColor: const Color(0xFFE91E63),
    words: ['አማርኛ', 'ኦሮሚኛ', 'ትግርኛ', 'ሶማሊኛ', 'አፋርኛ', 'ሲዳምኛ'],
  ),
];
