# `gamut` Software Contributions

[repository]: https://github.com/IMMM-SFA/gamut
[issues]: https://github.com/IMMM-SFA/gamut/issues
[new_issue]: https://github.com/IMMM-SFA/gamut/issues/new
[readme]: https://github.com/IMMM-SFA/gamut#readme
[email]: kristian.nelson@pnnl.gov


### Software Questions

If you have a question while using the `gamut` package, first look through the [documentation][readme] to see if the answer is there. If the documentation doesn't answer your question, you can open up an [issue on Github][new_issue]. Explain your question, and the package maintainer will get back to you as soon as possible. If you would like to contact the package maintainer directly, you can do so by [email][email].

### Software Contributions and Guidlines

If you would like to suggest new ideas or functionality for the `gamut` package, go to the [issue page][issues] and create issues for new ideas you might have. If you would like to fix bugs or add in new functions yourself, you may do so by following the development guidelines below.

It is best to follow the standard Github workflow for development.

1. Clone [the repo][repository] to your computer using `git clone`. 
2. Open the RStudio `gamut` project file (`.Rproj`), and create a new branch off of the `dev` branch.
3. Once you are on a new branch, make your changes:
    * Write your code.
    * Test your code by running this function: `count_watershed_teleconnections(data_dir = "your/data/dir", cities = c("New York | NY", "Portland | OR"))`. This will make sure that cities with single and multiple watersheds work properly. 
    * Document your code (Ctrl+Shift+D).
    * Check your code with `devtools::check()` and aim for 0 errors. `gamut` currently has warnings from outside packages, so warnings can be ignored for now. 
5. Commit and push your changes.
6. Submit a [pull request](https://github.com/IMMM-SFA/gamut/pulls). A package maintainer will review your pull request and either merge or close it. 

### Report a Bug

If you discover a bug while using the `gamut` package, please create an [issue on GitHub][new_issue] so we can fix it. If possible please include the following in your issue:

* Your operating system name and version.
* Steps of code that reproduce the bug.
