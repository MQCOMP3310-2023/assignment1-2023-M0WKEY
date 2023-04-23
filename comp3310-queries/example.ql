 import java

 from MethodAccess call, Method method
 where
   call.getMethod() = method and
   (
     (method.hasName("printStackTrace") and method.getDeclaringType().hasQualifiedName("java.lang", "Throwable")) or
     (method.hasName("println") and method.getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
     exists(MethodAccess innerCall |
       innerCall.getMethod().hasName("getMessage") and
       innerCall.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
       call.getArgument(0) = innerCall
     ))
   )
 select call, "This code uses either printStackTrace or println with getMessage on Throwable objects."
 