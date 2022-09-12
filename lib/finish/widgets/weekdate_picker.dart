import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WeekdatePicker extends StatefulWidget {
  const WeekdatePicker({Key? key}) : super(key: key);

  @override
  State<WeekdatePicker> createState() => _WeekdatePickerState();
}

class _WeekdatePickerState extends State<WeekdatePicker> {
  final selectedIndexes = <int>{};
  final key = GlobalKey();
  final _trackTaped = <_Foo>{};

  _detectTapedItem(PointerEvent event) {
    final RenderBox box =
        key.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        final target = hit.target;
        if (target is _Foo && !_trackTaped.contains(target)) {
          _trackTaped.add(target);
          _selectedIndex(target.index);
        }
      }
    }
  }

  _selectedIndex(int index) {
    setState(() {
      selectedIndexes.add(index);
    });
  }

  _clearSelection(PointerUpEvent event) {
    _trackTaped.clear();
    setState(() {
      selectedIndexes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _detectTapedItem,
      onPointerMove: _detectTapedItem,
      onPointerUp: _clearSelection,
      child: GridView.builder(
        key: key,
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return Foo(
            index: index,
            child: Container(
              color: selectedIndexes.contains(index) ? Colors.red : Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

class Foo extends SingleChildRenderObjectWidget {
  final int index;

  const Foo({required Widget child, required this.index, Key? key})
      : super(child: child, key: key);

  @override
  _Foo createRenderObject(BuildContext context) {
    return _Foo(index);
  }

  @override
  void updateRenderObject(BuildContext context, _Foo renderObject) {
    renderObject.index = index;
  }
}

class _Foo extends RenderProxyBox {
  int index;
  _Foo(this.index);
}
