# ALEX-API sources

## Restore and clear nuget packages

Restore is done automatically when starting 
[devcontainer](../.devcontainer/README.md).
To manually restore _nuget_ packages use:

```bash
dotnet restore src/Alex.Api/
```

To clear _nuget_ packages use:

```bash
dotnet nuget locals all -c
```