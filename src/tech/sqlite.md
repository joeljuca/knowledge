# 🪶 [sqlite](https://www.sqlite.org)

[SQLite](https://www.sqlite.org/) is the most popular database in the world. Pretty much every fucking person in the world uses something that uses SQLite. However, it's generally considered a "toy database", often used for development purposes but not really considered as a possible solution to production usage.

In fact, it's easier to find people using ordinary data files (CSV, JSON, YAML, etc.) to store and organize larger amounts of data than to find people using SQLite for real-world scenarios. This is due to the fact that developers are often educated to use "production-grade databases" like MySQL or Postgres instead of SQLite – which is unfortunate, because all these three options are production-grade tools, capable of serving different types of products.

Lately, I've attempting to adopt SQLite for serious workloads. I'm building an app that's intended for a wider audience, and I've adopted SQLite as my main database.

What a challenge! Let's see how far I can get with such embedded database.

## Using SQLite

SQLite databases are stored in a single file. Apparently there's no rule for how these are named, but [Wikipedia's SQLite page](https://en.wikipedia.org/wiki/SQLite) lists the following file extensions: `.sqlite`, `.sqlite3`, `.db`, `.db3`, `.s3db`, and `.sl3` (MIME type is `application/vnd.sqlite3`).

CLI work is made through a CLI tool called `sqlite3`. Eg.:

```sh
sqlite3 database.sqlite
```

- To create an empty database, just create an empty file:
  ```
  touch database.sqlite
  ```
- To delete a database, delete the file:
  ```
  rm database.sqlite
  ```

## Dot-commands

The most important one: `.help` Eg.:

```
$ sqlite
SQLite version 3.41.2 2023-03-22 11:56:21                                                                                                                               [22/382]
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> .help
.archive ...             Manage SQL archives
.auth ON|OFF             Show authorizer callbacks
.backup ?DB? FILE        Backup DB (default "main") to FILE
.bail on|off             Stop after hitting an error.  Default OFF
.binary on|off           Turn binary output on or off.  Default OFF
.cd DIRECTORY            Change the working directory to DIRECTORY
.changes on|off          Show number of rows changed by SQL
.check GLOB              Fail if output since .testcase does not match
.clone NEWDB             Clone data into NEWDB from the existing database
.connection [close] [#]  Open or close an auxiliary database connection
.databases               List names and files of attached databases
.dbconfig ?op? ?val?     List or change sqlite3_db_config() options
.dbinfo ?DB?             Show status information about the database
.dump ?OBJECTS?          Render database content as SQL
.echo on|off             Turn command echo on or off
.eqp on|off|full|...     Enable or disable automatic EXPLAIN QUERY PLAN
.excel                   Display the output of next command in spreadsheet
.exit ?CODE?             Exit this program with return-code CODE
.expert                  EXPERIMENTAL. Suggest indexes for queries
.explain ?on|off|auto?   Change the EXPLAIN formatting mode.  Default: auto
.filectrl CMD ...        Run various sqlite3_file_control() operations
.fullschema ?--indent?   Show schema and the content of sqlite_stat tables
.headers on|off          Turn display of headers on or off
.help ?-all? ?PATTERN?   Show help text for PATTERN
.import FILE TABLE       Import data from FILE into TABLE
.imposter INDEX TABLE    Create imposter table TABLE on index INDEX
.indexes ?TABLE?         Show names of indexes
.limit ?LIMIT? ?VAL?     Display or change the value of an SQLITE_LIMIT
.lint OPTIONS            Report potential schema issues.
.load FILE ?ENTRY?       Load an extension library
.log FILE|off            Turn logging on or off.  FILE can be stderr/stdout
.mode MODE ?OPTIONS?     Set output mode
.nonce STRING            Suspend safe mode for one command if nonce matches
.nullvalue STRING        Use STRING in place of NULL values
.once ?OPTIONS? ?FILE?   Output for the next SQL command only to FILE
.open ?OPTIONS? ?FILE?   Close existing database and reopen FILE
.output ?FILE?           Send output to FILE or stdout if FILE is omitted
.parameter CMD ...       Manage SQL parameter bindings
.print STRING...         Print literal STRING
.progress N              Invoke progress handler after every N opcodes
.prompt MAIN CONTINUE    Replace the standard prompts
.quit                    Stop interpreting input stream, exit if primary.
.read FILE               Read input from FILE or command output
.recover                 Recover as much data as possible from corrupt db.
.restore ?DB? FILE       Restore content of DB (default "main") from FILE
.save ?OPTIONS? FILE     Write database to FILE (an alias for .backup ...)
.scanstats on|off|est    Turn sqlite3_stmt_scanstatus() metrics on or off
.schema ?PATTERN?        Show the CREATE statements matching PATTERN
.selftest ?OPTIONS?      Run tests defined in the SELFTEST table
.separator COL ?ROW?     Change the column and row separators
.session ?NAME? CMD ...  Create or control sessions
.sha3sum ...             Compute a SHA3 hash of database content
.shell CMD ARGS...       Run CMD ARGS... in a system shell
.show                    Show the current values for various settings
.stats ?ARG?             Show stats or turn stats on or off
.system CMD ARGS...      Run CMD ARGS... in a system shell
.tables ?TABLE?          List names of tables matching LIKE pattern TABLE
.testcase NAME           Begin redirecting output to 'testcase-out.txt'
.testctrl CMD ...        Run various sqlite3_test_control() operations
.timeout MS              Try opening locked tables for MS milliseconds
.timer on|off            Turn SQL timer on or off
.trace ?OPTIONS?         Output each SQL statement as it is run
.version                 Show source, library and compiler versions
.vfsinfo ?AUX?           Information about the top-level VFS
.vfslist                 List all available VFSes
.vfsname ?AUX?           Print the name of the VFS stack
.width NUM1 NUM2 ...     Set minimum column widths for columnar output
sqlite>
```

## Resources

SQLite is unlike most popular relational databases due to it not being embedded instead of client-server.

- [Mycelial YouTube channel](https://www.youtube.com/channel/UCgmu4SU8x0K_Uodq7sPATmw)  
  They develop extensions to SQLite for distributed use cases

### SQLite and the N+1 Problem

<p style="text-align:center">
  <iframe src="https://www.youtube.com/embed/qPfAQY_RahA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen  style="max-width:560px;height:315px;width:100%"></iframe>
</p>
