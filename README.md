# phrases
simple exercise, collect frequent word sequences

# Setup
```shell
  # assumed Ruby runtime and Bundler installed.
  # should be agnostic to runtime manager (rvm, rbenv, asdf)
  bundle install
```

# Run
```shell
  # Examples
  ruby solution.rb moby-dick.txt
  ruby solution.rb moby-dick.txt brothers-karamazov.txt
  more brothers-karamazov.txt | ruby solution.rb
  echo "a simple string" | ruby solution.rb
```

# Test
```shell
  rspec
```

# Notes
In a general sense, I'd rather put all the code in a single executable file (shebang).
But since the spec suggested an `ruby ./solution.rb texts/moby_dick.txt` interface, I kept to that.
And my experience with testing has been overwhelmingly Rails-centric rather than CLI script,
So I decided to extract the operational class from the CLI entry point.
* Operationally, we could use a Rake/Make to inline the source code to a single script file.

# Open Product/Spec Questions
1. When multiple texts are consumed
   1. Should the texts be combined? (aggregating sequences)
      1. If no, how should the various texts be identified?
   2. Should the last word of one text be bridged to the first word of next text?

# Next Steps

# Known Bugs
