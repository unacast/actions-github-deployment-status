# github-deployment-status

This Github actions adds functions for creating a status on the github deployment api.

It is a small wrapper for your workflows to use the Github Deployment Status API https://docs.github.com/en/rest/reference/repos#deployments

Read more on the deployment event on github actions https://docs.github.com/en/actions/reference/events-that-trigger-workflows#deployment

## Usage

For example like this
```
on: deployment
name: Deploy
jobs:
  deploy:
    name: Deploy event
    runs-on: ubuntu-latest
    steps:
      - name: Set deploystatus in_progress
        uses: unacast/actions-github-deployment-status@[version]
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          status: in_progress

... <Do your deploy stuff>
      - name: Set an environment
        run: |
          echo '::set-env name=DEPLOY_ENVIRONMENT::http://halloi.lol'

      - name: Update result to Deployment API
        if: always()
        uses: unacast/actions-github-deployment-status@[version]
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          status: ${{ job.status }}
          description: "Deployed to some magic"
          environment_url: '${{ env.DEPLOY_ENVIRONMENT }}'
```

### Inputs
The action has the following inputs (see in action.yml)
```
  github_token:
    description: 'The GITHUB_TOKEN secret'
    required: true
  status:
    description: 'The status to create. Can be one of error, failure, inactive, in_progress, queued, pending, or success'
    required: true
  description:
    description: 'The description to create. Restricted to 140 chars'
    required: false
    default: ""
  environment_url:
    description: 'Sets the URL for accessing your environment'
    required: false
    default: ""
  auto_inactive:
    description: "Adds a new inactive status to all prior non-transient, non-production environment deployments with the same repository and environment name as the created status's deployment. An inactive status is only added to deployments that had a success state."
    required: false
    default: true    
```    

## FAQ
Q: Can I use this in workflows that listens to events other than the deployment event?
A: No. This is tailored to the deployment event. 
