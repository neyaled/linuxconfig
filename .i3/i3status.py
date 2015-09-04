#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import json

import imaplib

import pynotify

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    obj = imaplib.IMAP4_SSL('servername','993')
    obj.login('login','pwd')

    pynotify.init("mail notif")
    notified = []


    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE
        obj.select('bz')
        unreadbz = obj.search(None,'UnSeen')[1][0].split()
        obj.select()
        unread = obj.search(None,'UnSeen')[1][0].split()
        message = ""
        for mailid in unread:
            if (mailid not in notified):
                notified.append(mailid)
                mail = obj.fetch(mailid,'(RFC822.SIZE BODY.PEEK[HEADER.FIELDS (FROM SUBJECT)])')
                message = mail[1][0][1]+"\n"

        if message:
            notice = pynotify.Notification("New mails", message)
            notice.set_timeout(10)
            notice.show()

        if len(unreadbz):
            j.insert(0, {
                'full_text' : '%d bz update' % len(unreadbz),
                'name' : 'newbz',
                'color' : '#FF0000'})
        if len(unread):
            j.insert(0, {
                'full_text' : '%d new emails' % len(unread),
                'name' : 'newmail',
                'color' : '#FF0000'})
        else:
            notified = []
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
