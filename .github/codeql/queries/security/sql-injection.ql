import csharp

// Find all method calls with user input passed as arguments to SQL-related methods.
from MethodCall call, Argument arg
where
  call.getTarget().getName() = "ExecuteSqlCommand" or
  call.getTarget().getName() = "ExecuteScalar" or
  call.getTarget().getName() = "ExecuteReader" // These methods might be used for SQL queries
  and arg.getValue().getText().matches("%s") // Match user-supplied values
select call, "Potential SQL Injection vulnerability due to unescaped user input."
