// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class WeekdatePicker extends StatefulWidget {
//   const WeekdatePicker({Key? key}) : super(key: key);

//   @override
//   State<WeekdatePicker> createState() => _WeekdatePickerState();
// }

// class _WeekdatePickerState extends State<WeekdatePicker> {
//   final _selectedIndexes = <int>{};
//   final key = GlobalKey();
//   bool isToggleOn = true;

//   Set<int> get days {
//     return _selectedIndexes;
//   }

//   int firstIndex = 0;
//   int lastIndex = 0;

//   _detectTapedItem(PointerEvent event) {
//     RenderBox box =
//         key.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;

//     final result = BoxHitTestResult();
//     Offset local = box.globalToLocal(event.position);
//     if (box.hitTest(result, position: local)) {
//       for (final hit in result.path) {
//         final target = hit.target;
//         if (target is _Foo) {
//           if (event is PointerDownEvent) {
//             firstIndex = target.index;
//             lastIndex = target.index;
//             if (!_selectedIndexes.contains(target.index)) {
//               _selectIndexes([target.index]);
//               isToggleOn = true;
//             } else {
//               _unselectIndexes([target.index]);
//               isToggleOn = false;
//             }
//           }
//           if (event is PointerMoveEvent) {
//             if (target.index != firstIndex) {}
//           }
//         }
//       }
//     }
//   }
//   // {
//   //   String output = '';
//   //   _selectedIndexes.forEach((element) {
//   //     output += element.toString();
//   //   });
//   //   print(output);
//   // }

//   _unselectIndexes(Iterable<int> indexes) {
//     setState(() {
//       _selectedIndexes.removeAll(indexes);
//     });
//   }

//   _selectIndex(int index) {
//     setState(() {
//       _selectedIndexes.add(index);
//     });
//   }

//   _selectIndexes(Iterable<int> indexes) {
//     setState(() {
//       _selectedIndexes.addAll(indexes);
//     });
//   }

//   _clearSelection(PointerUpEvent event) {
//     setState(() {
//       _selectedIndexes.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('rebuild');
//     return Listener(
//       onPointerDown: _detectTapedItem,
//       onPointerMove: _detectTapedItem,
//       child: Row(
//         key: key,
//         children: [
//           Foo(
//             index: 0,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(0) ? Colors.red : Colors.blue,
//               child: const Text('M'),
//             ),
//           ),
//           Foo(
//             index: 1,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(1) ? Colors.red : Colors.blue,
//               child: Text('T'),
//             ),
//           ),
//           Foo(
//             index: 2,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(2) ? Colors.red : Colors.blue,
//               child: Text('W'),
//             ),
//           ),
//           Foo(
//             index: 3,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(3) ? Colors.red : Colors.blue,
//               child: Text('T'),
//             ),
//           ),
//           Foo(
//             index: 4,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(4) ? Colors.red : Colors.blue,
//               child: Text('F'),
//             ),
//           ),
//           Foo(
//             index: 5,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(5) ? Colors.red : Colors.blue,
//               child: Text('S'),
//             ),
//           ),
//           Foo(
//             index: 6,
//             child: Container(
//               width: 50,
//               height: 50,
//               color: _selectedIndexes.contains(6) ? Colors.red : Colors.blue,
//               child: Text('S'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Checkbox extends StatelessWidget {
//   const Checkbox({Key? key, required this.index, required this.content})
//       : super(key: key);

//   final int index;
//   final String content;
//   @override
//   Widget build(BuildContext context) {
//     return Foo(
//         index: index,
//         child: Container(
//           decoration: BoxDecoration(
//               shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
//           child: Text(content),
//         ));
//   }
// }

// class Foo extends SingleChildRenderObjectWidget {
//   final int index;

//   const Foo({required Widget child, required this.index, Key? key})
//       : super(child: child, key: key);

//   @override
//   createRenderObject(BuildContext context) {
//     return _Foo(index);
//   }

//   @override
//   void updateRenderObject(BuildContext context, _Foo renderObject) {
//     renderObject.index = index;
//   }
// }

// class _Foo extends RenderProxyBox {
//   int index;
//   _Foo(this.index);
// }
