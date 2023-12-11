# Exegol Tools Wrappers
This is a simple yet effective tool to create wrapper scripts for all tools included in Exegol images. 

The idea is to propagate "tools" file with all the tool names included in Exegol Docker image. Good starting point is official list in .CSV format available here (https://github.com/ThePorgs/Exegol-docs/tree/main/source/assets/installed_tools). Simply just copy/paste first column. Script automates this task by getting tools list from nightly builds.

Configuration of this tool is simple and is kept in "config" file which is sourced to all wrapper scripts for customization puproses.
## Config variables are as follows:
- EXEGOL_BIN_PATH - location of config, list and all the wrapper scripts. Should be added to system PATH environment variable.
- EXEGOL_ENV - name of the Exegol Docker container being used.
- EXEGOL_PREFIX - prefix added before each wrapper script to be easily distinguidhed from regular binaries while using autocomplete in your terminal.

## Initialization/Update
Before first use you have to run "exegol-create-tools-wrappers.sh" script which will create for each tool a wrapper script.

You can modify each wrapper individually i.e. to add some defaults for the tools.
If you wish to add new wrapper scripts after modifing "tools" file, all you need is rerun "exegol-create-tools-wrappers.sh".

Script will not overwrite existing files so if you make some customization it will survive unless you remove the files manually.
Remember to set a prefix in config file as it will spare you some headaches wondering what is the origin of the tool (local filesystem or exegol container).
It's simple as 1-2-3!

## Usage
In your terminal of choice just use it like this:

```
$ prefix-toolname [args]
```

and it will run:

```
$ exegol exec -v container-name 'toolname [args]'
```