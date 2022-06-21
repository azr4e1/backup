# Backup

    backup [-h][-c <config>][-i <files>][-f <backup_directory>]

    backup -h
        print this help and exit

    backup -c <config>
        Specify a different configuration file

    backup -i <files>
        Specify the files to backup as a comma separated list.
        This will ignore the configuration file.

    backup -f <backup_directory>
        Save the archive in <backup_directory>.

    backup -o <output>
        Save the archive as <output>

backup is a cli utility that does only one thing, in a very dumb way:
parses through a configuration file located in '\$HOME/.config/backup/conf' by
default and archives and compresses all the files and directories specified in
that configuration, and stores the result in a directory of your choice. For
example, if you type:

    backup -f /mnt/backup_dir

backup will archive and compress everything specified in the configuration
file (recursively), and then save the archive in
/mnt/backup_dir/YYYY_MM_DD_backup.tar.gz.
If the configuration file is empty, backup will just backup the entire
filesystem starting from \$HOME. If the -f flag is missing, it defaults
to \$HOME.

You can specify a different configuration file with -c flag, or you can
list the files and directories to backup as a comma separated list with
the -i flag.

Remember that for both the -c and -f flag, you must specify absolute paths.


## REQUIREMENTS

* bash


## CONFIGURATION

The configuration is very simple: a file or directory name for every line. If
you want to exclude something from the backup that would otherwise be
included, write it like you would normally do to include it, but prepend a
bang to it: '!'. That's it.

## INSTALLATION

Clone the repository

    git clone https://github.com/A0-Z1/backup

Step into the repo

    cd backup

run the installer system wide

    ./install.sh

or per local user (you must have .local/bin in your path)

    ./install.sh -u
