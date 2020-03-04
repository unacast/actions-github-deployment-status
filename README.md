# github-deployment-status

This Github actions adds functions for creating a status on the github deployment api.

It is a small wrapper for your workflows to use the Github Deployment Status API https://developer.github.com/v3/repos/deployments/#create-a-deployment-status

## Usage

For example use this at the end of your job like this:

```
- name: update deploy status
    if: always()
    uses: unacast/actions-github-deployment-status@v0.3.0
    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      status: ${{ job.status }}
```
