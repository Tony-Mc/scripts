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

## docker-new-postgres

Runs a new Postgres container on `docker`.

### Requirements
- `docker`

### Parameters
- $1 - name **(required)**
- $2 - port *(optional, default: 5432)*. 
- $3 - password *(optional, default: password)*.

### Usage
```
$ docker-new-postgres.sh "mydb"
$ docker-new-postgres.sh "mydb" 1234
$ docker-new-postgres.sh "mydb" 1234 "otherPassword"
```

### Notes
This script is intended to be used for development purposes only.