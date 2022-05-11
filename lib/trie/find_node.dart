import 'package:characters/characters.dart';

import 'trie_node.dart';

TrieNode<T>? findPrefix<T>(String word, {required TrieNode<T> fromNode}) {
  TrieNode<T>? currentNode = fromNode;

  for (final character in word.characters) {
    currentNode = currentNode?.getChild(character);
    if (currentNode == null) {
      return null;
    }
  }
  return currentNode;
}
