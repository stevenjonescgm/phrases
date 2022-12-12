# phrases
simple exercise, collect frequent word sequences

# Setup
```shell
  bundle install
```

# Run
```shell
  ruby solution.rb moby-dick.txt
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
