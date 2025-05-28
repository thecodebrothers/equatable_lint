import 'package:analyzer/dart/ast/ast.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:equatable_custom_lint/src/constants/equatable_constants.dart';
import 'package:equatable_custom_lint/src/helpers/get_equatable_props_expression_infos.dart';
import 'package:equatable_custom_lint/src/helpers/get_has_override_equatable_props_in_super_class.dart';

/// Extension to add a specific listener for equatable super class
extension AddEquatableSuperClassDeclarationListener on LintRuleNodeRegistry {
  /// Getter to add a specific listener for equatable super class
  void addEquatableSuperClassDeclaration(
    void Function({
      required ClassDeclaration classNode,
      required ClassMember equatablePropsClassMember,
      required EquatablePropsExpressionDetails equatablePropsExpressionDetails,
    }) listener, {
    bool Function(ClassDeclaration)? optionalPreCheck,
  }) {
    addClassDeclaration((classNode) {
      if (optionalPreCheck != null) {
        final canContinue = optionalPreCheck(classNode);
        if (!canContinue) {
          return;
        }
      }

      final classSuperTypeElement =
          classNode.declaredElement!.supertype?.element;

      if (classSuperTypeElement == null) {
        return;
      }

      const typeChecker = TypeChecker.fromName(
        equatableClassName,
        packageName: equatablePackageName,
      );
      final classType = classSuperTypeElement.thisType;

      if (!typeChecker.isAssignableFromType(classType)) {
        return;
      }

      final hasOverrideEquatablePropsInSuperClass =
          getHasOverrideEquatablePropsInSuperClass(classSuperTypeElement);

      if (!hasOverrideEquatablePropsInSuperClass) {
        return;
      }

      final equatablePropsClassMember = classNode.equatablePropsClassMember;

      if (equatablePropsClassMember == null) {
        return;
      }

      final doesPropsCallSuper =
          equatablePropsClassMember.toString().contains('super.props');

      if (doesPropsCallSuper) {
        return;
      }

      final equatablePropsExpressionDetails =
          classNode.equatablePropsExpressionDetails;

      if (equatablePropsExpressionDetails == null) {
        return;
      }

      listener(
        classNode: classNode,
        equatablePropsClassMember: equatablePropsClassMember,
        equatablePropsExpressionDetails: equatablePropsExpressionDetails,
      );
    });
  }
}
