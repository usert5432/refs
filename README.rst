refs - Quick Notes Manager
==========================

`refs` is a tiny bash CLI program to manage quick plaintext notes.

Why `refs`?
-----------

So, you are doing some work and you need to google "How to do X". You found an
answer and it would be nice to save it for the future reference. But, it would
take quite some time to format and save note properly in your preferred note
management application and it will distract you from doing your work.

This is where `refs` comes in. Instead of spending time now to properly save
this note, you quickly store its draft with `refs` and it keep working. Stored
notes can be properly formatted and saved later, when you have time and/or
motivation to do that.

While your drafted notes are managed by `refs` they can be easily listed,
searched and reviewed with built-in commands.


Installation
------------

Simply install it with:

::

    make install

Use ``PREFIX`` variable to control installation destination.

Usage
-----

Let's create our first note. Type in your terminal:

::

    $ refs add

It will open an editor (as specified by ``${EDITOR}`` env var) where you can
enter contents of your note. `refs` expects that your note will have a single
line header (for easy navigation later) and a body, but that is not enforced.
Once you have entered your note just save it and `refs` will remember it.

You can list saved notes with:

::

    $ refs list
    [ 1 ] : 2020-01-01_00:00:01.9KSozAZ2Xq : First Note

Here `refs` prints all available notes -- one per line. ``[ 1 ]`` indicates
note number. ``2020-01-01_00:00:01.9KSozAZ2Xq`` is a filename that `refs`
assigned to your note. This note can be located in the ``~/.refs`` directory.

Saved notes can be searched with ``grep`` command:

::

    $ refs grep Note
    [ 1 ] : 2020-01-01_00:00:01.9KSozAZ2Xq
    First *Note*

And viewed with ``cat`` or ``less`` commands

::

    $ refs cat 1
    >>> ~/.refs/2020-01-01_00:00:01.9KSozAZ2Xq :
    First Note

    This is my first note.

which take note number or filename as an argument. You can find more
information about `refs` in its man page

::

    $ man refs

