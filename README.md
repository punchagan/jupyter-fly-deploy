# jupyter-fly-deploy

An experimental Dockerfile based method to deploying multiple Jupyter notebooks to a Fly.io machine.

There's no OAuth and user management. Unexpected things could happen if multiple people  use the server at the same time.

## Usage

0. Use this repository as a template (button on GitHub) to create your own
   copy of it.

1. Setup an account on fly.io

2. [Install flyctl](https://fly.io/docs/flyctl/install/)

3. Run `fly auth login``

4. Run `fly launch --generate-name --no-deploy`.

   Answer `y` to use existing config.

5. Remove `project_a/` and `project_b/` directories and create directories for
   your own notebooks. The directories should contain a requirements.txt if it
   contains a notebook directory. It can be empty if you don't need any
   additional dependencies other than Jupyter notebook.

6. Run `fly deploy` to deploy your changes.

7. You can [setup the app to be automatically
   deployed](https://fly.io/docs/launch/continuous-deployment-with-github-actions/)
   on future pushes to GitHub using GitHub actions by creating a Fly token and
   adding it to the repository's settings. The GitHub workflow file is already
   present.
