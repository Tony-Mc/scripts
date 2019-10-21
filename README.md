# scripts

A collection of small utility scripts.

You can also add this directory to system `PATH` to have easier access to the scripts.

## git-clean

Deletes all local merged branches except current branch and `master`.
Fetches remote with prune.

### Requirements
- `git`

### Usage
```
$ git-clean.sh
```

## git-vacate

Fetches and checks out the latest `origin/master`. 

Cleans merged branches (see `git-clean.sh`).

### Requirements
- `git`
- `git-clean.sh`

### Usage
```
$ git-vacate.sh
```

### Notes
`origin/master` is currently hardcoded in the script.

## nuget-clear

Clears all NuGet caches.

### Requirements
- `dotnet`

### Usage
```
$ nuget-clear.sh
```

## docker-stop

Stops all Docker containers that are running.

### Requirements
- `docker`

### Usage
```
$ docker-stop.sh
```