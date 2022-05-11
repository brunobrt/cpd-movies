import 'package:characters/characters.dart';

import 'find_node.dart';
import 'trie_node.dart';

class Trie {
  final _root = TrieNode<void>(key: null, value: null);

  void insert(String word) {
    var currentNode = _root;

    for (final character in word.characters) {
      currentNode = currentNode.putChildIfAbsent(character, value: null);
    }

    currentNode.isEndOfWord = true;
  }

  bool has(String word) {
    return findPrefix(word, fromNode: _root)?.isEndOfWord ?? false;
  }

  List<String> find(String prefix) {
    final lastCharacterNode = findPrefix(prefix, fromNode: _root);

    if (lastCharacterNode == null) {
      return [];
    }

    final stack = <_PartialMatch>[
      _PartialMatch(node: lastCharacterNode, partialWord: prefix),
    ];
    final foundWords = <String>[];

    while (stack.isNotEmpty) {
      final partialMatch = stack.removeLast();

      if (partialMatch.node.isEndOfWord) {
        foundWords.add(partialMatch.partialWord);
      }

      for (final child in partialMatch.node.getChildren()) {
        stack.add(
          _PartialMatch(
            node: child,
            partialWord: "${partialMatch.partialWord}${child.key}",
          ),
        );
      }
    }

    return foundWords;
  }
}

class _PartialMatch {
  final TrieNode node;
  final String partialWord;

  _PartialMatch({
    required this.node,
    required this.partialWord,
  });

  @override
  String toString() => '_PartialMatch(node: $node, prefix: $partialWord)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _PartialMatch &&
        other.node == node &&
        other.partialWord == partialWord;
  }

  @override
  int get hashCode => node.hashCode ^ partialWord.hashCode;
}
