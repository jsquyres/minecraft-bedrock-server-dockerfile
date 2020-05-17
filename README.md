There are three main scripts here:

* kill-everything.sh: remove the docker container and image -- i.e.,
  whack everything so that we can cleanly start over.

* build-docker-image.sh: it builds the Docker image from Dockerfile.

* run-docker-container.sh: start the docker container, which generally
  does the following:

  1. Creates a container from the image
  2. Starts the container
  3. Exposes the relevant UDP port
  4. Exposes two directories to the external filesystem

The PMMP project is pretty horribly documented.  :-(

What the current Dockerfile does is run the "start.sh" script inside
the container, which runs the server.

HOWEVER: it also currently detaches the container, so you can't
actually type any commands into the server.  Need to look into how to
do that properly.

--> Perhaps we should run "start.sh" inside "screen" in the container,
    so that I can attach/detach to the server's tty...?

------

I haven't figured out multi-world stuff in the PMMP server yet, but I
think it has something to do with listing multiple worlds in
pocketmine.yml (in the container)...?  Not sure.

-----

Download plguin *.phar files from poggit.pmmp.io and put them in the
"plugins" directory, and then either stop/start the server, or issue a
"reload" command on the server's tty to load the plugin.  Then issue a
"help" command on the server's tty to see new commands.

-----

A lot of plugins seem to rely on permissions.

The only way I could find to list/set/delete/edit permissions was
through the https://poggit.pmmp.io/p/PurePerms/ plugin.  See that page
for the list of commands to list/edit/etc. groups and permissions.

-----

On 17 May 2020, discovered that a world generated on Kaitlyn's iPad
with the iOS Minecraft app was apparently not readable in PMMP.  Found
a cryptic reference in the PMMP forums that PMMP v4.0.0 *might* be able
to read this format (current PMMP version is 3.1.something, API
version 1.14.6).
