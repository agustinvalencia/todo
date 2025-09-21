# Motivation

I have been trying to play with `rust` roaming around speed and safety. But then I realised that C++
although unsafe, it has a huge momentum of 40+ years, and therefor is not going anywhere. So why not
better re-take it and learn it to do on a safe way. 

I started reading about _modern C++_ -although the very first time I started studying C++ it was
already _modern_ - it felt, way more natural than studying rust, of course because I had already
some years of knowing it, and then the _safety_ concepts became to be way more clearer. 

Thus, across these notes I will be writing (yet another) to do list cli app, not meaning to be
actually used (but will open source it anyhow), but as a means to re-learn C++, now with a focus on
memory safety and more modern tooling (since I've been doing R and python for the last 7-8 years).

## The vision

I'd like to have a cli to handle to-do lists and projects that wraps them. Each object, i.e., task
and project, should be stored in an open portable format. As an obsidian user, I'll stick with
markdown and embedded yaml frontmatter. 

### Adding a project

```bash
> todo project "new project" -id "new-project"

Created project new project
```

### Adding a task

```bash
> todo task "new task" -p "new-project"

Created new task in new project
```

### Listing 

#### Projects

```bash
> todo list projects

Projects: 
(1) Old project (old-project)
(2) new project (new-project)
```

#### Tasks

```bash
> todo list tasks

Tasks: 
(1) Old task (old-project)
(2) new task (new-project)
```

#### Tasks from a project

```bash
> todo list tasks -p "new-project"

Tasks: 
(2) new task (new-project)
```
