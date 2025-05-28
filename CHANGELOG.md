# Versions

## 1.0.0
- Updated to work with the latest version of Equatable and Dart SDK.

## 0.2.3

- Fixed bug: did not work as a plugin.

## 0.2.2

- Assists:
  - Add assist to help you extend Equatable when your class is not already doing it
- Lints:
  - add URLs linking to lints details

- Fix bug showing `always_call_super_props_when_overriding_equatable_props` on class extending another non-equatable class with props field

## 0.2.1

- Fork from [equatable_lint_ultimate](https://pub.dev/packages/equatable_lint_ultimate)

- Available lints:
  - Lint when a field is missing in equatable props => "missing_field_in_equatable_props"
  - Lint when a class extending an Equatable class does not call super when overriding equatable props => "always_call_super_props_when_overriding_equatable_props"

- Available fixes for the lints:
  - "missing_field_in_equatable_props":
        - A quick fix to add every field to the equatable props
        - A quick fix to create the equatable props with every field in it
        - A quick fix to add a specific field to the equatable props
        - A quick fix to create the equatable props with a specific field in it
  - "always_call_super_props_when_overriding_equatable_props":
        - A quick fix to call super in overridden equatable props
