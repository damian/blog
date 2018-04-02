+++
title = "Git stash workflow"
date = "2017-08-22"
+++

One of the main reasons I believe Git to be so well adopted is its flexibility. It has utilities to suit the workflow of a sole developer working on their own project and can easily scale up to meet the needs of thousands of developers contributing across multiple repositories like in Open-source.

A lesser known utility of Git that I find fits my workflow well is [Git stash](https://git-scm.com/docs/git-stash), and I'm going to share my rationale as to why **I eschew working on a feature branch with frequent commits** which is ingrained in to most standard Git based workflows(like Git flow) and use git stash a lot. In order to do that it's probably best that I share my current workflow first.

## Workflow

1. Checkout master branch and do a git pull
2. Start my work on master branch
3. Add files periodically to the stage when I believe them to be in good shape(this includes any files being removed)
4. Get to a point where there are no more working files left and everything is added to the stage
5. Review all the files on the stage and fix up any issues that I notice
6. Make a new feature branch and commit
7. Pull with rebase from master in to feature branch then push to GitHub and make a pull request

You'll notice that `git stash` was not run at any point in the above workflow. That's because quite frequently I'll be interuppted between steps 2-5 whether that means working on something that's higher priority or checking out a colleagues branch to help debug a problem. This is where `git stash save` really comes in to its own, versus doing a 'WIP commit' on the feature branch and coming back to it later for the following reasons.

## Never forget which branch you were working on

This is subjective, but recalling the feature branch previously worked on was a constant problem for me. Command line magic like `git checkout -` to move to the previous branch only worked some of the time. With `git stash` it's impossible to forget because the branch **is always master**!

## Two git commands are all that's needed

With the `git stash` workflow, you'll only ever have to recall two commands, namely `git stash save -u`. The `-u` is very important as this ensures that any untracked files are also added to the stash contents. The second command being `git stash apply` which reverts back to the exact same state prior to running `git stash save -u`. Untracked files remain untracked as you'd expect it.

**Note**: Never ever use `git stash pop`.

Contrast this to the feature branch / WIP commit approach there's far more git interaction and cognitive load required because you're effectively left with a clean slate at this point. You either have to:

1. Start digging through git logs to understand where you left off and try to push on though no doubt you'll forget something
2. Undo the commit using `git reset` and hope that you remembered the correct flags to pass to it. If you do you can carry on that way.

## Less need for squashing or amending commits

Because your crafting the commits as you go and using the git stash for your working changes, squashing or amending commits is rarely needed.

## Keep your working tree as a todo list

Commits aren't final but they don't give you good feedback of where you left things. A good commit message or TODOs written in can alleviate this, but those are overkill in my opinion. Showing the working tree status with `git status` has been all I've ever needed alongside `git diff` and `git diff --staged`.
