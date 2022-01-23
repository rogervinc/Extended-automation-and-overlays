This is my first attempt at getting some unit testing added around some FG extension code to try and help make extensions easier to maintain.
Unit tests can help to quickly identify any regressions due to new changes, and provide the ability to undertake more major refactoring of code than you might feel comfortable doing if you had to rely on manual testing of all functionality.

1. Install a LUA runtime
e.g. https://github.com/rjpcomputing/luaforwindows/releases

2. from a command prompt with 'scripts' folder as current directory run
lua test_something.lua

you should see output like

lua test_something.lua
..........
Ran 10 tests in 0.002 seconds, 10 successes, 0 failures
OK

Notes:
in the file with the unit tests (test_something.lua) you will notice declarations of things like 
StringManager = {}
function StringManager.somefunction(foo, bar)
...
end

this is mocking out the FG parts of the code to return the exact value(s) that you want and you could also do an assert in the mocked stub to test the values of the arguments passed to the mock
