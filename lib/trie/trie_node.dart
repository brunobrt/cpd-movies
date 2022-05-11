class TrieNode<T> {
  final String? key;

  T? value;

  bool isEndOfWord = false;

  bool get isRoot => key == null;

  final Map<String, TrieNode<T>> _children = {};

  bool get hasChildren => _children.isEmpty;

  int get childrenCount => _children.length;

  TrieNode({required this.key, this.value});

  Iterable<TrieNode<T>> getChildren() {
    return _children.values;
  }

  bool hasChild(String key) {
    return _children.containsKey(key);
  }

  TrieNode<T>? getChild(String key) {
    return _children[key];
  }

  TrieNode<T> putChildIfAbsent(String key, {T? value}) {
    return _children.putIfAbsent(
      key,
      () => TrieNode<T>(key: key, value: value),
    );
  }

  @override
  String toString() {
    return "TrieNode(key=$key, value=$value)";
  }
}
