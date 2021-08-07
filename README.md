# GitHub Action to check for files with CRLF line endings

A GitHub Action to keep in check those windows developers who have given up understanding git's autocrlf setting and/or forget to handle line endings on their side.

By default checks all files in the repository (excluding the .git folder), but can be given a list of separate directories to check.

## Disclaimer

I don't have much time to work on this unexpectedly appreciated github action, but if you find out that your use case is complex enough to require additional features, you're probably better off using the line endings functionality included by git itself. Some references:

- how to set specific line endings for each file by using gitattributes: <https://git-scm.com/docs/gitattributes#_text>
- <https://docs.github.com/en/free-pro-team@latest/github/using-git/configuring-git-to-handle-line-endings>
- <https://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/>

## Example

```yml
name: Example usage

on: push

jobs:
  example-workflow:
    name: Example workflow using the Check CRLF action
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository contents
        uses: actions/checkout@v1

      - name: Use action to check for CRLF endings
        uses: erclu/check-crlf@v1
        with: # omit this mapping to use default path
          path: ./a-custom-path
```

## Contributors

Most of the work was done by @Rotendahl, I mainly copy-pasted stuff from stack overflow :)

<!--
  TODO rewrite using js (better performance)
-->
