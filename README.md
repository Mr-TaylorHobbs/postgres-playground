## PostgreSQL Playground

This repo is just me playing with and learning PostgreSQL.

### Running locally
If you want to clone and use this repo you will need [pgTAP](http://pgtap.org/).

All files are written and executed using [Jarrod Taylor's vim-shell-executor](https://github.com/JarrodCTaylor/vim-shell-executor/),
this makes it super easy to break up the files and run them quickly, I highly reccommend using it.

Currently there is one database and one table, make sure to run `create-database.sql` first.

If you mess something up you can run the `destroy-database.sql` file to drop the table and start over.
