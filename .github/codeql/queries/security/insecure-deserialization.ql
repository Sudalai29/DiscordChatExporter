import csharp

// Look for deserialization functions that might be unsafe
from MethodCall call
where
  call.getTarget().getName() = "Deserialize" and
  not call.getArgument(0).getValue().isSanitized() // Check for unsanitized deserialization
select call, "Potential insecure deserialization vulnerability."
