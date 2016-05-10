# Concourse CI Hello World

This document shows you how to set your recurring manual tasks to Concourse CI.

After reading it and setting tasks properly, your tedious tasks might be automated by Concourse CI.

## Sections

1. Download `fly` command binary and locate it to your path
2. Login and register target Concourse CI with `fly`
3. Write a basic pipeline
4. Set the pipeline to Concourse CI
5. Unpause the pipeline
6. (Optional) Pause the pipeline
7. (Optional) Remove the pipeline

## Download `fly` command binary and locate it to your path

Open the URL of Concourse CI in your browser and click the `fly` CLI appropriate for your operating system.

Once downloaded, move the `fly` binary into your path, such as `/usr/local/bin` . Don't forget to make it executable.

```bash
sudo chmod 0755 ~/Downloads/fly
sudo mv ~/Downloads/fly /usr/local/bin
```

## Login and register target Concourse CI with `fly`

In order to use `fly` command for setting pipelines to Concourse CI, it is the first thing to login and register target Concourse CI.

```bash
fly --target ci login -c <your Concourse CI URL>
fly -t ci sync
```

If GitHub Authentication of Concourse CI is enabled, your prompt will show something like this.

```bash
navigate to the following URL in your browser:

    http://<your Concourse CI URL>/auth/github

enter token:
```

Open `http://<your Concourse CI URL>/auth/github` in your browser, copy the token shown on the page and enter the token to your prompt.

## Write a basic pipeline

If you want target Concourse CI to `curl -I https://google.com` every 5 minutes, a basic pipeline file is like this:

```yaml
resources:
  - name: timer
    type: time
    source:
      interval: 5m

jobs:
  - name: <any name is OK>
    plan:
      - get: timer
        trigger: true
      - task: curl
        config:
          platform: linux
          image: docker:///tutum/curl
          run:
            path: curl
            args:
              - -I
              - https://google.com
```

You should replace `<any name is OK>` with any name you want because its name will be shown on Concourse CI Web UI.

Save this file as the name you want. For example, `timer-curl.yml`

If you want to set a pipeline including more complicated shell scripts, you should read this tutorial section below:

- [03 - Task scripts](https://github.com/starkandwayne/concourse-tutorial#03---task-scripts)
  - [sample codes](https://github.com/starkandwayne/concourse-tutorial/tree/master/03_task_scripts)

## Set the pipeline to Concourse CI

Set the pipeline to target Concourse CI like this:

```bash
fly -t ci set-pipeline -c timer-curl.yml -p <any pipeline name you want>
```

You should replace `<any pipeline name you want>` with another name you want because its name will be shown on Concourse CI Web UI.

## Unpause the pipeline

After setting your pipeline to your Concourse CI, the next thing you should do is to unpause your pipeline.

The command for unpausing some pipeline is like this:

```bash
fly -t ci unpause-pipeline -p <the pipeline name you want to unpause>
```

## (Optional) Remove the pipeline

If you want to remove your pipeline from your Concourse CI, the command is like this:

```bash
fly -t ci destroy-pipeline -p <the pipeline name you want to remove>
```

## Suppliments

If you want to know more about Concourse CI, the documentations below are great supporters!

1. [Official documentation](https://concourse.ci/introduction.html)

2. [Concourse Tutorial](https://github.com/starkandwayne/concourse-tutorial) by Stark & Wayne
  - [One of the tutorials which the official Concourse CI documentation introduces](https://concourse.ci/tutorials.html).

3. [パイプラインベースのCI/CDツール Concourse CI入門](https://blog.ik.am/entries/379)
4. [はじめてのConcourse CI](https://blog.ik.am/entries/380)
  - Written in Japanese.
