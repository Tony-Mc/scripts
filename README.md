# scripts

A collection of small utility scripts.

You can also add this directory to system `PATH` to have easier access to the scripts.

## git-clean

Deletes all local merged branches except current branch and `master`.
Fetches remote with prune.

### Requirements
`git`

### Usage
```
$ git-clean.sh
```

## nuget-clear

Clears all NuGet caches.

### Requirements
`dotnet`

### Usage
```
$ nuget-clear.sh
```

## docker-stop

Stops all Docker containers that are running.

### Requirements
`docker`

### Usage
```
$ docker-stop.sh
```

## aws-config-list

Lists all available AWS CLI configurations.

### Requirements
Subfolders containing different configurations in main AWS configuration folder.

### Usage
```
$ aws-config-list.sh
```

## aws-config-switch

Switches to specified AWS CLI configuration.

### Requirements
Subfolders containing different configurations in main AWS configuration folder.

### Usage
```
$ aws-config-switch.sh "config_name"
```
