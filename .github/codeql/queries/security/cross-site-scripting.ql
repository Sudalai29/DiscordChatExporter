import csharp

// Find places where user input is inserted directly into a web page or script
from MethodCall call, Argument arg
where
  call.getTarget().getName() = "Write" or // Common method for writing output to the page
  call.getTarget().getName() = "Response.Write" or
  call.getTarget().getName() = "HtmlEncode" // Look for output methods
  and arg.getValue().getText().matches("%s") // Match user input
select call, "Potential XSS vulnerability: User input inserted into HTML/JS without proper escaping."
