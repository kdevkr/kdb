/ handles.q

/ If Linux system, connect it using a Unix domain socket.
h:$["l" = first string .z.o;hopen `:unix://5000;hopen `::5000]

/ check the connection type from the active socket table.
{([]h)!-38!h:.z.H}[]
/ h  | p f
/ ---| ---
/ 624| q t
/ 496| q t

/ When performing IPC, it is efficient to transfer lambda functions and parameters.
h ({.z.o};::)
/ `w64
h ({(.Q.opt .z.x)x};(`pidfile))
/ "q.pid"