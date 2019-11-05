# GitHub Action to check for files with CRLF line endings

GitHub Action to add to a workflow, to keep in check those windows developers who have given up understanding git's autocrlf setting and/or forget to handle line endings on their side.

Uses grep on a docker container.

By default checks all files in the repository (excluding the .git folder), but can be given a list of separate directories to check.

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

<!--
  TODO check if it's possible to use the virtual host bash instead of docker
  TODO rewrite using js (better performance)
-->
