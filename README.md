# github-deployment-status

This Github actions adds functions for creating a status on the github deployment api.

## Usage

For example use this at the end of your job like this:

```
...
- name: update deploy status
    if: always()
    uses: docker://unacast/actions-github-deployment-status
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    with:          
      args: ${{ job.status }}
```
