# equatable_custom_lint

---

This package is based on a fork from the [equatable_lint_ultimate](https://github.com/TomaszCz/equatable_lint) which is a fork of [equatable_lint](https://pub.dev/packages/equatable_lint) package

This package used the [custom_lint](https://github.com/invertase/dart_custom_lint) package

Sponsored by [The Code Brothers](https://thecodebrothers.pl)
---

## Table of content

- [Table of content](#table-of-content)
- [Setup local](#setup-local)
- [Setup CI](#setup-ci)
- [All the lints](#all-the-lints)
  - [missing\_field\_in\_equatable_props](#missing_field_in_equatable_props)
  - [always\_call\_super\_props\_when\_overriding\_equatable\_props](#always_call_super_props_when_overriding_equatable_props)
- [All the lints fixes](#all-the-lints-fixes)
  - [missing\_field\_in\_equatable_props fixes](#missing_field_in_equatable_props-fixes)
    - [Add every fields to equatable props](#add-every-fields-to-equatable-props)
    - [Add field to equatable props](#add-field-to-equatable-props)
  - [always\_call\_super\_props\_when\_overriding\_equatable\_props fixes](#always_call_super_props_when_overriding_equatable_props-fixes)
    - [Call super in overridden equatable props](#call-super-in-overridden-equatable-props)
- [All the assists](#all-the-assists)
  - [Make class extend Equatable](#make-class-extend-equatable)

## Setup local

- In your `pubspec.yaml`, add these `dev_dependencies` :

```yaml
dev_dependencies:
  custom_lint:
  equatable_custom_lint:
```

- In your `analysis_options.yaml`, add this plugin :

```yaml
analyzer:
  plugins:
    - custom_lint

# Optional : Disable unwanted rules
custom_lint:
  rules:
    - always_call_super_props_when_overriding_equatable_props: false
```

- Run `flutter pub get` or `dart pub get` in your package

- Possibly restart your IDE

## Setup CI

`flutter analyze` or `dart analyze` don't use this custom rule when checking your code

If you want to analyze your code with this rule in your CI, add a step that run `flutter pub run custom_lint` or `dart run custom_lint`

## All the lints

### missing_field_in_equatable_props

Class extending Equatable should put every field into equatable props

**Good**:

```dart
class MyClass extends Equatable {
  const MyClass({this.myField});
  final String? myField;
  @override
  List<Object?> get props => [myField];
}
```

**Bad**:

```dart
class MyClass extends Equatable {
  const MyClass({this.myField});
  final String? myField;
  @override
  List<Object?> get props => [];
}
```

### always_call_super_props_when_overriding_equatable_props

Should always call super when overriding equatable props

**Good**:

```dart
class MyClass extends RandomClassExtendingEquatable {
  const MyClass({this.newField});
  final String? newField;
  @override
  List<Object?> get props => super.props..addAll([newField]);
}
```

**Bad**:

```dart
class MyClass extends RandomClassExtendingEquatable {
  const MyClass({this.newField});
  final String? newField;
  @override
  List<Object?> get props => [newField];
}
```

## All the lints fixes

### missing_field_in_equatable_props fixes

#### Add every fields to equatable props

![Add every fields to equatable props sample](https://raw.githubusercontent.com/TomaszCz/equatable_lint/main/resources/add_every_fields_to_equatable_props.gif)

#### Add field to equatable props

![Add field to equatable props sample](https://raw.githubusercontent.com/TomaszCz/equatable_lint/main/resources/add_field_to_equatable_props.gif)

### always_call_super_props_when_overriding_equatable_props fixes

#### Call super in overridden equatable props

![Call super in overridden equatable props sample](https://raw.githubusercontent.com/TomaszCz/equatable_lint/main/resources/call_super_in_overridden_equatable_props.gif)

## All the assists

### Make class extend Equatable

![Make class extend Equatable sample](https://raw.githubusercontent.com/TomaszCz/equatable_lint/main/resources/make_class_extend_equatable.gif)

## About Tomasz Czajka

I am deeply committed to ensuring code quality, which is why I have chosen to adopt these wonderful package (as their original [authors](https://github.com/Bendix20/equatable_lint?tab=readme-ov-file#-about-bam) are no longer reachable).
