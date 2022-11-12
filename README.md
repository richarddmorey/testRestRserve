# testRestRserve

Debugging a problem with RestRserve

This repository uses `{renv}` for reproducibility.

To reproduce the problem:

1. Install the necessary packages with `{renv}`:

```
renv::restore()
```

2. In a terminal, start the server:

```
$ Rscript start.R
```

3. In another terminal, try to get a response:

```
curl http://localhost:8080/a
```

On macOS 12.6 (21G115), under these three conditions:

* `{promises}` is loaded
* `{cli}` is installed
* `rmarkdown::render` is called

The server fails to give a response:

```
$ curl http://localhost:8080/a
curl: (52) Empty reply from server
```

In the terminal running the server, we see

```
$ Rscript start.R
Installing cli [3.4.1] ...
        OK [linked cache]
{"timestamp":"2022-11-12 09:06:50.916110","level":"INFO","name":"Application","pid":74331,"msg":"","context":{"http_port":8080,"endpoints":{"HEAD":"/a","GET":"/a"}}}
-- running Rserve in this R session (pid=74331), 2 server(s) --
(This session will block until Rserve is shut down)
objc[74414]: +[NSNumber initialize] may have been in progress in another thread when fork() was called.
objc[74414]: +[NSNumber initialize] may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.

```