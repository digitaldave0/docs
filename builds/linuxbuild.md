##



##Incremental backup projects  

You must create a level 0 backup first:

````bash
tar --create --verbose --listed-incremental ./projects --gzip  --exclude-from=projects/backup_exclude.txt \
    --file projects_`date +%F`.tar.gz projects/
````
--exclude-from=projects/backup_exclude.txt 

This archive is called a level 1 backup.

and the next day, this command compress only files changed since the creation of the ./projects.snar:

````bash

$ tar --create --verbose --listed-incremental ./projects.snar --gzip  --exclude-from=projects/backup_exclude.txt \
    --file projects_`date +%F`.tar.gz projects/
````


When you want to restore, put all archive files into a folder and extract each in order of their creation using the --incremental option, something like this:

````bash
for t in projects_2011-10-2*.tar.gz; \
    do tar --verbose --extract --incremental --gzip --file $t; done

````