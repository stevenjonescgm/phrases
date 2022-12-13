# Business Driven Development spec
# Normally, BDD feature tests would be written with a tool like Cucumber and Gherkin
# but in the interests of time and simplicity, here are stubbed rspec tests using
#   RSpec::Expectations.fail_with('oops')
#     => hard coded/simulated failure
#   is_expected
#     => simulated success (eg not worth coding a "should use Ruby" test)

require 'spec_helper'
require_relative '../app/app'

describe 'Phrases BDD feature requirements' do

  describe 'Documentation Requirements' do
    <<~HEREDOC
      * Your README should include:
        - How to run your program.
        - How to run the tests.
        - What you would do next, given more time (if anything)?
        - Are there bugs that you are aware of?
     HEREDOC

    it 'should describe how to run your program' do
      is_expected
    end

    it 'should describe how to run the tests' do
      is_expected
    end

    it 'should describe What you would do next, given more time (if anything)?' do
      skip 'circle back after satisfaction'
      is_expected
    end

    it 'should describe Are there bugs that you are aware of?' do
      skip 'circle back after satisfaction'
      is_expected
    end
  end

  describe 'Basic Requirements' do
    <<~HEREDOC
      * The program is written in any language (ruby and java are common, but all are welcome)
      * The program has a README with instructions for running the program and the tests
        - If you choose a language other than java or ruby, please give us some hints about how you would recommend we get it running locally.
      * The program accepts a list of one *or more* file paths (e.g. `ruby solution.rb texts/moby-dick.txt brothers-karamazov.txt ...).`
      * The program *also* accepts input via stdin (e.g. `cat texts/*.txt | java solution.java`).
      * The program outputs the first 100 most common three word sequences.
      * The program ignores punctuation, line endings, and is case insensitive
        - `“I love\nsandwiches.”` should be treated the same as `"(I LOVE SANDWICHES!!)"`).
        - Contractions shouldn't be changed into two words (eg. `can't` should not become `can t`).
        - Hyphens on line-endings can be treated as continuations OR punctuation.
        - Unicode may also be handled in any way you like (including replacing it with a space)
      * Bonus points for doing something extra and documenting it. Here are some examples that might be relevant to the team you're applying to:
        - The program is capable of processing large files and runs efficiently (>4s is normal in Ruby, 2.5s is quite quick). *Please do not* write incomprehensible code in the quest for speed.
        - Handling unicode or line-endings gracefully.
        - Running via Docker as well as via the command-line.
        - Something else that you think your team would find valuable (just make sure to document it so we know to look for it!)
    HEREDOC

    it 'The program is written in any language (ruby and java are common, but all are welcome)' do
      is_expected
    end

    it 'The program has a README with instructions for running the program and the tests' do
      is_expected
    end

    it 'The program accepts a list of one *or more* file paths (e.g. `ruby solution.rb texts/moby-dick.txt brothers-karamazov.txt ...)' do
      # NOTE: test uses 'texts/brothers-karamazov.txt' instead of './brothers-karamazov.txt'
      output = `ruby solution.rb texts/moby-dick.txt texts/brothers-karamazov.txt`
      expect(output).to eq OUTPUT_BOTH
    end

    it 'The program *also* accepts input via stdin (e.g. `cat texts/*.txt | java solution.java`).' do
      output = `cat texts/*.txt | ruby solution.rb`
      expect(output).to eq OUTPUT_BOTH
    end

    it 'The program outputs the first 100 most common three word sequences.' do
      # TODO: explicit (redundant) test here
      is_expected
    end

    context 'The program ignores punctuation, line endings, and is case insensitive' do
      it %[ `“I love\nsandwiches.”` should be treated the same as `"(I LOVE SANDWICHES!!)"`).] do
        app = App.new
        app.run(StringIO.new "“I love\nsandwiches.”")
        app.run(StringIO.new "(I LOVE SANDWICHES!!)")
        expect(app.phrases['i love sandwiches']).to eq 2
      end

      it %[ Contractions shouldn't be changed into two words (eg. `can't` should not become `can t`).] do
        app = App.new
        app.run(StringIO.new "this can't split")
        expect(app.phrases["this can't split"]).to eq 1
        expect(app.phrases["this can t"]).to eq 0
      end

      it %[ Hyphens on line-endings can be treated as continuations OR punctuation.] do
        pending 'support for hyphenated-end-of-line'
        app = App.new
        app.run(StringIO.new "this optional-\nly splits")
        expect(app.phrases).to eq({"this optionally splits" => 1})
      end

      it %[ Hyphens on line-endings can be treated as continuations OR punctuation.] do
        app = App.new
        app.run(StringIO.new "this optional-\nly splits")
        expect(app.phrases).to eq({"this optional ly" => 1, "optional ly splits" => 1})
      end

      it %[ Unicode may also be handled in any way you like (including replacing it with a space)] do
        skip 'TODO: not yet considered'
      end
    end

    # * Bonus points for doing something extra and documenting it. Here are some examples that might be relevant to the team you're applying to:
    context 'Bonus points for doing something extra and documenting it' do
      # (>4s is normal in Ruby, 2.5s is quite quick). *Please do not* write incomprehensible code in the quest for speed.
      it 'The program is capable of processing large files and runs efficiently' do
        skip '6x Moby Dick runs in about 6.4s currently. not sure what constitutes "large files"'
        output = `ruby solution.rb texts/moby-dick.txt texts/moby-dick.txt texts/moby-dick.txt texts/moby-dick.txt texts/moby-dick.txt texts/moby-dick.txt`
        is_expected
      end

      it 'Handling unicode or line-endings gracefully.'
      it 'Running via Docker as well as via the command-line.'
      it 'Something else that you think your team would find valuable (just make sure to document it so we know to look for it!)'

      context 'Personal bonus points' do
        it ''
      end
    end

  end

  describe 'Testing Requirements' do
    <<~HEREDOC
      * The program should have automated tests that use assertions.
      * The program should have documentation about how to run the program AND the tests.
      * Tests should be runnable on the evaluator's machine with small effort.
      * Tests should cover the important, public parts of the program.
      * Bonus points for doing something extra and documenting it. Here are some examples that might be relevant to the team you're applying to:
        - The tests clearly demonstrate both functional *and* unit style testing.
        - The tests cover boundary conditions and positive/negative tests.
        - In addition to the main body of tests, the tests *also* cover other exploratory styles of testing such as fuzzing.
        - Something else that you think your team would find valuable (just make sure to document it so we know to look for it!)
    HEREDOC

    it 'The program should have automated tests that use assertions.' do
      is_expected
    end

    it 'The program should have documentation about how to run the program AND the tests.' do
      is_expected
    end

    it "Tests should be runnable on the evaluator's machine with small effort." do
      is_expected
    end

    it 'Tests should cover the important, public parts of the program.' do
      # 'public parts' are addressed by these feature/acceptance and solution_spec.rb system tests
      is_expected
    end

    context "Bonus points for doing something extra and documenting it." do
      # Here are some examples that might be relevant to the team you're applying to:
      it 'The tests clearly demonstrate both functional *and* unit style testing.'
      #  Could use more functional encapsulation and targeted unit testing

      it 'The tests cover boundary conditions and positive/negative tests.'
      #  Does consider some boundary conditions, eg
      #  * prioritizing whitespace over newline in parsing/streaming
      #  * no-arguments, no-stdin

      it 'In addition to the main body of tests, the tests *also* cover other exploratory styles of testing such as fuzzing.'
      it 'Something else that you think your team would find valuable (just make sure to document it so we know to look for it!)'
    end
  end

  describe 'Code Structure/Style Requirements' do
    <<~HEREDOC
      * The program should be well structured and understandable. This is purposefully a bit vague, but generally we're looking for:
        - Encapsulation
        - Separation of concerns
        - Understandability
        - Appropriate use of data structures for the language of choice
      * Please show us what _you_ think makes a program beautiful and understandable. In exchange, we'll try to open our minds and learn from you.
      * There are also many bonus points you can earn in this category, but as with the previous categories, if you do attempt bonus points in this category, please document what you did that's extra special so we can properly appreciate it.
    HEREDOC

    describe "The program should be well structured and understandable." do
      # This is purposefully a bit vague, but generally we're looking for:
      it 'Encapsulation' do
        # moderate. Separated App class, `@last_phrase` not exposed, inspect hides `phrases`
        is_expected
      end

      it 'Separation of concerns' do
        # CLI managed in solution.rb, phrase tracking managed in app.rb
        is_expected
      end

      it 'Understandability' do
        # perhaps in need of an editorial pass to balance verbosity and omissions
        is_expected
      end

      it 'Appropriate use of data structures for the language of choice' do
        # prefer Array [] and Hash {} until specialized Class/data structure warranted
        is_expected
      end
    end

    # it "Please show us what _you_ think makes a program beautiful and understandable.
    #     In exchange, we'll try to open our minds and learn from you."
    # it "There are also many bonus points you can earn in this category, but as with the previous categories,
    #     if you do attempt bonus points in this category,
    #     please document what you did that's extra special so we can properly appreciate it."
  end


  OUTPUT_BOTH = <<~OUTPUT
    out of the - 95
    of the whale - 93
    the sperm whale - 89
    a sort of - 82
    one of the - 81
    the old man - 76
    the white whale - 76
    of the sea - 61
    it was a - 60
    that he was - 60
    he did not - 57
    part of the - 57
    there was a - 57
    project gutenberg tm - 56
    at the time - 53
    as soon as - 52
    i don’t know - 51
    do you know - 47
    that he had - 47
    and in the - 45
    in the world - 45
    for a moment - 44
    he had been - 43
    of the sperm - 43
    that it was - 43
    as it were - 41
    there is no - 41
    it is a - 40
    i want to - 39
    he was a - 38
    at the same - 37
    he could not - 34
    in spite of - 34
    it was not - 34
    what do you - 34
    a long time - 33
    it was the - 33
    so as to - 33
    to go to - 33
    as though he - 32
    by no means - 32
    for the time - 32
    in the sea - 32
    the same time - 32
    up to the - 32
    all the time - 31
    at that moment - 31
    i am not - 31
    it will be - 31
    it would be - 31
    must have been - 31
    on the contrary - 31
    there was no - 31
    of the ship - 30
    the project gutenberg - 30
    all at once - 29
    father pa ssy - 29
    in order to - 29
    in the air - 29
    in the end - 29
    of the boat - 29
    the bottom of - 29
    the first time - 29
    in the same - 28
    it was that - 28
    not at all - 28
    of the world - 28
    the end of - 28
    the sperm whale’s - 28
    to be the - 28
    and all the - 27
    and at the - 27
    he seemed to - 27
    i know that - 27
    it is not - 27
    it must be - 27
    one of those - 27
    the right whale - 27
    to be a - 27
    to the deck - 27
    he had not - 26
    i do not - 26
    in his own - 26
    more and more - 26
    of his own - 26
    on the other - 26
    that in the - 26
    the sea and - 26
    with the same - 26
    would have been - 26
    as well as - 25
    down to the - 25
    for the first - 25
    into the sea - 25
    one of them - 25
    out of sight - 25
    you are a - 25
    and with a - 24
    end of the - 24
    him in the - 24
  OUTPUT
end
