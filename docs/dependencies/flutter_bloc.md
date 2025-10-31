# flutter_bloc Documentation (v9.1.1+)

**Source**: Context7 Documentation from `/felangel/bloc`
**Fetched**: 2025-01-31
**Package**: flutter_bloc ^9.1.1

---

## Table of Contents

1. [Core Widgets](#core-widgets)
   - [BlocBuilder](#blocbuilder)
   - [BlocListener](#bloclistener)
   - [BlocConsumer](#blocconsumer)
   - [BlocSelector](#blocselector)
2. [Conditional Rebuilds](#conditional-rebuilds)
   - [buildWhen](#buildwhen)
   - [listenWhen](#listenwhen)
3. [Context Extensions](#context-extensions)
   - [context.read](#contextread)
   - [context.watch](#contextwatch)
   - [context.select](#contextselect)
4. [Advanced Patterns](#advanced-patterns)
   - [MultiBlocListener](#multibloclistener)
   - [Providing Explicit Bloc Instances](#providing-explicit-bloc-instances)
5. [Best Practices](#best-practices)
6. [Anti-Patterns](#anti-patterns)

---

## Core Widgets

### BlocBuilder

BlocBuilder is a Flutter widget that rebuilds the UI in response to new states emitted by a Bloc or Cubit. It simplifies state management by providing a clean API similar to StreamBuilder, reducing boilerplate code.

**Basic Usage:**

```dart
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Text('The counter is ${state.count}');
  },
)
```

**Key Points:**
- The builder function must be pure and returns a widget based on the current state
- Called once per state change (excluding initial state unless explicitly configured)
- Rebuilds the widget tree returned by the builder function

---

### BlocListener

BlocListener is a Flutter widget that executes a listener callback in response to state changes within a bloc. It's ideal for side effects like navigation, showing snackbars, or dialogs.

**Basic Usage:**

```dart
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {
    // Perform side effects here (navigation, snackbars, dialogs)
    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred!')),
      );
    }
  },
  child: Container(),
)
```

**Key Points:**
- The listener is called only once per state change
- NOT called for the initial state
- Should NOT be used to rebuild UI - use BlocBuilder for that
- Perfect for one-time reactions to state changes

---

### BlocConsumer

BlocConsumer exposes both a builder and listener to react to new states, reducing boilerplate. It's useful when both UI rebuilding and other reactions to state changes are needed.

**Basic Usage:**

```dart
BlocConsumer<BlocA, BlocAState>(
  listener: (context, state) {
    // Do stuff here based on state changes (side effects)
    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    }
  },
  builder: (context, state) {
    // Return widget here based on bloc state
    return Text('State: ${state.value}');
  },
)
```

**With Conditions:**

```dart
BlocConsumer<WorkOrderBloc, WorkOrderState>(
  listenWhen: (previous, current) =>
    previous.hasError != current.hasError,
  listener: (context, state) {
    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    }
  },
  buildWhen: (previous, current) =>
    previous.workOrders != current.workOrders,
  builder: (context, state) {
    return WorkOrderList(workOrders: state.workOrders);
  },
)
```

**Key Points:**
- Combines BlocBuilder and BlocListener functionality
- Reduces nesting and improves readability
- Both `listenWhen` and `buildWhen` default to `true` if not provided

---

### BlocSelector

BlocSelector is a Flutter widget similar to BlocBuilder but allows filtering updates based on a selected value from the bloc's state. It prevents unnecessary rebuilds if the selected value remains unchanged.

**Basic Usage:**

```dart
BlocSelector<BlocA, BlocAState, String>(
  selector: (state) => state.someValue,
  builder: (context, selectedValue) {
    return Text(selectedValue);
  },
)
```

**Practical Example:**

```dart
BlocSelector<CounterBloc, CounterState, int>(
  selector: (state) => state.count,
  builder: (context, count) {
    // Only rebuilds when state.count changes
    return Text('The counter is $count');
  },
)
```

**Key Points:**
- **The selected value MUST be immutable** for correct comparison
- Only rebuilds when the selected value changes (using `==` comparison)
- More efficient than BlocBuilder for fine-grained rebuilds
- Perfect for widgets that depend on a specific property of the state

---

## Conditional Rebuilds

### buildWhen

The `buildWhen` parameter controls when the builder function is invoked. It receives the previous and current states and returns a boolean.

**Signature:**

```dart
bool buildWhen(PreviousState previous, CurrentState current)
```

**Example - Property-Based Comparison (✅ RECOMMENDED):**

```dart
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previousState, currentState) {
    // Only rebuild when the count changes
    return previousState.count != currentState.count;
  },
  builder: (context, state) {
    return Text('The counter is ${state.count}');
  },
)
```

**Example - Conditional Rebuild Based on Value:**

```dart
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previousState, currentState) {
    // Only rebuild when count is even
    return currentState.count % 2 == 0;
  },
  builder: (context, state) {
    return Text('The counter is ${state.count}');
  },
)
```

**Example - Runtime Type Comparison (⚠️ USE WITH CAUTION):**

```dart
BlocBuilder<TimerBloc, TimerState>(
  buildWhen: (previousState, currentState) {
    // Rebuilds only when the state type changes
    return currentState.runtimeType != previousState.runtimeType;
  },
  builder: (context, state) {
    return state.when(
      initial: () => Text('Timer Ready'),
      running: (duration) => Text('Running: $duration'),
      paused: (duration) => Text('Paused: $duration'),
      completed: () => Text('Completed!'),
    );
  },
)
```

**⚠️ Warning**: Runtime type comparisons can miss state changes when properties change but the type remains the same. Prefer property-based comparisons.

---

### listenWhen

The `listenWhen` parameter controls when the listener callback is invoked. It receives the previous and current states and returns a boolean.

**Signature:**

```dart
bool listenWhen(PreviousState previous, CurrentState current)
```

**Example - Property-Based Condition:**

```dart
BlocListener<BlocA, BlocAState>(
  listenWhen: (previous, current) {
    // Only call listener when count changes
    return previous.count != current.count;
  },
  listener: (context, state) {
    print('Count changed to: ${state.count}');
  },
  child: Container(),
)
```

**Example - Error Handling:**

```dart
BlocListener<WorkOrderBloc, WorkOrderState>(
  listenWhen: (previous, current) {
    // Only listen for error state changes
    return previous.hasError != current.hasError;
  },
  listener: (context, state) {
    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    }
  },
  child: WorkOrderList(),
)
```

---

## Context Extensions

### context.read

Use `context.read<T>()` to access a Bloc and trigger events **WITHOUT** listening to state changes. This does NOT cause rebuilds.

**Usage:**

```dart
ElevatedButton(
  onPressed: () {
    // Access bloc and add event without listening
    context.read<CounterBloc>().add(CounterIncrement());
  },
  child: const Text('Increment'),
)
```

**⚠️ Important**: Do NOT use `context.read` when you need to rebuild based on state changes. Use `BlocBuilder` or `context.watch` instead.

---

### context.watch

Use `context.watch<T>()` to access a Bloc's state and **automatically rebuild** when the state changes.

**Usage:**

```dart
Builder(
  builder: (context) {
    // Widget rebuilds whenever CounterBloc state changes
    final state = context.watch<CounterBloc>().state;
    return Text('Count: ${state.count}');
  },
)
```

**Multiple Blocs:**

```dart
Builder(
  builder: (context) {
    final stateA = context.watch<BlocA>().state;
    final stateB = context.watch<BlocB>().state;
    final stateC = context.watch<BlocC>().state;

    return Widget(/* depends on stateA, stateB, stateC */);
  }
);
```

**Key Points:**
- Causes rebuilds on every state change
- Functionally equivalent to `BlocBuilder` without `buildWhen`
- Use when you need the entire state object

---

### context.select

Use `context.select<T, R>()` to listen to specific properties of a Bloc's state. This optimizes rebuilds by only updating the widget when the selected property changes.

**Usage:**

```dart
Widget build(BuildContext context) {
  // Only rebuilds when state.name changes
  final name = context.select((ProfileBloc bloc) => bloc.state.name);
  return Text(name);
}
```

**Example - Boolean Selection:**

```dart
final isPositive = context.select((CounterBloc b) => b.state >= 0);
```

**With BlocSelector (Equivalent):**

```dart
BlocSelector<ProfileBloc, ProfileState, String>(
  selector: (state) => state.name,
  builder: (context, name) {
    // Only rebuilds when state.name changes
    return Text(name);
  },
)
```

**Key Points:**
- Most efficient way to rebuild based on specific state properties
- Functionally equivalent to `BlocSelector`
- The selected value must be immutable for correct comparisons

---

## Advanced Patterns

### MultiBlocListener

MultiBlocListener is a widget designed to consolidate multiple BlocListener widgets into a single, more manageable component. This enhances code readability and eliminates nesting.

**Before (Nested):**

```dart
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {
    // Handle BlocA state changes
  },
  child: BlocListener<BlocB, BlocBState>(
    listener: (context, state) {
      // Handle BlocB state changes
    },
    child: BlocListener<BlocC, BlocCState>(
      listener: (context, state) {
        // Handle BlocC state changes
      },
      child: ChildA(),
    ),
  ),
)
```

**After (Using MultiBlocListener):**

```dart
MultiBlocListener(
  listeners: [
    BlocListener<BlocA, BlocAState>(
      listener: (context, state) {
        // Handle BlocA state changes
      },
    ),
    BlocListener<BlocB, BlocBState>(
      listener: (context, state) {
        // Handle BlocB state changes
      },
    ),
    BlocListener<BlocC, BlocCState>(
      listener: (context, state) {
        // Handle BlocC state changes
      },
    ),
  ],
  child: ChildA(),
)
```

---

### Providing Explicit Bloc Instances

When a Bloc is not accessible via `BlocProvider` in the current `BuildContext`, you can explicitly provide it to widgets.

**BlocBuilder with Explicit Bloc:**

```dart
BlocBuilder<BlocA, BlocAState>(
  bloc: myBlocInstance,
  builder: (context, state) {
    return Text('State: ${state.value}');
  },
)
```

**BlocListener with Explicit Bloc:**

```dart
BlocListener<BlocA, BlocAState>(
  bloc: myBlocInstance,
  listener: (context, state) {
    // Handle state changes
  },
  child: Container(),
)
```

**Key Points:**
- Useful when managing bloc instances manually
- Required when bloc is not in the widget tree via `BlocProvider`
- Can provide blocs from different scopes

---

## Best Practices

### 1. Property-Based buildWhen (✅ RECOMMENDED)

Always prefer comparing specific state properties over `runtimeType` comparisons.

```dart
// ✅ GOOD - Property comparison
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previous, current) {
    return previous.count != current.count;
  },
  builder: (context, state) => Text('Count: ${state.count}'),
)

// ⚠️ AVOID - Runtime type comparison
BlocBuilder<TimerBloc, TimerState>(
  buildWhen: (previous, current) {
    return current.runtimeType != previous.runtimeType;
  },
  builder: (context, state) => /* ... */,
)
```

**Why?** Property-based comparisons catch all relevant state changes, while `runtimeType` misses changes when properties update but the type stays the same.

---

### 2. Use BlocSelector for Fine-Grained Rebuilds

When only a specific property of the state affects your widget, use `BlocSelector` or `context.select`.

```dart
// ✅ GOOD - Only rebuilds when count changes
BlocSelector<CounterBloc, CounterState, int>(
  selector: (state) => state.count,
  builder: (context, count) => Text('$count'),
)

// ❌ AVOID - Rebuilds on ANY state change
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) => Text('${state.count}'),
)
```

---

### 3. Separate Side Effects from UI Rebuilds

Use `BlocListener` for side effects and `BlocBuilder` for UI updates. Combine with `BlocConsumer` when both are needed.

```dart
// ✅ GOOD - Clear separation
BlocConsumer<AuthBloc, AuthState>(
  listenWhen: (previous, current) =>
    previous.status != current.status,
  listener: (context, state) {
    if (state.status == AuthStatus.authenticated) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  },
  buildWhen: (previous, current) =>
    previous.isLoading != current.isLoading,
  builder: (context, state) {
    return state.isLoading
      ? CircularProgressIndicator()
      : LoginForm();
  },
)
```

---

### 4. Use context.read for Event Dispatch

When triggering events, use `context.read` to avoid unnecessary rebuilds.

```dart
// ✅ GOOD
ElevatedButton(
  onPressed: () {
    context.read<CounterBloc>().add(CounterIncrement());
  },
  child: const Text('Increment'),
)

// ❌ AVOID - Creates unnecessary dependency
ElevatedButton(
  onPressed: () {
    BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
  },
  child: const Text('Increment'),
)
```

---

### 5. Prefer MultiBlocListener for Multiple Listeners

Improves readability and reduces nesting.

```dart
// ✅ GOOD
MultiBlocListener(
  listeners: [
    BlocListener<AuthBloc, AuthState>(
      listener: (context, state) { /* ... */ },
    ),
    BlocListener<NotificationBloc, NotificationState>(
      listener: (context, state) { /* ... */ },
    ),
  ],
  child: HomePage(),
)
```

---

## Anti-Patterns

### ❌ 1. Using context.read When State-Dependent Rebuilds Are Needed

```dart
// ❌ BAD - Widget won't rebuild on state changes
Widget build(BuildContext context) {
  final state = context.read<CounterBloc>().state;
  return Text('${state.count}'); // Never updates!
}

// ✅ GOOD - Use BlocBuilder or context.watch
Widget build(BuildContext context) {
  return BlocBuilder<CounterBloc, CounterState>(
    builder: (context, state) => Text('${state.count}'),
  );
}
```

---

### ❌ 2. Rebuilding Entire Widget on Partial State Changes

```dart
// ❌ BAD - Rebuilds everything on any state change
BlocBuilder<WorkOrderBloc, WorkOrderState>(
  builder: (context, state) {
    return Column(
      children: [
        ExpensiveWidget1(data: state.data1),
        ExpensiveWidget2(data: state.data2),
        ExpensiveWidget3(data: state.data3),
      ],
    );
  },
)

// ✅ GOOD - Use multiple BlocSelectors
Column(
  children: [
    BlocSelector<WorkOrderBloc, WorkOrderState, Data1>(
      selector: (state) => state.data1,
      builder: (context, data1) => ExpensiveWidget1(data: data1),
    ),
    BlocSelector<WorkOrderBloc, WorkOrderState, Data2>(
      selector: (state) => state.data2,
      builder: (context, data2) => ExpensiveWidget2(data: data2),
    ),
    BlocSelector<WorkOrderBloc, WorkOrderState, Data3>(
      selector: (state) => state.data3,
      builder: (context, data3) => ExpensiveWidget3(data: data3),
    ),
  ],
)
```

---

### ❌ 3. Using BlocBuilder for Side Effects

```dart
// ❌ BAD - Side effects in builder
BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if (state.isAuthenticated) {
      // DON'T DO THIS - side effect in builder!
      Navigator.of(context).pushReplacementNamed('/home');
    }
    return LoginForm();
  },
)

// ✅ GOOD - Use BlocListener for side effects
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state.isAuthenticated) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  },
  child: LoginForm(),
)
```

---

### ❌ 4. Not Using buildWhen/listenWhen When Appropriate

```dart
// ❌ BAD - Rebuilds on every state emission
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) => Text('${state.count}'),
)

// ✅ GOOD - Only rebuilds when count actually changes
BlocBuilder<CounterBloc, CounterState>(
  buildWhen: (previous, current) => previous.count != current.count,
  builder: (context, state) => Text('${state.count}'),
)
```

---

## Summary

| Widget | Purpose | Rebuilds UI? | Executes Side Effects? |
|--------|---------|--------------|------------------------|
| **BlocBuilder** | Rebuild UI on state changes | ✅ Yes | ❌ No |
| **BlocListener** | Execute side effects | ❌ No | ✅ Yes |
| **BlocConsumer** | Both rebuild UI and side effects | ✅ Yes | ✅ Yes |
| **BlocSelector** | Rebuild on specific property changes | ✅ Yes | ❌ No |

| Context Extension | Purpose | Rebuilds? | Best For |
|-------------------|---------|-----------|----------|
| **context.read** | Access bloc without listening | ❌ No | Triggering events |
| **context.watch** | Access state with listening | ✅ Yes | Simple state access |
| **context.select** | Listen to specific properties | ✅ Yes (selective) | Fine-grained rebuilds |

---

## References

- **Official Repository**: https://github.com/felangel/bloc
- **Package**: https://pub.dev/packages/flutter_bloc
- **Documentation**: https://bloclibrary.dev/
- **Current Version**: 9.1.1+

---

**Generated from Context7 Documentation** | 2025-01-31
