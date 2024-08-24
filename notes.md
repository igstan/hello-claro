Conditions have to be parenthesized?

```
if ((line == ":q") or (line == ":quit"))
```

---

String literals don't work in pattern matching?

```
case ":q"                       -> break;
case ":quit"                    -> break;
```

OR patterns don't seem to work either:

```
case ":q" | ":quit"
```

---

```claro
var stdin = scanner::forStdIn();

consumer repl(prompt: string) {
  while (true) {
    print(prompt);
    match (scanner::nextLine(stdin)) {
      case _: scanner::INPUT_MISMATCH -> print("input mismatch"); break;
      case _: scanner::NO_MORE_TOKENS -> print("input mismatch"); break;
      case l -> print(l);
    }
  }
}

repl("lisp> ");
```

> make run
> bazel build //example:hello_bin
> INFO: Analyzed target //example:hello_bin (0 packages loaded, 0 targets configured).
> INFO: Found 1 target...
> ERROR: /Users/igstan/Projects/studies/claro/hello/example/BUILD:3:13: Compiling Claro Program: bazel-out/darwin_arm64-fastbuild/bin/example/hello_bin.java failed: (Exit 1): claro_compiler_binary failed: error executing command (from target //example:hello_bin_bin) bazel-out/darwin_arm64-opt-exec-2B5CBBC6/bin/external/claro-lang~0.1.409/src/java/com/claro/claro_compiler_binary --java_source --main_file_name hello --classname hello_bin --silent --package ... (remaining 183 arguments skipped)
>
> Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
> hello_bin.claro:6: No variable <stdin> within the current scope!
>     match (scanner::nextLine(stdin)) {
>                              ^^^^^
> hello_bin.claro:6: Invalid type:
> 	Found:
> 		<UNKNOWABLE DUE TO PRIOR TYPE VALIDATION ERROR>
> 	Expected:
> 		[module at //stdlib/scanner:scanner]::Scanner
>     match (scanner::nextLine(stdin)) {
>                              ^^^^^
> Procedure repl consumer<string> is blocking but is missing required explicit blocking annotation.
> 2 Errors
> Target //example:hello_bin failed to build
> Use --verbose_failures to see the command lines of failed build steps.
> INFO: Elapsed time: 0.723s, Critical Path: 0.66s
> INFO: 2 processes: 2 internal.
> FAILED: Build did NOT complete successfully
> make: *** [all] Error 1
