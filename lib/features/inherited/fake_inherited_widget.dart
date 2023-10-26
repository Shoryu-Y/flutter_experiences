import 'dart:collection';

import 'package:flutter/material.dart';

abstract class FakeInheritedWidget extends InheritedWidget {
  const FakeInheritedWidget({super.key, required super.child});

  @override
  FakeInheritedElement createElement() {
    print('InheritedWidget.createElement');
    return FakeInheritedElement(this);
  }

  @override
  @protected
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}

class FakeInheritedElement extends InheritedElement {
  FakeInheritedElement(FakeInheritedWidget super.widget) {
    print('InheritedElement.created');
  }

  final Map<Element, Object?> _dependents = HashMap<Element, Object?>();

  // @override
  // void _updateInheritance() {
  //   assert(_lifecycleState == _ElementLifecycle.active);
  //   final PersistentHashMap<Type, InheritedElement> incomingWidgets =
  //       _parent?._inheritedElements ?? const PersistentHashMap<Type, InheritedElement>.empty();
  //   _inheritedElements = incomingWidgets.put(widget.runtimeType, this);
  // }

  @override
  @protected
  Object? getDependencies(Element dependent) {
    print('InheritedElement.getDependencies');
    return _dependents[dependent];
  }

  @override
  @protected
  void setDependencies(Element dependent, Object? value) {
    print('InheritedElement.setDependencies');
    _dependents[dependent] = value;
  }

  @override
  @protected
  void updateDependencies(Element dependent, Object? aspect) {
    print('InheritedElement.updateDependencies');
    setDependencies(dependent, null);
  }

  @override
  @protected
  void notifyDependent(covariant InheritedWidget oldWidget, Element dependent) {
    print('InheritedElement.notifyDependent');
    dependent.didChangeDependencies();
  }

  @override
  void updated(InheritedWidget oldWidget) {
    print('InheritedElement.updated');
    if ((widget as FakeInheritedWidget).updateShouldNotify(oldWidget)) {
      super.updated(oldWidget);
    }
  }

  @override
  void notifyClients(InheritedWidget oldWidget) {
    print('InheritedElement.notifyClients');
    for (final dependent in _dependents.keys) {
      notifyDependent(oldWidget, dependent);
    }
  }
}
