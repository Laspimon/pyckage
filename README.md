# Pyckage

Tool for packaging python scripts.

Packaging works by zipping entire project, and creating a new file that can execute the collected contents of the zip file.
This requires the entry file to be named __main__.py.

## Dependencies

Downloads all dependencies from requirements.txt, and places them in .pyckage.
Then creates top-level symlinks for all modules, so they can be imported.

## Acknowledgements

Inspired by chadmill3r:
https://www.reddit.com/r/Python/comments/4if7wj/what_do_you_think_is_more_difficult_in_python/d2xni0e
