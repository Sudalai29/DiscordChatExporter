import csharp

// Find places where user input is passed to system commands
from MethodCall call, Argument arg
where
  (call.getTarget().getName() = "Start" or
   call.getTarget().getName() = "Exec") and
  arg.getValue().getText().matches("%s") // User input passed as arguments
select call, "Potential command injection vulnerability: User input passed directly to system command."
