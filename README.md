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
  rspec # all tests
  bundle exec rspec spec/solution_spec.rb:31 # explicit test, in case desired/environment issue
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
1. Consider optimizing the phrases storage to be Binary Search Tree/Priority Search Tree to reduce cost of sorting
2. explicit tests for BDD cases, eg "100 most common" and "bonus points"
3. Another pass at cleaning up test output (especially skips)

# Known Bugs
1. code was intended to squeeze hyphenated-end-of-line, but does not

