/**
 * @name High Cyclomatic Complexity
 * @kind problem
 * @problem.severity warning
 * @id eshoponweb/eshop-codeql/cyclomatic-complexity
 */

import csharp

class ComplexStmt extends Stmt {
    ComplexStmt() {
        this instanceof IfStmt or
        this instanceof WhileStmt or
        this instanceof ForStmt or
        this instanceof DoStmt or
        this instanceof SwitchStmt
    }
}

from BlockStmt block, int n
where n = count(ComplexStmt x | x.getParent() = block)
    and n >= 7
select block, "High cyclometic complexity: "+n
