# Brainfuck Interpreter
Originally forked from [https://github.com/elm-city-craftworks/turing_tarpit](https://github.com/elm-city-craftworks/turing_tarpit). Also see license. 

I used the same structure as the original. The `Interpreter` object scans the .bf source file and sends the instructions to the `Evaluator` object, which handles the actual operations.

I disregarded the original code and only used the tests. I wrote one extra test, and after comparison, think my version is a bit cleaner. (This was all done purely for practice.)

## Usage

    $ ./bin/brainfuck my_program.bf

## Tests

    $ ruby test/suite.rb

Run '99 bottles of beer' with the following command

    $ ./bin/brainfuck test/fixtures/99bottles.bf

Not a record time, but it works. I did not write the brainfuck programs myself.

## License

Copyright (c) 2012 Gregory Brown 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE