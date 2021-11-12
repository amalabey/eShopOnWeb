/**
 * @name Error prone Enum.TryParse
 * @kind problem
 * @problem.severity warning
 * @id eshoponweb/eshop-codeql/enum-tryparse
 */

import csharp

from MethodCall call, Method method
where call.getTarget() = method
    and method.getDeclaringType().hasQualifiedName("System.Enum")
    and method.getName().matches("TryParse<%>")
select call, "Enum.TryParse is error prone-> "+method.getName()