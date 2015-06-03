# Multiplication Table for Prime Numbers

## Usage
```
$ bin/multiplication_table --help
Usage: ./bin/multiplication_table [options]
    -c, --count COUNT                Number of primes for which a table will be built (default = 10). Only positive integers are valid.
```

## Notes
* I did some weird stuff in `spec/prime_finder_spec`, specifically by testing against a randomly generated data set.
  * This gave me a higher level of confidence in my prime detection code, but it required a custom RSpec matcher so that
    the failure message would be helpful.
  * The tests don't explicitly use `PrimeFinder.is_prime?` which is...confusing. Normally I'd rely on a pair or feedback
    from peers before committing that. I'm honestly not sure if it's the best way to increase confidence in the method,
    but I kind of like it.
  * It's strange to have a generated data set, but I don't think this is a problem. By testing against Ruby's Prime class,
    the test should be safe against false positives/negatives or other mistakes.
* Didn't worry too much about performance
  * It seems pretty fast anyway, at least with counts in the hundreds
  * I did one minor tweak (which probably should have been obvious the first time around, but if you look at my commit history
    you'll see that I did it in a slightly less efficient way at first)
  * In general optimizations around something this low-level are better left to libraries.
* There's a bit of guarding against bad user input, but I didn't go crazy.
  * Mostly relying on OptionParser to guard for me.
  * Testing crazy edge cases would increase development time but would probably not be very useful. If a user is trying
    to break my code, as long as it doesn't fail in a dangerous way then strange failures are probably acceptable.
* I didn't bother turning this into a gem
  * I checked in the .ruby-gemset, .ruby-version, and Gemfile.lock files which I probably wouldn't do if this were meant
    for wider consumption.
