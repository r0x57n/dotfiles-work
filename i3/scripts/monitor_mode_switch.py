#!/usr/bin/python

from i3ipc import Event, Connection

i3 = Connection()

def on_workspace_focus(i3, e):
    workspace = int(e.current.name.split(":")[0])

    if workspace < 10:
        i3.command('mode default')
    elif workspace < 20:
        i3.command('mode m2')
    elif workspace < 30:
        i3.command('mode m3')

def main():
    print("Started...")

    # Subscribe to events
    i3.on(Event.WORKSPACE_FOCUS, on_workspace_focus)

    i3.main()


if __name__ == "__main__":
    main()
