A network utility with many features
We will use to create TCP connections

Used for HTTP request
```cmd
$ netcat -v google.com 80
```

The `v` flag is for verbose, `l` for listen mode, and `p` for port (required on Macs)

Used to listen on a port (used here as server)
```cmd
Listening on [0.0.0.0] (family 0, port 2345)
```

Used to connect from second terminal (used here as client)
```cmd
$ netcat -lvp 2345
```

To terminate `netcat` in any terminal window within which it is running, just hit `Ctrl-C` with the terminal window active.