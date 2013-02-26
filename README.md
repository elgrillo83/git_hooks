git_hooks
=========

Various git_hook scripts

What for
========

The pre-commit script for example checks every staged file for `binding.pry` and won't allow you to commit affected files.

How to
======

Example for the pre-commit hook script:

* Clone / fork repo
* Create symbolic link to each project where you want to use the pre-commit hook script: 
  `ln -s /path/to/pre-commit.sh /path/to/project/.git/hooks/pre-commit`
* Make the pre-commit script link in your project executable with:
  `chmod +x .git/hooks/pre-commit` 
