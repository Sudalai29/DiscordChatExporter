import csharp

// Search for strings that look like API keys or passwords
from StringLiteral sl
where
  sl.getValue().matches(".*(password|apikey|secret|token).*") // Look for common secret names
select sl, "Potential hardcoded secret found in source code."
