import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../models/category.dart';
import '../theme/app_theme.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final _nameController = TextEditingController();
  final _wordController = TextEditingController();
  final List<String> _words = ['ቴዲ አፍሮ', 'ላሊበላ', 'እንጀራ'];

  void _addWord() {
    if (_wordController.text.isNotEmpty) {
      setState(() {
        _words.add(_wordController.text);
        _wordController.clear();
      });
    }
  }

  void _saveCategory() {
    if (_nameController.text.isNotEmpty && _words.length >= 3) {
      final newCategory = GameCategory(
        title: _nameController.text,
        amharicTitle: _nameController.text,
        icon: Icons.category_rounded,
        iconColor: AppTheme.primary,
        words: _words,
      );
      Provider.of<GameProvider>(context, listen: false).addCategory(newCategory);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('እባክዎ የምድብ ስም እና ቢያንስ 3 ቃላት ይጥቀሱ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('አዲስ የመጫወቻ ምድብ ፍጠር'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('የምድብ ስም', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'ለምሳሌ፦ ታዋቂ ሰዎች',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ቃላት/ጥያቄዎች', style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.ethioGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_words.length} ቃላት ተጨምረዋል',
                    style: const TextStyle(color: AppTheme.ethioGreen, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _words.map((word) => Chip(
                label: Text(word),
                onDeleted: () => setState(() => _words.remove(word)),
                backgroundColor: Colors.white,
                deleteIconColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              )).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _wordController,
                    decoration: InputDecoration(
                      hintText: 'ቃል ያስገቡ',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: _addWord,
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(backgroundColor: AppTheme.ethioGreen),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.teal),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'ቢያንስ 10 ቃላትን እንዲጨምሩ እንመክራለን። ይህ ጨዋታው ረዘም ላለ ጊዜ እንዲቆይ እና አስደሳች እንዲሆን ይረዳል።',
                      style: TextStyle(fontSize: 13, color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveCategory,
                icon: const Icon(Icons.save_outlined),
                label: const Text('አስቀምጥ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
