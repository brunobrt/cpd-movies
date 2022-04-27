import 'internal_node.dart';
import 'leaf_node.dart';

class BPlusTree {
  int m;
  InternalNode root;
  LeafNode leaf;

  BPlusTree({required this.m, required this.root, required this.leaf});
}
