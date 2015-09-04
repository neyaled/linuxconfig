" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
vimoutliner/vimoutlinerrc	[[[1
41
"Extra mappings *****************************************************
"This mapping is fold-level and fold-state dependent 
"map <S-Down> dd p
"map <S-Up> dd <up>P

"Common Plugins
" This variable holds name of all VO modules you want to load. Do NOT use ru
" directly in this file, because you will get into many strange surprises. If
" you do not want to load any VO modules leave it blank (default).
let g:vo_modules_load = "checkbox"

" Uncomment the following line to enable hoisting.
"let g:vo_modules_load .= ':hoist'

" Uncomment the following line to enable smart_paste.
"let g:vo_modules_load .= ':smart_paste'

"User Preferences ***************************************************
"let maplocalleader = ",,"		" this is prepended to VO key mappings

"setlocal ignorecase			" searches ignore case
"setlocal smartcase			" searches use smart case
"setlocal wrapmargin=5
"setlocal tw=78
"setlocal tabstop=4			" tabstop and shiftwidth must match
"setlocal shiftwidth=4			" values from 2 to 8 work well
"setlocal background=dark		" for dark backgrounds
setlocal nowrap

"Hoisting ***********************************************************
"Uncomment and set to 1 to debug hoisting
"let g:hoistParanoia=0

"Custom Colors ******************************************************
" Uncomment this next line to force using VO on a light background
" colorscheme vo_light 
" Uncomment this next line to force using VO on a dark background
" colorscheme vo_dark 
" Or create your own color scheme. You can find sample files in Vim's 
" colors directory. There may even be a colors directory in your own
" $HOME/.vim directory.
doc/vo_cheatsheet.txt	[[[1
83
 *vo_cheatsheet.txt*  Last change: 2011-03-01 

VIMOUTLINER CHEAT SHEET~

This overview has Vimoutliner specific commands for the available operations. Remember that all Vim commands can be performed in Vimoutliner files. This is especially useful for copy, paste, moving around and similar commands.

For more extensive descriptions of command uses in Vimoutliner do ':h vo-command'. |vo-command|

List format explained: [command] [mode] [description]



CHECKBOXES~

,,cb  normal Insert a check box on the current line/range 
,,cx  normal Toggle check box state (percentage aware)
,,cd  normal Delete check boxes
,,c%  normal Create a check box with percentage placeholder
,,cp  normal Create a check box with percentage placeholder on all
headings
,,cz  normal Compute completion for the tree below the current
heading.


EXECUTABLE LINES~

,,e   normal   Execute the executable tag line under cursor


FOLDING~
         
,,1   all      set foldlevel=0
,,2   all      set foldlevel=1
,,3   all      set foldlevel=2
,,4   all      set foldlevel=3
,,5   all      set foldlevel=4
,,6   all      set foldlevel=5
,,7   all      set foldlevel=6
,,8   all      set foldlevel=7
,,9   all      set foldlevel=8
,,0   all      set foldlevel=99999


FORMATTING~

,,-   all      Draw dashed line
,,s   normal   Sort sub-tree under cursor ascending
,,S   normal   Sort sub-tree under cursor descending 
,,B   normal   Make body text start with a space
,,b   normal   Make body text start with a colon and space
>>    normal   Demote headline
<<    normal   Promote headline
<C-T>   insert   Demote headline
<C-D>   insert   Promote headline
Q     normal   Reformat (Synonym for gq)


OTHER~

,,f   normal   Directory listing of the current directory
,,w   insert   Save changes and return to insert mode
,,D   all      VimOutliner reserved command


TAGGING/INTEROUTLINE~

<C-K>   normal  Follow tag/interoutline (Synonym for Ctrl+])
<C-N>   normal  Return from tag (Synonym for Ctrl+T)


TIME AND DATE~

,,t   normal   Append timestamp (HH:MM:SS) to heading
,,T   normal   Pre-pend timestamp (HH:MM:SS) to heading
,,t   insert   Insert timestamp (HH:MM:SS) at cursor
,,d   normal   Append datestamp  (YYYY-MM-DD) to heading
,,d   insert   Insert datestamp  (YYYY-MM-DD) at cursor
,,D   normal   Pre-pend datestamp  (YYYY-MM-DD) to heading


  vim:set filetype=help textwidth=78:


doc/vo_readme.txt	[[[1
1327
*vo_readme.txt*	For Vim version 7.1	Last change: 2011 March 25

                                                                *vo* *vimoutliner*
The VimOutliner  0.3.6 ~

VimOutliner is an outline processor designed with lighting fast authoring as
the main feature, it also has many of the same features as Grandview, More,
Thinktank, Ecco, etc. These features include tree expand/collapse, tree
promotion/demotion, level sensitive colors, interoutline linking, checkboxes
and body text.


  License                                                       |vo-license|
  Version                                                       |vo-version|
  Installing and testing VimOutliner                            |vo-install|
      Automatic method                                     |vo-auto-install|
      Updating                                                 |vo-updating|
      Manual method                                      |vo-manual-install|
      Color schemes                                               |vo-color|
      Testing                                                   |vo-testing|
      Debian                                                     |vo-debian|
  Using VimOutliner on other file types                     |vo-other-files|
  Troubleshooting                                       |vo-troubleshooting|
  VimOutliner philosophy                                     |vo-philosophy|
  Running VimOutliner                                           |vo-running|
      Comma comma commands                                      |vo-command|
      Basic VimOutliner activities                           |vo-activities|
      Menu                                                         |vo-menu|
      Vim Outliner objects                                      |vo-objects|
      Post Processors                                   |vo-post-processors|
  Advanced                                                     |vo-advanced|
      Executable Lines                                 |vo-executable-lines|
  Plugins                                                       |vo-plugins|
      Checkboxes                                               |vo-checkbox|
      Hoisting                                                 |vo-hoisting|
  Scripts                                                       |vo-scripts|
      vo_maketags.pl                                           |vo-maketags|
      otl2html.py                                                 |otl2html|
  Other information                                          |vo-other-info|


==============================================================================
License                                                             *vo-license*


VimOutliner Copyright (C) 2001, 2003 by Steve Litt
            Copyright (C) 2004 by Noel Henson
Licensed under the GNU General Public License (GPL), version 2
Absolutely no warranty, see COPYING file for details.

If your distro doesn't come with this file
    HTML: http://www.gnu.org/copyleft/gpl.html
    Text: http://www.gnu.org/copyleft/gpl.txt


==============================================================================
Installing and Testing VimOutliner                                  *vo-install*


    Automatic Method                |vo-auto-install|
    Updating                        |vo-updating|
    Manual Method                   |vo-manual-install|
    Color Schemes                   |vo-colors|
    Testing                         |vo-testing|


                                                               *vo-auto-install*
Automatic Method~

The automatic installation targets Unix-compatible platforms: >

From tar archive

    $ tar xzvf vimoutliner-0.3.x.tar.gz
    $ cd vimoutliner
    $ sh install.sh

From zip archive 

    $ unzip vimoutliner-0.3.x.zip
    $ cd vimoutliner-0.3.x
    $ sh install.sh 

From vimball

Open vimoutliner-0.3.x.vba with Vim and type the following command to install in your home vim folder:

:so % 

<
The install.sh script will ask you whether to install the VimOutliner files or abort the
process leaving everything unchanged.  Assuming you confirmed the
installation, the script creates the necessary directory tree and copies the
files which provide the core functionality and documentation.

With the second question you decide whether you want to install some brand new
add-ons, currently implementing hoisting and checkboxes.

                                                                   *vo-updating*
Updating~

Updating an existing installation might require some manual work.

If you are already working with a previous VimOutliner release, there is a
slight chance that the current directory tree is different from your current
one. In this case, you will have to manually migrate your files to the new
locations.

The installation script creates unique backups of files being replaced with
newer versions. So if you put some local customisations into, say
$HOME/.vim/vimoutliner/vimoutlinerrc, you'll probably have to merge the backup
with the new file by hand.

                                                             *vo-manual-install*
Manual Method~

You can also copy the files from the unpacked distribution tarball into their
destination folders by yourself. The following steps are a description of what
has to go where and assume some knowledge of your vim setup.

If you encounter problems, please contact the mailinglist for an immediate
solution and more complete future documentation.  www.lists.vimoutliner.org

If you want to setup VimOutliner on a system running Microsoft Windows, the
directory $HOME denotes the base folder of the vim installation.  If you're on
Unix based system, the location of $HOME is as usual.

You need the following subtrees in your $HOME directory: >

    $HOME/.vim/
        doc/
        ftdetect/
        ftplugin/
        syntax/
        vimoutliner/
            plugins/
            scripts/
<
The distribution tarball unpacks into a directory vimoutliner with the
following contents: >

    vimoutliner/
        plugins/             (1)
        scripts/             (1)
    doc/                     (1)
    ftdetect/                (1)
    ftplugin/                (1)
    install.sh*
    syntax/                  (1)
    syntax/                  (1)
    vimoutlinerrc            (1)
<
(1) The content of these folders should be copied to their namesakes in the
$HOME/.vim folder

Your $HOME/.vimrc file should contain the lines >

     filetype plugin indent on
     syntax on
<
Finally, you need to integrate the online help provided with VimOutliner into
the vim help system.  Start vim and execute the following command: >
>
    :helptags $HOME/.vim/doc
<
At this point, VimOutliner should be functional.  Type ":help vo" to get
started. You can also type ":help vo_cheatsheet" to a get a quick overview of all
the VimOutliner commands.

                                                                      *vo-color*
Color Schemes~

Color schemes specify the colors Vim Outliner uses when displaying an outline.
Colors are specified by object and level.  These objects currently include:
headings, body text, pre- formatted body text, tables and others. See
|vo-objects| for more information.

Color scheme files are located in the system-wide vim colors directory and/or
your $HOME/.vim/colors directory. You can select from any of the provided
schemes. Vim Outliner internally includes a scheme the matches vo_light.vim.

To override the default color scheme you can edit these lines in your
$HOME/.vim/vimoutline/vimoutlinerrc file:
>
    "Custom Colors **********************************
    " Uncomment this next line to force using VO on
    " a light background
    " colorscheme vo_light
    " Uncomment this next line to force using VO on
    " a dark background
    " colorscheme vo_dark
<
To create your own scheme follow these simple steps:

1. Go to your $HOME/.vim/colors directory.  If you don't have one, create it.

2. Make a copy of one of the included schemes to use as a starting point. You
   should be able to find them in places like: $HOME/.vim/colors and
   /usr/share/vim/vim63/colors. Put the copy in your own colors directory
   ($HOME/.vim/colors)

3. Edit the scheme file to change whatever colors you wish.

4. Select the scheme in your $HOME/.vim/vimoutline/vimoutlinerrc file.  The
   line should look something like this:
>
       colorscheme noel
<
That's all there is to it.

                                                                    *vo-testing*
Testing Base Functionality~

Open a new outline with the following:
>
    rm $HOME/vo_test.otl
    gvim $HOME/vo_test.otl or vim $HOME/vo_test.otl
<
Verify the following:
- Tabs indent the text
- Different indent levels are different colors
- Lines starting with a colon and space word-wrap

  Lines starting with colons are body text. They should word wrap and
  should be a special color (typically green, but it can vary). Verify
  that paragraphs of body text can be reformatted with the Vim gq
  commands.

Verify Interoutline Linking:

Interoutline linking currently requires a working perl installation to
generate the necessary tag file. We are looking into porting this to vim's own
scripting language.

Place the following two lines in $HOME/vo_test.otl:
>
    _tag_newfile
        $HOME/vo_newfile.otl
<
Note that in the preceding, the 2nd line should be indented from the first.

To create VimOutliner's tag file $HOME/.vim/vimoutliner/vo_tags.tag, run
vo_maketags.pl, which resides in $HOME/.vimoutliner/scripts/: $
$HOME/.vim/vimoutliner/scripts/vo_maketags.pl $HOME/vo_test.otl

Try the following:
- In $HOME/vo_test.otl
- Cursor to the _tag_newfile marker
- Press CTRL-K
    You should be brought to $HOME/vo_newfile.otl
- Press CTRL-N
    You should be brought back to $HOME/vo_test.otl
Note:
    CTRL-K is a VimOutliner synonym for CTRL-]
    CTRL-N is a VimOutliner synonym for CTRL-T

                                                                     *vo-debian*
Debian Installation~

Debian does include Vim Outliner as a package. However some Debian version
require this line to be added to your .vimrc file: >

    syntax on
>

==============================================================================
Using VimOutliner On Other File Types                           *vo-other-files*

How to use VimOutliner on non .otl files~

Previous VimOutliner versions used the ol script to invoke VimOutliner. As of
VimOutliner 0.3.0, the ol script is no longer necessary nor provided. Instead,
VimOutliner is now a Vim plugin, so Vim does all the work.

This makes VimOutliner much simpler to use in most cases, but Vim plugins are
file extension based, meaning that if you want to use VimOutliner on a file
extension other than .otl, you must declare that file extension in
$HOME/.vim/ftdetect/vo_base.vim. In this section we'll use the .emdl extension
(Easy Menu Definition Language) as an example.

To enable VimOutliner work with .emdl files, do this:
>
    vim $HOME/.vim/ftdetect/vo_base.vim
<
Right below the line reading:
>
    au! BufRead,BufNewFile *.otl    setfiletype vo_base
<
Insert the following line:
>
    au! BufRead,BufNewFile *.emdl   setfiletype vo_base
<
Save and exit
>
    gvim $HOME/vo_test.emdl
<
You should get:
- level colors,
- body text (lines starting with colon)
- comma comma commands (try ,,2 and ,,1)


==============================================================================
Troubleshooting                                             *vo-troubleshooting*


Q: I can't switch between colon based and space based body text.
A: See next question

Q: My ,,b and ,,B don't do anything. How do I fix it?
A: Open vim like this:
>
      vim $HOME/.vim/ftplugin/vo_base.vim
<
   Search for use_space_colon
   Make sure it is set to 0, not 1
   Rerun Vim, and ,,b and ,,B should work

Q: I don't get VimOutliner features on files of extension .whatever.
A: Open vim like this:
>
      vim $HOME/.vim/ftdetect/vo_base.vim
<
   Right below the line reading:
>
      au! BufRead,BufNewFile *.otl          setfiletype vo_base
<
   Insert the following line:
>
      au! BufRead,BufNewFile *.whatever     setfiletype vo_base
<
   Save and exit.


==============================================================================
VimOutliner Philosophy                                           *vo-philosophy*


Authoring Speed~

VimOutliner is an outline processor with many of the same features as
Grandview, More, Thinktank, Ecco, etc. Features include tree expand/collapse,
tree promotion/demotion, level sensitive colors, interoutline linking, and
body text.

What sets VimOutliner apart from the rest is that it's been constructed from
the ground up for fast and easy authoring.  Keystrokes are quick and easy,
especially for someone knowing the Vim editor. The mouse is completely
unnecessary (but is supported to the extent that Vim supports the mouse). Many
of the VimOutliner commands start with a double comma because that's very
quick to type.

Many outliners are prettier than VimOutliner. Most other outliners are more
intuitive for the newbie not knowing Vim. Many outliners are more featureful
than VimOutliner (although VimOutliner gains features monthly and is already
very powerful).  Some outliners are faster on lookup than VimOutliner. But as
far as we know, NO outliner is faster at getting information out of your mind
and into an outline than VimOutliner.

VimOutliner will always give you lightning fast authoring. That's our basic,
underlying philosophy, and will never change, no matter what features are
added.


Vim Integration~

Earlier VimOutliner versions prided themselves on being standalone
applications, self-contained in a single directory with a special script to
run everything.

As of 0.3.0, VimOutliner is packaged as a Vim Plugin, eliminating the need for
the ol script, which many saw as clumsy. Given that all VimOutliner features
are produced by the Vim engine, it makes perfect sense to admit that
VimOutliner is an add-on to Vim.

Therefore VimOutliner now prides itself in being a Vim plugin.  With the
VimOutliner package installed, the Vim editor yields the VimOutliner feature
set for files whose extensions are listed as vo_base types in
$HOME/.vim/ftplugin/vo_base.vim.

The Vim Plugin philosophy yields several benefits:
- Less reliance on Perl, bash and environment vars
- (upcoming) Portability between Linux, Windows and Mac
- (upcoming) Installation via Vim script


==============================================================================
Running VimOutliner                                                 *vo-running*


Vim Knowledge~

You needn't be a Vim expert to use VimOutliner. If you know the basics --
inserting and deleting linewise and characterwise, moving between command and
insert modes, use of Visual Mode selections,and reformatting, you should be
well equipped to use VimOutliner.

Run Vim or GVim and follow the instruction on :help |tutor|

VimOutliner is a set of Vim scripts and configurations. Its features all come
from the Vim editor's engine. If you do not know Vim, you'll need to learn the
Vim basics before using VimOutliner.  Start by taking the Vim tutorial. The
tutorial should take about 2 hours.

VimOutliner is so fast, that if you often use outlining, you'll make up that
time within a week.

                                                                    *vo-command*
Comma Comma Commands~

For maximum authoring speed, VimOutliner features are accessed through
keyboard commands starting with 2 commas.  The double comma followed by a
character is incredibly fast to type.

We expect to create more comma comma commands, so try not to create your own,
as they may clash with later comma comma commands. If you have an
exceptionally handy command, please report it to the VimOutliner list. Perhaps
others could benefit from it.

    Command   List     Description ~
        ,,D   all      VimOutliner reserved command
        ,,H   all      reserved for manual de-hoisting (add-on)
        ,,h   all      reserved for hoisting (add-on)
        ,,1   all      set foldlevel=0
        ,,2   all      set foldlevel=1
        ,,3   all      set foldlevel=2
        ,,4   all      set foldlevel=3
        ,,5   all      set foldlevel=4
        ,,6   all      set foldlevel=5
        ,,7   all      set foldlevel=6
        ,,8   all      set foldlevel=7
        ,,9   all      set foldlevel=8
        ,,0   all      set foldlevel=99999
        ,,-   all      Draw dashed line
        ,,f   normal   Directory listing of the current directory
        ,,s   normal   Sort sub-tree under cursor ascending
        ,,S   normal   Sort sub-tree under cursor descending
        ,,t   normal   Append timestamp (HH:MM:SS) to heading
        ,,T   normal   Pre-pend timestamp (HH:MM:SS) to heading
        ,,T   normal   Pre-pend timestamp (HH:MM:SS) to heading
        ,,t   insert   Insert timestamp (HH:MM:SS) at cursor
        ,,d   normal   Append datestamp  (YYYY-MM-DD) to heading
        ,,d   insert   Insert datestamp  (YYYY-MM-DD) at cursor
        ,,D   normal   Pre-pend datestamp  (YYYY-MM-DD) to heading
        ,,B   normal   Make body text start with a space
        ,,b   normal   Make body text start with a colon and space
        ,,w   insert   Save changes and return to insert mode
        ,,e   normal   Execute the executable tag line under cursor


Other VimOutliner Commands~

Naturally, almost all Vim commands work in VimOutliner.  Additionally,
VimOutliner adds a few extra commands besides the comma comma commands
discussed previously.

Command list:
    CTRL-K        Follow tag (Synonym for CTRL-])
    CTRL-N        Return from tag (Synonym for CTRL-T)
    Q             Reformat (Synonym for gq)


To get a quick overview of all VimOutliner commands type ":help vo_cheatsheet" in vim.

                                                                 *vo-activities*
Basic VimOutliner activities~

How do I collapse a tree within command mode?
    zc
    (note: a full list of folding commands |fold-commands|)

How do I expand a tree within command mode?
    To expand one level:
        zo
    To expand all the way down
        zO

How do I demote a headline?
    In command mode, >>
    In insert mode at start of the line, press the Tab key
    In insert mode within the headline, CTRL-T

How do I promote a headline?
    In command mode, <<
    In insert mode at start of the line, press the Backspace key
    In insert mode within the headline, CTRL-D

How do I promote or demote several consecutive headlines?
    Highlight the lines with the V command
    Press < to promote or > to demote. You can precede
    the < or > with a count to promote or demote several levels

How do I promote or demote an entire tree?
    Collapse the tree
    Use << or >> as appropriate

How do I collapse an entire outline?
    ,,1

How do I maximally expand an entire outline?
    ,,0

How do I expand an outline down to the third level?
    ,,3

How do I move a tree?
    Use Vim's visual cut and paste

How do I create body text?
    Open a blank line below a headline
    Start the line with a colon followed by a space
    Continue to type. Your text will wrap

How do I reformat body text?
    Highlight (Shift+V) the body text to be reformatted
    Use the gq command to reformat

How do I reformat one paragraph of body text?
    The safest way is highlighting.
        DANGER! Other methods can reformat genuine headlines.

How do I switch between colon based and space based body text?
    ,,b for colon based, ,,B for space based

What if ,,b and ,,B don't work
    Change variable use_space_colon from 1 to 0
        in $HOME/.vim/ftplugin/vo_base.vim

How do I perform a wordcount?
    Use the command :w !wc
        The space before the exclamation point is a MUST.

                                                                       *vo-menu*
Menu~

There is a simple menu included in Vim Outliner when running in GUI mode.
Named 'VO', you can usually find it right next to the 'Help' menu. There are
commands to change the fold level and select alternate color schemes. There is
also entries for common tools.

The last tool item calls a shell script, 'myotl2html.sh'. This script should
be provided by the user and is not included in VO releases. A sample
myotl2html.sh script might look like this:
>
    #!/bin/bash
    otl2html.py -S pjtstat.css $1 > $HOME/public_html/$1.html
<
If you have several different types of reports you create regularly, you can
create your own menu entries. Just add lines like these to your
~/.vimoutlinerrc file: >
>
    amenu &VO.&Reports.&Big\ Project :!otl2html.py -S big.css % > %.html
    amenu &VO.&Reports.&Hot\ List :!otl2html.py -S todo.css % > %.html
    amenu &VO.&Reports.&Weekly :!otl2html.py -S weekly.css % > %.html
<
I'm sure you get the idea.

                                                                    *vo-objects*
Vim Outliner Objects~

There are several object/line types that VO supports. The most common on
simple headings and body text. Simple headings are tab-indented line that
start with any non-whitespace character except: : ; | < >.  These characters
specify other objects. Here is a list of each of the non-heading types:

    Start    Description~
      :      body text (wrapping)
      ;      preformatted body text (non-wrapping)
      |      table
      >      user-defined, text block (wrapping)
      <      user-defined, preformatted text block (non-wrapping)

The body text marker, :, is used to specify lines that are automatically
wrapped and reformatted. VO and post-processors are free to wrap and reformat
this text as well as use proportionally- spaced fonts. A post-processor will
probably change the appearance of what you have written. If you are writing a
book or other document, most of the information you enter will be body text.

Here is an example:
>
    Kirby the Wonder Dog
    	: Kirby is nine years old. He understand about 70-100
	: English words. Kirby also understands 11 different hand
	: signals. He is affectionate, playful and attentive.
	:
	: His breeding is unknown. He appears to be a mix between
	: a german shepherd and a collie.
<
When folded, body text looks something like this:
>
    Kirby the Wonder Dog
	[TEXT] -------------------------------- (6 lines)
<
The preformatted text marker, ;, is used to mark text that should not be
reformatted nor wrapped by VO or any post-processor. A post- processor would
use a fixed-space font, like courier, to render these lines. A post-processor
will probably not change the appearance of what you have written. This is
useful for making text picture, program code or other format-dependent text.

Here is an example:
>
    Output waveform
	;         _______                ______
	;   _____/       \______________/
	;        |-10us--|----35us------|
<
When folded, preformatted body text looks something like this:
>
    Output waveform
	[TEXT BLOCK] -------------------------- (6 lines)
<
The table marker, |, is used to create tables. This is an excellent way to
show tabular data. The marker is used as if it were are real vertical line. A
|| (double-|) is optionally used to mark a table heading line. This is useful
for post-processors.

Here is an example:
>
	Pets
		|| Name  | Age | Animal | Inside/Outside |
		| Kirby  |   9 |    dog |           both |
		| Hoover |   1 |    dog |           both |
		| Sophia |   9 |    cat |         inside |
<
There is no automatic alignment of columns yet. It must be done manually. The
post-processor, otl2thml.py, does have alignment functions. See its
documentation for more information.

When folded, a table looks something like this:
>
    Pets
	[TABLE] ------------------------------- (4 lines)
<
User-defined text is similar to body text but more flexible and it's use is
not pre-defined by Vim Outliner. The basic, user-defined text block marker, >,
behaves just like body text.

For example:
>
    Kirby the Wonder Dog
    	> Kirby is nine years old. He understand about 70-100
	> English words. Kirby also understands 11 different hand
	> signals. He is affectionate, playful and attentive.
	>
	> His breeding is unknown. He appears to be a mix between
	> a german shepherd and a collie.
<
When folded, body text looks something like this:
>
    Kirby the Wonder Dog
	[USER] -------------------------------- (6 lines)
<
But unlike body text, user-defined text can be expanded. You could have
user-defined text types. If you were writing a book, in addition to body text
for paragraphs you might need special paragraphs for tips and warnings.
User-defined text blocks can accomplish this:
>
	>Tips
	> Don't forget to back up your computer daily. You don't
	> need to back up the entire computer. You just need to
	> backup up the files that have changed.
	>Warning
	>Never store you backup floppy disks on the side of you
	>file cabinets by adhering them with magnets.
<
A post processor will know how to remove the style tags (Tips and Warning) and
you want the text to be formatted.

When folded, the above would appear as:
>
	[USER Tips] --------------------------- (4 lines)
	[USER Warning]------------------------- (3 lines)
<
The user-defined, preformatted text block marker, <, behaves just like
preformatted text. But like >, it leaves the functional definition up to the
user. A simple user-defined, preformatted text block could be:
>
    Tux
	<                 _.._
	<              .-'    `-.
	<             :          ;
	<             ; ,_    _, ;
	<             : \{"  "}/ :
	<            ,'.'"=..=''.'.
	<           ; / \      / \ ;
	<         .' ;   '.__.'   ; '.
	<      .-' .'              '. '-.
	<    .'   ;                  ;   '.
	<   /    /                    \    \
	<  ;    ;                      ;    ;
	<  ;   `-._                  _.-'   ;
	<   ;      ""--.        .--""      ;
	<    '.    _    ;      ;    _    .'
	<    {""..' '._.-.    .-._.' '..""}
	<     \           ;  ;           /
	<      :         :    :         :
	<      :         :.__.:         :
	<       \       /"-..-"\       /    fsc
	<        '-.__.'        '.__.-'
<
When folded it would be:
>
    Tux
	[USER BLOCK] -------------------------- (6 lines)
<
Like user-defined text, these blocks can be given user-defined styles. For
example:
>
	<ASCIIart
	<                 _.._
	<              .-'    `-.
	<             :          ;
	<             ; ,_    _, ;
	<             : \{"  "}/ :
	<            ,'.'"=..=''.'.
	<           ; / \      / \ ;
	<         .' ;   '.__.'   ; '.
	<      .-' .'              '. '-.
	<    .'   ;                  ;   '.
	<   /    /                    \    \
	<  ;    ;                      ;    ;
	<  ;   `-._                  _.-'   ;
	<   ;      ""--.        .--""      ;
	<    '.    _    ;      ;    _    .'
	<    {""..' '._.-.    .-._.' '..""}
	<     \           ;  ;           /
	<      :         :    :         :
	<      :         :.__.:         :
	<       \       /"-..-"\       /    fsc
	<        '-.__.'        '.__.-'
	<Code
	< getRXDN macro
	<
	< 	local	gRXD1, gRXD2
	< 	bcf	STATUS,C
	< 	btfsc	FLAGS,SERPOL
	<
	< 	goto	gRXD1
	< 	btfsc	RXDN
	< 	bsf	STATUS,C
	< 	goto	gRXD2
	<
	< gRXD1	btfss	RXDN
	< 	bsf	STATUS,C
	< 	nop
	< gRXD2
	< 	endm
<
When folded, the above would appear as:
>
	[USER BLOCK ASCIIart] ----------------- (22 lines)
	[USER BLOCK Code] --------------------- (17 lines)
<

                                                            *vo-post-processors*
VimOutliner Post-Processors~

There are already serveral post processors for Vim Outliner. Some are general
purpose in nature and others perform specific conversions. There are several of 
the tested scripts now included in the $HOME/.vim/vimoutliner/scripts folder.
See also the scripts section.                                   |vo-scripts|

For overview of several of the scripts on the web see:
        https://sites.google.com/site/vimoutlinerinfo/scripts-for-vimoutliner


==============================================================================
Advanced VimOutliner                                               *vo-advanced*

                                                           *vo-executable-lines*
Executable Lines~

Executable lines enable you to launch any command from a specially constructed
headline within VimOutliner. The line must be constructed like this:
>
    Description _exe_ command
<
Here's an example to pull up Troubleshooters.Com:
>
    Troubleshooters.Com _exe_ mozilla http://www.troubleshooters.com
<
Executable lines offer the huge benefit of a single-source knowledge tree,
where all your knowledge, no matter what its format, exists within a single
tree of outlines connected with inter-outline links and executable lines.


==============================================================================
Plugins                                                             *vo-plugins*


The VimOutliner distribution currently includes two plugins for easy handling
of checkboxes, hoisting (see below) and smart paste. 

The checkboxes plugin is enables by default. The hoisting and smart paste plugin are disabled by default.
To enable these look for the easy instructions for this in your $HOME/.vimoutlinerrc file.

More information below and in the plugin files in the $HOME/.vim/vimoutliner/plugin folder.

                                                                   *vo-checkbox*
Checkboxes~

Checkboxes enable VimOutliner to understand tasks and calculate the current
status of todo-lists etc. Three special notations are used:
>
    [_]     an unchecked item or incomplete task
    [X]     a checked item or complete task
    %       a placeholder for percentage of completion
<
Several ,,-commands make up the user interface:
>
    ,,cb  Insert a check box on the current line or each line of the currently
          selected range (including lines in selected but closed folds). This
          command is currently not aware of body text. Automatic recalculation
          of is performed for the entire root-parent branch that contains the
          updated child. (see ,,cz)
    ,,cx  Toggle check box state (percentage aware)
    ,,cd  Delete check boxes
    ,,c%  Create a check box with percentage placeholder except on childless
          parents
    ,,cp  Create a check box with percentage placeholder on all headings
    ,,cz  Compute completion for the tree below the current heading.
<
How do I use it?

Start with a simple example. Let's start planning a small party, say a barbeque.

1. Make the initial outline.
>
    Barbeque
        Guests
            Bill and Barb
            Larry and Louise
            Marty and Mary
            Chris and Christine
            David and Darla
            Noel and Susan
        Food
            Chicken
            Ribs
            Corn on the cob
            Salad
            Desert
        Beverages
            Soda
            Iced Tea
            Beer
        Party Favors
            Squirt guns
            Hats
            Name tags
        Materials
            Paper Plates
            Napkins
            Trash Containers
<

2. Add the check boxes.

This can be done by visually selecting them and typing ,,cb.  When done, you
should see this:
>
    [_] Barbeque
        [_] Guests
            [_] Bill and Barb
            [_] Larry and Louise
            [_] Marty and Mary
            [_] Chris and Christine
            [_] David and Darla
            [_] Noel and Susan
        [_] Food
            [_] Chicken
            [_] Ribs
            [_] Corn on the cob
            [_] Salad
            [_] Desert
        [_] Beverages
            [_] Soda
            [_] Iced Tea
            [_] Beer
        [_] Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] Materials
            [_] Paper Plates
            [_] Napkins
            [_] Trash Containers
<

3. Now check off what's done.

Checking off what is complete is easy with the
,,cx command.  Just place the cursor on a heading and ,,cx it. Now you can see
what's done as long as the outline is fully expanded.
>
    [_] Barbeque
        [_] Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

4. Now summarize what's done.

You can summarize what is done with the ,,cz command.  Place the cursor on the
'Barbeque' heading and ,,cz it.  The command will recursively process the
outline and update the check boxes of the parent headlines. You should see:
(Note: the only change is on the 'Guests' heading. It changed because all of
its children are complete.)
>
    [_] Barbeque
        [X] Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

5. Add percentages for a better view.

You can get a much better view of what's going on, especially with collapsed
headings, if you add percentages.  Place a % on each heading that has children
like this:
>
    [_] % Barbeque
        [X] % Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] % Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] % Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] % Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] % Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

6. Now compute the percentage of completion.

After adding the % symbols, place the cursor on the 'Barbeque' heading and
execute ,,cz as before. Keep in mind that the recursive percentages are
weighted. You should see:
>
    [_] 58% Barbeque
        [X] 100% Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] 60% Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] 66% Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] 0% Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] 66% Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

7. Complete a few more just for fun.

Mark Salad and Soda and you should see the ouline below.  Try plaing around
with zc and zo to see the effects of opening and closing folds. Even if you
place the cursor on 'Barbeque' and zo it, you still have a good understanding
of how complete the project is.
>
    [_] 69% Barbeque
        [X] 100% Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] 80% Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [X] Salad
            [X] Desert
        [X] 100% Beverages
            [X] Soda
            [X] Iced Tea
            [X] Beer
        [_] 0% Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] 66% Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<
                                                                   *vo-hoisting*
Hoisting~

NOTE: THIS PLUGIN IS NOT FINISHED AND MIGHT CAUSE DATA LOSS!!! USE IT AT YOUR
OWN RISK. This plugin is disabled by default.

Hoisting is a way to focus on the offspring of the currently selected outline
item. The subitems will be presented as top level items in the automatically
extracted hoist-file located in the same directory as the main outline file.
You cannot hoist parts of an already hoisted file again.

To enable this plugin uncomment the following line in
 ~/.vimoutlinerrc:
>
    "let g:vo_modules_load .= ':hoist'
<
Once it is enabled, you hoist the subtopics of the currently selected
item with

    ,,h   Hoist the subtopics into a temporary file

The changes are merged back into the original file by closing the temporary
hoist file with

    :q  :wq  :x  ZZ

If something went wrong, you can perform a manual de-hoisting with the
following procedure:

Open the main file in VimOutliner Search for the line containing the __hoist
tag On this line, do

    ,,H    Manual de-hoisting


==============================================================================
Scripts                                                             *vo-scripts*


The VimOutliner distribution currently includes several useful  external scripts to
support interoutline links, HTML export and more. All scripts are included in your 
$HOME/.vim/vimoutliner/scripts folder. For more information on these scripts see 
usage section in the scripts. You can also find several of these scripts on this web site
with links to their specific web site:
       https://sites.google.com/site/vimoutlinerinfo/scripts-for-vimoutliner 


Information on some of the scripts

vo_maketags.pl                                                     *vo-maketags*

A basic description of how to use this Perl script is given in section
|vo-testing|, subsection "Verify interoutline linking".

otl2html.py                                                           *otl2html*

This Python script transforms an outline into an HTML file. Use $ otl2html.py
--help to get detailed information.

This script does not adhere to the VimOutliner naming convention with the
'vo_' prefix because it is not necessary for any VimOutliner functionality. It
is provided both as a useful tool for creating HTML pages and HTML slides from
outlines and as a working demonstration of how to convert .otl files to other
formats.


==============================================================================
Other Information                                                *vo-other-info*


The VimOutliner Project~

- How do I add my own features?
Two ways -- by changing VimOutliner source code, or by inserting your own code
in $HOME/.vimoutlinerrc, which runs at the end of the VimOutliner startup
scripts. You might have to merge your personal .vimoutlinerrc with future
versions to take advantage of new features.

- How is VimOutliner licensed?
VimOutliner is licensed under the GNU General Public License.

- How do I contribute to VimOutliner
Step 1 is to subscribe to our mailing list. Join up at
http://www.lists.vimoutliner.org/. Lurk for a few days or so to get the feel,
then submit your idea/suggestion. A lively discussion will ensue, after which
your idea, probably in some modified form, will be considered. The more of the
actual work you have done, the more likely your feature will go in the
distribution in a timely manner.


- What's with the VimOutliner file names?
All VimOutliner files must begin with vo_ unless Vim itself requires them to
have a different name. A few older files from previous versions break this
rule, but over time these will be changed to our naming convention.

In the old days, with the "self contained" philosophy, there was no naming
convention, because VimOutliner files were segregated into their own tree.
With the coming of the "vim plugin" philosophy, there's a need to identify
VimOutliner files for purposes of modification, upgrade and de-installation.
Hence our naming convention.

- What if my feature doesn't make it into the VimOutliner distribution?
You can offer it on your own website, or very possibly on
to the forthcoming new VimOutliner home page  VimOutliner ships with its
core features, but many additional functionalities, especially those that
operate from Perl scripts (or bash or python) are available outside the
distro. For instance, right now there's an Executable Line feature that turns
VimOutliner into a true single tree information reservoir. The Executable Line
feature is available extra-distro on the VimOutliner home page. See also the
scripts included in the $HOME/.vim/vimoutliner/scripts folder.


Anticipated improvements in later versions~

Command-invoking headlines
    Already prototyped
    Probably coming next version
    Allows you to press a key and get an html command in a browser
    Enables a true single tree knowledge collection
    Enables use of VimOutliner as a shell

Groupware
    Not yet well defined
    Enables collaborative work on an outline
    A pipedream, but VimOutliner itself was once a pipedream

Easy mode
    Let's Windows users operate VO like a common insert-only editor. This will
    remove a great deal of VO's keyboarder- friendly features. But then,
    they're Windows users: let them use the mouse.

Headline to headline links
    Not yet sanctioned, might never be implemented If implemented, this would
    presumably create links not just between outlines, but between headlines,
    either in the same outline or in a different one. This would be a start on
    "neural networking".

Headline numbering
    Under feasibility investigation
    Supported by external scripts

Toolbar in gvim
    Under feasibility investigation


Further information on outlines, outline processing and outliners~

http://freshmeat.net/projects/vimoutliner
Main distribution website

https://github.com/vimoutliner/vimoutliner
git repository

http://www.troubleshooters.com/projects/alt-vimoutliner-litt/
Preliminary main web site with links to other sites

http://www.troubleshooters.com/tpromag/199911/199911.htm
Outlining discussion, not product specific

http://www.troubleshooters.com/linux/olvim.htm
Discussion on how to use Vim for outlining

http://www.troubleshooters.com/projects/vimoutliner.htm
Former Webpage for the VimOutliner distro

http://www.outliners.com
Discussion of (proprietary) outliners from days gone by.
Downloads for ancient versions of such outliners.
Unfortunately, all are dos, windows and mac.

http://members.ozemail.com.au/~caveman/Creative/Software/Inspiration/index.html
Discussion of (proprietary,Mac) Inspiration software
This page discusses many methods of thought/computer interaction:
    Visual Outlining
    Textual Outlining
    Idea mapping
    Mind Mapping
    Brainstorming with Rapid Fire Entry
    Concept Mapping
    Storyboarding
    Diagrams (using rich symbol library)

http://members.ozemail.com.au/~caveman/Creative/index.html
Not about outlines, but instead about how to use your brain.
The whole purpose of outlines is to use your brain.
New ways of using your brain produce new ways to use outlines.

==============================================================================
                                                                    *vo-history*
Change Log                                                          *vo-version*

Version 0.3.6
Released 2011-05-08
	* Additions/Changes:~
	- Added updated comments and information to the user in the INSTALL
	  file.
	- Added comments and information to the user in install.sh to align
	  with the new version.
	- Added new light version of README and moved the more extensive file
	  to README.detailed
	- Several updates and additions to the README, README.detailed and
	  doc/vo_readme.txt file.

	* Bug fixes:~
	- Source only the first vimoutlinerrc found.
	- Do not echo mappings.
	- Fixed typo and updated reference in install.sh.
	- Fixed several typos and updated reference in the
	  ftplugin/vo_base.vim
	- Fixed typos and removed outdated references in the vo_hoist.otl and
	  vo_hoist.vim files.
	- Fixed typos and removed outdated references in the vo_checkbox.otl
	  file.
	- Fixed two mappings for sourcing rc file and writing file in
	  ftplugin/vo_base.vim. 
	- Fixed typos in colors/vo_base.vim
	- Fixed errors when g:vo_modules_load is not defined, also updated the
	  plugin loading process to use lists.

Version 0.3.5
Released 2011-03-20
	* Additions/Changes:~
	- Moved all files inside $HOME/.vim.
	- Added a cheat sheet to the documentation.
	- Added smart-paste plugin.
	- Added and updated post-processor scripts:
		· fs2otl
		· Node.pm
		· otl2aft.awk
		· otl2docbook.pl
		· otl2html.py
		· otl2lyx.awk
		· otl2ooimpress.py
		· otl2table.py
		· otl2tags.py
		· otlgrep.py
		· otlhead.sh
		· otlsplit.py
		· otltail.sh
		· otl_handler
		· outline_calendar
		· outline_freemind
		· vo_maketags.pl
	- Added syntax support for _ilink_.
	- Hoist plugin disabled by default.
	- Layout of vo_readme.txt made more similar to Vim help.

	* Bug fixes:~
	- ,,S did not work. Fixed

Version 0.3.4
Released
	* Additions/changes:~
	- added ,,cp as an alias to ,,c%
	- Color schemes have been added
	- Checkboxes and hoisting default to 'on'
	- Modified ,,cb and ,,c% (and ,,cp) to work only on headings
	- Fixed the ,,cz command to make the correct call
	- Added descriptions of VO objects to help (headings, text, tables, etc.)

	* Bug fixes:~
	- W18 errors have been fixed


 vim:set filetype=help textwidth=78:

ftplugin/vo_base.vim	[[[1
689
"#########################################################################
"# ftplugin/vo_base.vim: VimOutliner functions, commands and settings
"# version 0.3.6
"#   Copyright (C) 2001,2003 by Steve Litt (slitt@troubleshooters.com)
"#   Copyright (C) 2004 by Noel Henson (noel@noels-lab.com)
"#
"#   This program is free software; you can redistribute it and/or modify
"#   it under the terms of the GNU General Public License as published by
"#   the Free Software Foundation; either version 2 of the License, or
"#   (at your option) any later version.
"#
"#   This program is distributed in the hope that it will be useful,
"#   but WITHOUT ANY WARRANTY; without even the implied warranty of
"#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"#   GNU General Public License for more details.
"#
"#   You should have received a copy of the GNU General Public License
"#   along with this program; if not, write to the Free Software
"#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
"#
"# Steve Litt, slitt@troubleshooters.com, http://www.troubleshooters.com
"#########################################################################

" HISTORY {{{1
"#########################################################################
"#  V0.1.0 Pre-alpha
"#      Set of outliner friendly settings
"# Steve Litt, 5/28/2001
"# End of version 0.1.0
"# 
"#  V0.1.1 Pre-alpha
"#      No change
"# 
"# Steve Litt, 5/28/2001
"# End of version 0.1.1
"# 
"#  V0.1.2 Pre-alpha
"# 	No Change
"# Steve Litt, 5/30/2001
"# End of version 0.1.2
"#  V0.1.3 Pre-alpha
"# 	No Change
"# Steve Litt, 5/30/2001
"# End of version 0.1.3
"#  V0.2.0 
"# 	Noel Henson adds code for outliner-friendly expand and
"# 	collapse, comma comma commands, color coding, hooks for a
"# 	spellchecker, sorting, and date insertion.
"# Noel Henson, 11/24/2002
"# End of version 0.2.0
"# 
"# All other history in the CHANGELOG file.
"# END OF HISTORY
"# 
"#########################################################################


" Load the plugin {{{1
" Prevent the plugin from being loaded twice
"if exists("b:did_ftplugin")
"  finish
"endif
"let b:did_ftplugin = 1
let b:current_syntax = "outliner"

" User Preferences {{{1

let maplocalleader = ",,"		" this is prepended to VO key mappings

setlocal ignorecase			" searches ignore case
setlocal smartcase			" searches use smart case

let use_space_colon=0

" End User Preferences

" VimOutliner Standard Settings {{{1
setlocal autoindent	
setlocal backspace=2
setlocal wrapmargin=5
setlocal wrap!
setlocal tw=78
setlocal noexpandtab
setlocal nosmarttab
setlocal softtabstop=0 
setlocal foldlevel=20
setlocal foldcolumn=1		" turns on "+" at the beginning of close folds
setlocal tabstop=4			" tabstop and shiftwidth must match
setlocal shiftwidth=4		" values from 2 to 8 work well
setlocal foldmethod=expr
setlocal foldexpr=MyFoldLevel(v:lnum)
setlocal indentexpr=
setlocal nocindent
setlocal iskeyword=@,39,45,48-57,_,129-255

" Vim Outliner Functions {{{1

if !exists("loaded_vimoutliner_functions")
let loaded_vimoutliner_functions=1

" Sorting {{{2 
" IsParent(line) {{{3
" Return 1 if this line is a parent
function! IsParent(line)
	return (Ind(a:line)+1) == Ind(a:line+1)
endfunction
"}}}3
" FindParent(line) {{{3
" Return line if parent, parent line if not
function! FindParent(line)
	if IsParent(a:line)
		return a:line
	else
		let l:parentindent = Ind(a:line)-1
		let l:searchline = a:line
		while (Ind(l:searchline) != l:parentindent) && (l:searchline > 0)
			let l:searchline = l:searchline-1
		endwhile
		return l:searchline
	endif
endfunction
"}}}3
" FindLastChild(line) {{{3
" Return the line number of the last decendent of parent line
function! FindLastChild(line)
	let l:parentindent = Ind(a:line)
	let l:searchline = a:line+1
	while Ind(l:searchline) > l:parentindent
		let l:searchline = l:searchline+1
	endwhile
	return l:searchline-1
endfunction
"}}}3
" MoveDown() {{{3
" Move a heading down by one
" Used for sorts and reordering of headings
function! MoveDown()
	call cursor(line("."),0)
	del x
	put x
endfunction
"}}}3
" DelHead() {{{3
" Delete a heading
" Used for sorts and reordering of headings
function! DelHead(line)
	let l:fstart = foldclosed(a:line)
	if l:fstart == -1
		let l:execstr = a:line . "del x"
	else
		let l:fend = foldclosedend(a:line)
		let l:execstr = l:fstart . "," . l:fend . "del x"
	endif
	exec l:execstr
endfunction
" PutHead() {{{3
" Put a heading
" Used for sorts and reordering of headings
function! PutHead(line)
	let l:fstart = foldclosed(a:line)
	if l:fstart == -1
		let l:execstr = a:line . "put x"
		exec l:execstr
	else
		let l:fend = foldclosedend(a:line)
		let l:execstr = l:fend . "put x"
		exec l:execstr
	endif
endfunction
"}}}3
" NextHead(line) {{{3
" Return line of next heading
" Used for sorts and reordering of headings
function! NextHead(line)
	let l:fend = foldclosedend(a:line)
	if l:fend == -1
		return a:line+1
	else
		return l:fend+1
	endif
endfunction
"}}}3
" CompHead(line) {{{3
" Compare this heading and the next
" Return 1: next is greater, 0 next is same, -1 next is less
function! CompHead(line)
	let nexthead = NextHead(a:line)
	let l:thisline=getline(a:line)
	let l:nextline=getline(nexthead)
	if indent(a:line) != indent(nexthead)
		return 0
	elseif l:thisline <# l:nextline
		return 1
	elseif l:thisline ># l:nextline
		return -1
	else
		return 0
	endif
endfunction

"}}}3
" Sort1Line(line) {{{3
" Compare this heading and the next and swap if out of order
" Dir is 0 for forward, 1 for reverse
" Return a 1 if a change was made 
function! Sort1Line(line,dir)
	if (CompHead(a:line) == -1) && (a:dir == 0)
		call DelHead(a:line)
		call PutHead(a:line)
		return 1
	elseif (CompHead(a:line) == 1) && (a:dir == 1)
		call DelHead(a:line)
		call PutHead(a:line)
		return 1
	else
		return 0
	endif
endfunction
"}}}3
" Sort1Pass(start,end,dir) {{{3
" Compare this heading and the next and swap if out of order
" Dir is 0 for forward, 1 for reverse
" Return a 0 if no change was made, other wise return the change count
function! Sort1Pass(fstart,fend,dir)
	let l:i = a:fstart
	let l:changed = 0
	while l:i < a:fend
		let l:changed = l:changed + Sort1Line(l:i,a:dir)
		let l:i = NextHead(l:i)
	endwhile
	return l:changed
endfunction
"}}}3
" Sort(start,end,dir) {{{3
" Sort this range of headings
" dir: 0 = ascending, 1 = decending 
function! SortRange(fstart,fend,dir)
	let l:changed = 1
	while l:changed != 0
		let l:changed = Sort1Pass(a:fstart,a:fend,a:dir)
	endwhile
endfunction
"}}}3
" SortChildren(dir) {{{3
" Sort the children of a parent 
" dir: 0 = ascending, 1 = descending 
function! SortChildren(dir)
	let l:oldcursor = line(".")
	let l:fstart = FindParent(line("."))
	let l:fend = FindLastChild(l:fstart)
	let l:fstart = l:fstart
	if l:fend <= l:fstart + 1
		return
	endif
	call append(line("$"),"Temporary last line for sorting")
	mkview
	let l:execstr = "set foldlevel=" . foldlevel(l:fstart)
	exec l:execstr
	call SortRange(l:fstart + 1,l:fend,a:dir)
	call cursor(line("$"),0)
	del x
	loadview
	call cursor(l:oldcursor,0)
endfunction
"}}}3
"}}}2
" MakeChars() {{{2
" Make a string of characters
" Used for strings of repeated characters
function MakeChars(count,char)
	let i = 0
	let l:chars=""
	while i < a:count
		let l:chars = l:chars . a:char
		let i = i + 1
	endwhile
	return l:chars
endfunction
"}}}2
" MakeSpaces() {{{2
" Make a string of spaces
function MakeSpaces(count)
	return MakeChars(a:count," ")
endfunction
"}}}2
" MakeDashes() {{{2
" Make a string of dashes
function MakeDashes(count)
	return MakeChars(a:count,"-")
endfunction
"}}}2
" MyFoldText() {{{2
" Create string used for folded text blocks
function MyFoldText()
	let l:MySpaces = MakeSpaces(&sw)
	let l:line = getline(v:foldstart)
	let l:bodyTextFlag=0
	if l:line =~ "^\t* \\S" || l:line =~ "^\t*\:"
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[TEXT]"
	elseif l:line =~ "^\t*\;"
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[TEXT BLOCK]"
	elseif l:line =~ "^\t*\> "
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[USER]"
	elseif l:line =~ "^\t*\>"
		let l:ls = stridx(l:line,">")
		let l:le = stridx(l:line," ")
		if l:le == -1
			let l:l = strpart(l:line, l:ls+1)
		else
			let l:l = strpart(l:line, l:ls+1, l:le-l:ls-1)
		endif
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[USER ".l:l."]"
	elseif l:line =~ "^\t*\< "
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[USER BLOCK]"
	elseif l:line =~ "^\t*\<"
		let l:ls = stridx(l:line,"<")
		let l:le = stridx(l:line," ")
		if l:le == -1
			let l:l = strpart(l:line, l:ls+1)
		else
			let l:l = strpart(l:line, l:ls+1, l:le-l:ls-1)
		endif
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[USER BLOCK ".l:l."]"
	elseif l:line =~ "^\t*\|"
		let l:bodyTextFlag=1
		let l:MySpaces = MakeSpaces(&sw * (v:foldlevel-1))
		let l:line = l:MySpaces."[TABLE]"
	endif
	let l:sub = substitute(l:line,'\t',l:MySpaces,'g')
	let l:len = strlen(l:sub)
	let l:sub = l:sub . " " . MakeDashes(58 - l:len) 
	let l:sub = l:sub . " (" . ((v:foldend + l:bodyTextFlag)- v:foldstart)
	if ((v:foldend + l:bodyTextFlag)- v:foldstart) == 1
		let l:sub = l:sub . " line)" 
	else
		let l:sub = l:sub . " lines)" 
	endif
	return l:sub
endfunction
"}}}2
" InsertDate() {{{2
" Insert today's date.
function InsertDate(ba)
	let @x = strftime("%Y-%m-%d")
	if a:ba == "0"
		normal! "xp
	else
		normal! "xP
	endif
endfunction
"}}}2
" InsertSpaceDate() {{{2
" Insert a space, then today's date.
function InsertSpaceDate()
	let @x = " "
	let @x = @x . strftime("%Y-%m-%d")
	normal! "xp
endfunction
"}}}2
" InsertTime() {{{2
" Insert the time.
function InsertTime(ba)
	let @x = strftime("%T")
	if a:ba == "0"
		normal! "xp
	else
		normal! "xP
	endif
endfunction
"}}}2
" InsertSpaceTime() {{{2
" Insert a space, then the time.
function InsertSpaceTime()
	let @x = " "
	let @x = @x . strftime("%T")
	normal! "xp
endfunction
"}}}2
" Ind(line) {{{2
" Determine the indent level of a line.
" Courtesy of Gabriel Horner
function! Ind(line)
	return indent(a:line)/&tabstop
endfunction
"}}}2
" BodyText(line) {{{2
" Determine the indent level of a line.
function! BodyText(line)
	return (match(getline(a:line),"^\t*:") == 0)
endfunction
"}}}2
" PreformattedBodyText(line) {{{2
" Determine the indent level of a line.
function! PreformattedBodyText(line)
	return (match(getline(a:line),"^\t*;") == 0)
endfunction
"}}}2
" PreformattedUserText(line) {{{2
" Determine the indent level of a line.
function! PreformattedUserText(line)
	return (match(getline(a:line),"^\t*<") == 0)
endfunction
"}}}2
" PreformattedUserTextLabeled(line) {{{2
" Determine the indent level of a line.
function! PreformattedUserTextLabeled(line)
	return (match(getline(a:line),"^\t*<\S") == 0)
endfunction
"}}}2
" PreformattedUserTextSpace(line) {{{2
" Determine the indent level of a line.
function! PreformattedUserTextSpace(line)
	return (match(getline(a:line),"^\t*< ") == 0)
endfunction
"}}}2
" UserText(line) {{{2
" Determine the indent level of a line.
function! UserText(line)
	return (match(getline(a:line),"^\t*>") == 0)
endfunction
"}}}2
" UserTextSpace(line) {{{2
" Determine the indent level of a line.
function! UserTextSpace(line)
	return (match(getline(a:line),"^\t*> ") == 0)
endfunction
"}}}2
" UserTextLabeled(line) {{{2
" Determine the indent level of a line.
function! UserTextLabeled(line)
	return (match(getline(a:line),"^\t*>\S") == 0)
endfunction
"}}}2
" PreformattedTable(line) {{{2
" Determine the indent level of a line.
function! PreformattedTable(line)
	return (match(getline(a:line),"^\t*|") == 0)
endfunction
"}}}2
" MyFoldLevel(Line) {{{2
" Determine the fold level of a line.
function MyFoldLevel(line)
	let l:myindent = Ind(a:line)
	let l:nextindent = Ind(a:line+1)

	if BodyText(a:line)
		if (BodyText(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (BodyText(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	elseif PreformattedBodyText(a:line)
		if (PreformattedBodyText(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (PreformattedBodyText(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	elseif PreformattedTable(a:line)
		if (PreformattedTable(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (PreformattedTable(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	elseif PreformattedUserText(a:line)
		if (PreformattedUserText(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (PreformattedUserTextSpace(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	elseif PreformattedUserTextLabeled(a:line)
		if (PreformattedUserTextLabeled(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (PreformattedUserText(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	elseif UserText(a:line)
		if (UserText(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (UserTextSpace(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	elseif UserTextLabeled(a:line)
		if (UserTextLabeled(a:line-1) == 0)
			return '>'.(l:myindent+1)
		endif
		if (UserText(a:line+1) == 0)
			return '<'.(l:myindent+1)
		endif
		return (l:myindent+1)
	else
		if l:myindent < l:nextindent
			return '>'.(l:myindent+1)
		endif
		if l:myindent > l:nextindent
			"return '<'.(l:nextindent+1)
			return (l:myindent)
			"return '<'.(l:nextindent-1)
		endif
		return l:myindent
	endif
endfunction
"}}}2
" Spawn(line) {{{2
" Execute an executable line
" Courtesy of Steve Litt
if !exists("loaded_steveoutliner_functions")
	let loaded_steveoutliner_functions=1
function Spawn()
		let theline=getline(line("."))
		let idx=matchend(theline, "_exe_\\s*")
		if idx == -1
			echo "Not an executable line"
		else
			let command=strpart(theline, idx)
			let command="!".command
			exec command
		endif
endfunction
endif
"}}}2
" This should be a setlocal but that doesn't work when switching to a new .otl file
" within the same buffer. Using :e has demonstrated this.
set foldtext=MyFoldText()

setlocal fillchars=|, 

endif " if !exists("loaded_vimoutliner_functions")
" End Vim Outliner Functions

" Vim Outliner Key Mappings {{{1
" insert the date
nmap <silent><buffer> <localleader>d $:call InsertSpaceDate()<cr>
imap <silent><buffer> <localleader>d ~<esc>x:call InsertDate(0)<cr>a
nmap <silent><buffer> <localleader>D ^:call InsertDate(1)<cr>a <esc>


" insert the time
nmap <silent><buffer> <localleader>t $:call InsertSpaceTime()<cr>
imap <silent><buffer> <localleader>t ~<esc>x:call InsertTime(0)<cr>a
nmap <silent><buffer> <localleader>T ^:call InsertTime(1)<cr>a <esc>

" sort a list naturally
map <silent> <buffer> <localleader>s :silent call SortChildren(0)<cr>
" sort a list, but you supply the options
map <silent> <buffer> <localleader>S :silent call SortChildren(1)<cr>

" invoke the file explorer
map <silent><buffer> <localleader>f :e .<cr>
imap <silent><buffer> <localleader>f :e .<cr>

" Insert a fence for segmented lists.
" I also use this divider to create a <hr> when converting to html
map <silent><buffer> <localleader>- o----------------------------------------0
imap <silent><buffer> <localleader>- ----------------------------------------<cr>

" switch document between the two types of bodytext styles
if use_space_colon == 1
  "   First, convert document to the marker style
  map <silent><buffer><localleader>b :%s/\(^\t*\) :/\1/e<cr>:%s/\(^\t*\) /\1 : /e<cr>:let @/=""<cr>
  "   Now, convert document to the space style
  map <silent><buffer><localleader>B :%s/\(^\t*\) :/\1/e<cr>:let @/=""<cr>
else
  "   First, convert document to the marker style
  map <silent><buffer><localleader>b :%s/\(^\t*\):/\1/e<cr>:%s/\(^\t*\) /\1: /e<cr>:let @/=""<cr>
  "   Now, convert document to the space style
  map <silent><buffer><localleader>B :%s/\(^\t*\):/\1/e<cr>:let @/=""<cr>
endif

" Steve's additional mappings start here
map <silent><buffer>   <C-K>         <C-]>
map <silent><buffer>   <C-N>         <C-T>
map <silent><buffer>   <localleader>0           :set foldlevel=99999<CR>
map <silent><buffer>   <localleader>9           :set foldlevel=8<CR>
map <silent><buffer>   <localleader>8           :set foldlevel=7<CR>
map <silent><buffer>   <localleader>7           :set foldlevel=6<CR>
map <silent><buffer>   <localleader>6           :set foldlevel=5<CR>
map <silent><buffer>   <localleader>5           :set foldlevel=4<CR>
map <silent><buffer>   <localleader>4           :set foldlevel=3<CR>
map <silent><buffer>   <localleader>3           :set foldlevel=2<CR>
map <silent><buffer>   <localleader>2           :set foldlevel=1<CR>
map <silent><buffer>   <localleader>1           :set foldlevel=0<CR>
map <silent><buffer>   <localleader>,,          :runtime vimoutliner/vimoutlinerrc<CR>
map! <silent><buffer>  <localleader>w           <Esc>:w<CR>a
nmap <silent><buffer>  <localleader>e           :call Spawn()<cr>
" Steve's additional mappings end here

" Placeholders for already assigned but non-functional commands
map <silent><buffer> <localleader>h :echo "VimOutliner reserved command: ,,h"<cr>
imap <silent><buffer> <localleader>h :echo "VimOutliner reserved command: ,,h"<cr>
map <silent><buffer> <localleader>H :echo "VimOutliner reserved command: ,,H"<cr>
imap <silent><buffer> <localleader>H :echo "VimOutliner reserved command: ,,H"<cr>

" End of Vim Outliner Key Mappings }}}1
" Menu Entries {{{1
" VO menu
amenu &VO.Expand\ Level\ &1 :set foldlevel=0<cr>
amenu &VO.Expand\ Level\ &2 :set foldlevel=1<cr>
amenu &VO.Expand\ Level\ &3 :set foldlevel=2<cr>
amenu &VO.Expand\ Level\ &4 :set foldlevel=3<cr>
amenu &VO.Expand\ Level\ &5 :set foldlevel=4<cr>
amenu &VO.Expand\ Level\ &6 :set foldlevel=5<cr>
amenu &VO.Expand\ Level\ &7 :set foldlevel=6<cr>
amenu &VO.Expand\ Level\ &8 :set foldlevel=7<cr>
amenu &VO.Expand\ Level\ &9 :set foldlevel=8<cr>
amenu &VO.Expand\ Level\ &All :set foldlevel=99999<cr>
amenu &VO.-Sep1- :
"Tools sub-menu
let s:path2scripts = expand('<sfile>:p:h:h').'/vimoutliner/scripts'
" otl2html
exec 'amenu &VO.&Tools.otl2&html\.py\	(otl2html\.py\ thisfile\ -S\ html2otl_nnnnnn\.css\ >\ thisfile\.html) :!'.s:path2scripts.'/otl2html.py -S html2otl_nnnnnn.css % > %.html<CR>'
" otl2docbook
exec 'amenu &VO.&Tools.otl2&docbook\.pl\	(otl2docbook\.pl\ thisfile\ >\ thisfile\.dbk) :!'.s:path2scripts.'/otl2docbook.pl % > %.dbk<CR>'
" otl2table
exec 'amenu &VO.&Tools.otl2&table\.py\	(otl2table\.py\ thisfile\ >\ thisfile\.txt) :!'.s:path2scripts.'/otl2table.py % > %.txt<CR>'
" otl2tags => FreeMind
exec 'amenu &VO.&Tools.otl2tags\.py\ =>\ &FreeMind\	(otl2tags\.py\ \-c\ otl2tags_freemind\.conf\ thisfile\ >\ thisfile\.mm) :!'.s:path2scripts.'/otl2tags.py -c '.s:path2scripts.'/otl2tags_freemind.conf % > %.mm<CR>'
" otl2tags => Graphviz
exec 'amenu &VO.&Tools.otl2tags\.py\ =>\ &Graphviz\	(otl2tags\.py\ \-c\ otl2tags_graphviz\.conf\ thisfile\ >\ thisfile\.gv) :!'.s:path2scripts.'/otl2tags.py -c '.s:path2scripts.'/otl2tags_graphviz.conf % > %.gv<CR>'
amenu &VO.&Tools.&myotl2thml\.sh\	(myotl2html\.sh\ thisfile) :!myotl2html.sh %<CR>
amenu &VO.-Sep2- :
amenu &VO.&Color\ Scheme :popup Edit.Color\ Scheme<cr>
amenu &VO.-Sep3- :
amenu &VO.&Help.&Index :he vo<cr>
amenu &VO.&Help.&,,\ Commands :he vo-command<cr>
amenu &VO.&Help.&Checkboxes :he vo-checkbox<cr>
amenu &VO.&Help.&Hoisting :he vo-hoisting<cr>
amenu &Help.-Sep1- :
" Help menu additions
amenu &Help.&Vim\ Outliner.&Index :he vo<cr>
amenu &Help.&Vim\ Outliner.&,,\ Commands :he vo-command<cr>
amenu &Help.&Vim\ Outliner.&Checkboxes :he vo-checkbox<cr>
amenu &Help.&Vim\ Outliner.&Hoisting :he vo-hoisting<cr>
"}}}1
" Auto-commands {{{1
if !exists("autocommand_vo_loaded")
	let autocommand_vo_loaded = 1
	au BufNewFile,BufRead *.otl                     setf vo_base
"	au CursorHold *.otl                             syn sync fromstart
	set updatetime=500
endif
"}}}1

" this command needs to be run every time so Vim doesn't forget where to look
setlocal tags^=$HOME/.vim/vimoutliner/vo_tags.tag

" Added an indication of current syntax as per Dillon Jones' request
let b:current_syntax = "outliner"

" Load rc file, only the first found.
let rcs = split(globpath('$HOME,$HOME/.vimoutliner','.vimoutlinerrc'), "\n") + split(globpath('$HOME,$HOME/.vimouliner', 'vimoutlinerrc'), "\n")
if len(rcs) > 0
	exec 'source '.rcs[0]
else
	runtime vimoutliner/vimoutlinerrc
endif
" Load modules
if exists('g:vo_modules_load')
	for vo_module in split(g:vo_modules_load, '\s*:\s*')
		exec "runtime vimoutliner/plugin/vo_" . vo_module . ".vim"
	endfor
unlet! vo_module
endif

" The End
" vim600: set foldmethod=marker foldlevel=0:
colors/vo_dark.vim	[[[1
81
let g:colors_name="VO Dark"
hi normal guifg=white guibg=black	ctermfg=white ctermbg=black
hi StatusLine guifg=white guibg=black	ctermfg=white ctermbg=black
hi StatusLineNC guifg=white guibg=black	ctermfg=white ctermbg=black
hi VertSplit guifg=white guibg=black	ctermfg=white ctermbg=black
hi OL1 guifg=white	ctermfg=white
hi OL2 guifg=red	ctermfg=red
hi OL3 guifg=lightblue	ctermfg=lightblue
hi OL4 guifg=violet	ctermfg=magenta
hi OL5 guifg=white	ctermfg=white
hi OL6 guifg=red	ctermfg=red
hi OL7 guifg=lightblue	ctermfg=lightblue
hi OL8 guifg=violet	ctermfg=magenta
hi OL9 guifg=white	ctermfg=white

" colors for tags
hi outlTags guifg=darkred	ctermfg=darkred

" color for body text
hi BT1 guifg=green	ctermfg=green
hi BT2 guifg=green	ctermfg=green
hi BT3 guifg=green	ctermfg=green
hi BT4 guifg=green	ctermfg=green
hi BT5 guifg=green	ctermfg=green
hi BT6 guifg=green	ctermfg=green
hi BT7 guifg=green	ctermfg=green
hi BT8 guifg=green	ctermfg=green
hi BT9 guifg=green	ctermfg=green

" color for pre-formatted text
hi PT1 guifg=blue	ctermfg=cyan
hi PT2 guifg=blue	ctermfg=cyan
hi PT3 guifg=blue	ctermfg=cyan
hi PT4 guifg=blue	ctermfg=cyan
hi PT5 guifg=blue	ctermfg=cyan
hi PT6 guifg=blue	ctermfg=cyan
hi PT7 guifg=blue	ctermfg=cyan
hi PT8 guifg=blue	ctermfg=cyan
hi PT9 guifg=blue	ctermfg=cyan

" color for tables 
hi TA1 guifg=darkviolet	ctermfg=cyan
hi TA2 guifg=darkviolet	ctermfg=cyan
hi TA3 guifg=darkviolet	ctermfg=cyan
hi TA4 guifg=darkviolet	ctermfg=cyan
hi TA5 guifg=darkviolet	ctermfg=cyan
hi TA6 guifg=darkviolet	ctermfg=cyan
hi TA7 guifg=darkviolet	ctermfg=cyan
hi TA8 guifg=darkviolet	ctermfg=cyan
hi TA9 guifg=darkviolet	ctermfg=cyan

" color for user text (wrapping)
hi UT1 guifg=darkred	ctermfg=cyan
hi UT2 guifg=darkred	ctermfg=cyan
hi UT3 guifg=darkred	ctermfg=cyan
hi UT4 guifg=darkred	ctermfg=cyan
hi UT5 guifg=darkred	ctermfg=cyan
hi UT6 guifg=darkred	ctermfg=cyan
hi UT7 guifg=darkred	ctermfg=cyan
hi UT8 guifg=darkred	ctermfg=cyan
hi UT9 guifg=darkred	ctermfg=cyan

" color for user text (non-wrapping)
hi UB1 guifg=darkgray	ctermfg=cyan
hi UB2 guifg=darkgray	ctermfg=cyan
hi UB3 guifg=darkgray	ctermfg=cyan
hi UB4 guifg=darkgray	ctermfg=cyan
hi UB5 guifg=darkgray	ctermfg=cyan
hi UB6 guifg=darkgray	ctermfg=cyan
hi UB7 guifg=darkgray	ctermfg=cyan
hi UB8 guifg=darkgray	ctermfg=cyan
hi UB9 guifg=darkgray	ctermfg=cyan

" colors for folded sections
hi Folded guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=black
hi FoldColumn guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=black

" colors for experimental spelling error highlighting
" this only works for spellfix.vim with will be cease to exist soon
hi spellErr gui=underline guifg=yellow	cterm=underline ctermfg=yellow
hi BadWord gui=underline guifg=yellow	cterm=underline ctermfg=yellow
colors/vo_light.vim	[[[1
81
let g:colors_name="VO Light"
hi normal guifg=black guibg=white	ctermfg=white ctermbg=black
hi StatusLine guifg=black guibg=white	ctermfg=white ctermbg=black
hi StatusLineNC guifg=black guibg=white	ctermfg=white ctermbg=black
hi VertSplit guifg=black guibg=white	ctermfg=white ctermbg=black
hi OL1 guifg=black	ctermfg=black
hi OL2 guifg=red	ctermfg=red
hi OL3 guifg=blue	ctermfg=blue
hi OL4 guifg=darkviolet	ctermfg=magenta
hi OL5 guifg=black	ctermfg=black
hi OL6 guifg=red	ctermfg=red
hi OL7 guifg=blue	ctermfg=blue
hi OL8 guifg=darkviolet	ctermfg=magenta
hi OL9 guifg=black	ctermfg=black

" colors for tags
hi outlTags guifg=darkred	ctermfg=darkred

" color for body text
hi BT1 guifg=darkgreen	ctermfg=green
hi BT2 guifg=darkgreen	ctermfg=green
hi BT3 guifg=darkgreen	ctermfg=green
hi BT4 guifg=darkgreen	ctermfg=green
hi BT5 guifg=darkgreen	ctermfg=green
hi BT6 guifg=darkgreen	ctermfg=green
hi BT7 guifg=darkgreen	ctermfg=green
hi BT8 guifg=darkgreen	ctermfg=green
hi BT9 guifg=darkgreen	ctermfg=green

" color for pre-formatted text
hi PT1 guifg=darkblue	ctermfg=cyan
hi PT2 guifg=darkblue	ctermfg=cyan
hi PT3 guifg=darkblue	ctermfg=cyan
hi PT4 guifg=darkblue	ctermfg=cyan
hi PT5 guifg=darkblue	ctermfg=cyan
hi PT6 guifg=darkblue	ctermfg=cyan
hi PT7 guifg=darkblue	ctermfg=cyan
hi PT8 guifg=darkblue	ctermfg=cyan
hi PT9 guifg=darkblue	ctermfg=cyan

" color for tables 
hi TA1 guifg=darkviolet	ctermfg=cyan
hi TA2 guifg=darkviolet	ctermfg=cyan
hi TA3 guifg=darkviolet	ctermfg=cyan
hi TA4 guifg=darkviolet	ctermfg=cyan
hi TA5 guifg=darkviolet	ctermfg=cyan
hi TA6 guifg=darkviolet	ctermfg=cyan
hi TA7 guifg=darkviolet	ctermfg=cyan
hi TA8 guifg=darkviolet	ctermfg=cyan
hi TA9 guifg=darkviolet	ctermfg=cyan

" color for user text (wrapping)
hi UT1 guifg=darkred	ctermfg=cyan
hi UT2 guifg=darkred	ctermfg=cyan
hi UT3 guifg=darkred	ctermfg=cyan
hi UT4 guifg=darkred	ctermfg=cyan
hi UT5 guifg=darkred	ctermfg=cyan
hi UT6 guifg=darkred	ctermfg=cyan
hi UT7 guifg=darkred	ctermfg=cyan
hi UT8 guifg=darkred	ctermfg=cyan
hi UT9 guifg=darkred	ctermfg=cyan

" color for user text (non-wrapping)
hi UB1 guifg=darkgray	ctermfg=cyan
hi UB2 guifg=darkgray	ctermfg=cyan
hi UB3 guifg=darkgray	ctermfg=cyan
hi UB4 guifg=darkgray	ctermfg=cyan
hi UB5 guifg=darkgray	ctermfg=cyan
hi UB6 guifg=darkgray	ctermfg=cyan
hi UB7 guifg=darkgray	ctermfg=cyan
hi UB8 guifg=darkgray	ctermfg=cyan
hi UB9 guifg=darkgray	ctermfg=cyan

" colors for folded sections
hi Folded guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=white
hi FoldColumn guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=white

" colors for experimental spelling error highlighting
" this only works for spellfix.vim with will be cease to exist soon
hi spellErr gui=underline guifg=darkred cterm=underline ctermfg=darkred
hi BadWord gui=underline guifg=darkred cterm=underline ctermfg=darkred
ftdetect/vo_base.vim	[[[1
81
"# #######################################################################
"# filetype.vim: filetype loader
"#   version 0.3.6
"#   Copyright (C) 2001,2003 by Steve Litt (slitt@troubleshooters.com)
"#
"#   This program is free software; you can redistribute it and/or modify
"#   it under the terms of the GNU General Public License as published by
"#   the Free Software Foundation; either version 2 of the License, or
"#   (at your option) any later version.
"#
"#   This program is distributed in the hope that it will be useful,
"#   but WITHOUT ANY WARRANTY; without even the implied warranty of
"#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"#   GNU General Public License for more details.
"#
"#   You should have received a copy of the GNU General Public License
"#   along with this program; if not, write to the Free Software
"#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
"#
"# Steve Litt, slitt@troubleshooters.com, http://www.troubleshooters.com
"# #######################################################################

"# #######################################################################
"#  HISTORY
"#  V0.1.0 Pre-alpha
"#      Set of outliner friendly settings
"# Steve Litt, 5/28/2001
"# End of version 0.1.0
"# 
"#  V0.1.1 Pre-alpha
"#      No change
"# 
"# Steve Litt, 5/28/2001
"# End of version 0.1.1
"# 
"#  V0.1.2 Pre-alpha
"# 	No Change
"# Steve Litt, 5/30/2001
"# End of version 0.1.2
"#  V0.1.3 Pre-alpha
"# 	No Change
"# Steve Litt, 5/30/2001
"# End of version 0.1.3
"#  V0.2.0 
"# 	Noel Henson adds code for outliner-friendly expand and
"# 	collapse, comma comma commands, color coding, hooks for a
"# 	spellchecker, sorting, and date insertion.
"# Noel Henson, 11/24/2002
"# End of version 0.2.0
"# END OF HISTORY
"# 
"# #######################################################################
"filetype.vim
"http://www.troubleshooters.com/projects/vimoutliner

"Internal RCS
"$Revision: 1.1 $"
"$Date: 2005/01/19 16:12:37 $
"$Log: vo_base.vim,v $
"Revision 1.1  2005/01/19 16:12:37  noel
"Finally added to CVS.
"Don't know how I missed this one.
"
"Revision 1.4  2003/03/01 17:37:17  noel
"Changed the filetype name to our new standard: vo_base
"
"Revision 1.3  2003/02/14 17:49:43  noel
"Removed unnecessary filetype commands
"
"Revision 1.2  2003/02/09 15:07:35  noel
"Changed the auto commands. Setting the "filetype plugin indent on"
"option here does not work with ftplugins.
"
"Revision 1.1  2003/02/08 21:11:26  noel
"Initial revision
"
augroup filetypedetect
  au! BufRead,BufNewFile *.otl		setfiletype vo_base
  au! BufRead,BufNewFile *.oln		setfiletype xoutliner
augroup END

vimoutliner/plugin/vo_checkbox.otl	[[[1
256
Checkboxes: vo_checkbox
What is it?
	: Checkboxes is a plugin for project, task and list managment. It add an
	: understanding of check boxes and percentage of task completion to Vim
	: Outliner. It adds just three tags and six commands. 
Installation
	This should already be included in your Vim Outliner package
		The newest, stable version is included with this package in the plugin directory
		The pluging is already enabled in your ~/.vimoutlinerrc
The Checkbox Tags
	[_]		an unchecked item or incomplete task
	[X]		a checked item or complete task
	%		a placeholder for percentage of completion
The Checkbox Commands
	: The default <localleader> for VimOutliner is ,, so we will use this
	: leader in the command discussions.
	,,cb	Create a check box
		: This works for the current heading or selected range of lines
		: including folds. Visual selection of the range of headings works
		: nicely. This command is currently not aware of body text. This
		: limited awareness needs to be fixed before this plugin can be
		: included in the standard Vim Outliner plugins.
	,,cB	Create a check box (even if one exists)
	,,c%	Create a checkbox and % symbol
		: This works just like ,,cb but add a % symbol for use in completion 
		: calculations.
	,,cx	Change check box state
		: If there is a checkbox on the line the cursor is on, change its
		: state. If it's checked, uncheck it and vice-versa. Then recompute 
		: the completion of the entire branch starting from the root parent.
	,,cd	Delete a checkbox
		: Delete the left-most check box on the selected heading(s).
	,,cz	Compute completion
		: Starting at the heading the cursor is on, recursively compute the
		: completion level of all sub-headings.
How do I use it?
	Start with a simple example
		: Let's start with planning a small party; say a barbeque.
		Make the initial outline
			Barbeque
				Guests
					Bill and Barb
					Larry and Louise
					Marty and Mary
					Chris and Christine
					David and Darla
					Noel and Susan
				Food
					Chicken
					Ribs
					Corn on the cob
					Salad
					Desert
				Beverages
					Soda
					Iced Tea
					Beer
				Party Favors
					Squirt guns
					Hats
					Name tags
				Materials
					Paper Plates
					Napkins
					Trash Containers
		Add the check boxes
			: This can be done by visually selecting them and typing ,,cb.
			: When done, you should see this:
			[_] Barbeque
				[_] Guests
					[_] Bill and Barb
					[_] Larry and Louise
					[_] Marty and Mary
					[_] Chris and Christine
					[_] David and Darla
					[_] Noel and Susan
				[_] Food
					[_] Chicken
					[_] Ribs
					[_] Corn on the cob
					[_] Salad
					[_] Desert
				[_] Beverages
					[_] Soda
					[_] Iced Tea
					[_] Beer
				[_] Party Favors
					[_] Squirt guns
					[_] Hats
					[_] Name tags
				[_] Materials
					[_] Paper Plates
					[_] Napkins
					[_] Trash Containers
		Now check off what's done
			: Checking off what is complete is easy with the ,,cx command.
			: Just place the cursor on a heading and ,,cx it. Now you can see
			: what's done as long as the outline is fully expanded.
			[_] Barbeque
				[_] Guests
					[X] Bill and Barb
					[X] Larry and Louise
					[X] Marty and Mary
					[X] Chris and Christine
					[X] David and Darla
					[X] Noel and Susan
				[_] Food
					[X] Chicken
					[X] Ribs
					[_] Corn on the cob
					[_] Salad
					[X] Desert
				[_] Beverages
					[_] Soda
					[X] Iced Tea
					[X] Beer
				[_] Party Favors
					[_] Squirt guns
					[_] Hats
					[_] Name tags
				[_] Materials
					[X] Paper Plates
					[_] Napkins
					[X] Trash Containers
	Getting more advanced
		Now summarize what's done
			: You can summarize what is done with the ,,cz command. Place the
			: cursor on the 'Barbeque' heading and ,,cz it. The command will
			: recursively process the outline and update the check boxes of
			: the parent headlines. You should see:
			: (Note: the only change is on the 'Guests' heading. It changed
			: because all of its children are complete.)
			[_] Barbeque
				[X] Guests
					[X] Bill and Barb
					[X] Larry and Louise
					[X] Marty and Mary
					[X] Chris and Christine
					[X] David and Darla
					[X] Noel and Susan
				[_] Food
					[X] Chicken
					[X] Ribs
					[_] Corn on the cob
					[_] Salad
					[X] Desert
				[_] Beverages
					[_] Soda
					[X] Iced Tea
					[X] Beer
				[_] Party Favors
					[_] Squirt guns
					[_] Hats
					[_] Name tags
				[_] Materials
					[X] Paper Plates
					[_] Napkins
					[X] Trash Containers
		Add percentages for a better view
			: You can get a much better view of what's going on, especially
			: with collapsed headings, if you add percentages. Place a % on
			: each heading that has children like this:
			[_] % Barbeque
				[X] % Guests
					[X] Bill and Barb
					[X] Larry and Louise
					[X] Marty and Mary
					[X] Chris and Christine
					[X] David and Darla
					[X] Noel and Susan
				[_] % Food
					[X] Chicken
					[X] Ribs
					[_] Corn on the cob
					[_] Salad
					[X] Desert
				[_] % Beverages
					[_] Soda
					[X] Iced Tea
					[X] Beer
				[_] % Party Favors
					[_] Squirt guns
					[_] Hats
					[_] Name tags
				[_] % Materials
					[X] Paper Plates
					[_] Napkins
					[X] Trash Containers
		Now compute the percentage of completion
			: After adding the % symbols, place the cursor on the 'Barbeque'
			: heading and execute ,,cz as before. Keep in mind that the
			: recursive percentages are weighted. You should see:
			[_] 58% Barbeque
				[X] 100% Guests
					[X] Bill and Barb
					[X] Larry and Louise
					[X] Marty and Mary
					[X] Chris and Christine
					[X] David and Darla
					[X] Noel and Susan
				[_] 60% Food
					[X] Chicken
					[X] Ribs
					[_] Corn on the cob
					[_] Salad
					[X] Desert
				[_] 66% Beverages
					[_] Soda
					[X] Iced Tea
					[X] Beer
				[_] 0% Party Favors
					[_] Squirt guns
					[_] Hats
					[_] Name tags
				[_] 66% Materials
					[X] Paper Plates
					[_] Napkins
					[X] Trash Containers
		Complete a few more just for fun
			: Mark Salad and Soda and recompute with ,,cz and you should
			: see the ouline below.
			:
			: Try playng around with zc and zo to see the effects of opening
			: and closing folds. Even if you place the cursor on 'Barbeque'
			: and zo it, you still have a good understanding of how complete
			: the project is.
			[_] 69% Barbeque
				[X] 100% Guests
					[X] Bill and Barb
					[X] Larry and Louise
					[X] Marty and Mary
					[X] Chris and Christine
					[X] David and Darla
					[X] Noel and Susan
				[_] 80% Food
					[X] Chicken
					[X] Ribs
					[_] Corn on the cob
					[X] Salad
					[X] Desert
				[X] 100% Beverages
					[X] Soda
					[X] Iced Tea
					[X] Beer
				[_] 0% Party Favors
					[_] Squirt guns
					[_] Hats
					[_] Name tags
				[_] 66% Materials
					[X] Paper Plates
					[_] Napkins
					[X] Trash Containers
Limitations
	Body text is not yet supported
		: ,,cb will falsely add a check box to body text.

vimoutliner/plugin/vo_checkbox.vim	[[[1
322
"######################################################################
"# VimOutliner Checkboxes
"# Copyright (C) 2003 by Noel Henson noel@noels-lab.com
"# The file is currently an experimental part of Vim Outliner.
"#
"# This program is free software; you can redistribute it and/or modify
"# it under the terms of the GNU General Public License as published by
"# the Free Software Foundation; either version 2 of the License, or
"# (at your option) any later version.
"#
"# This program is distributed in the hope that it will be useful,
"# but WITHOUT ANY WARRANTY; without even the implied warranty of
"# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"# GNU General Public License for more details.
"######################################################################

" Detailed Revision Log {{{1
"vo_checkbox.vim
"Internal RCS
"$Revision: 1.22 $"
"$Date: 2005/06/11 16:34:25 $
"$Log: vo_checkbox.vim,v $
"Revision 1.22  2005/06/11 16:34:25  noel
"Modified ,,cz to recompute completion on an entire tree.
"
"Revision 1.21  2005/06/11 15:54:05  noel
"Modified the behavior of ,,cp to always include the % sign. Even on childless
"parents.
"
"Revision 1.20  2005/06/11 14:01:42  noel
"Modified computation of percentage completion to work on a heading
"that has not children. Now if a childless heading is marked done,
"the percentage shown will be 100% instead of 0%.
"
"Revision 1.18  2005/06/07 15:08:59  noel
"Fixed a bug that added checkboxes to body text, preformatted body text,
"tables, user-defined text and user-defined preformatted text lines.
"Fixed a bug where ,,cb would modify terms like 'test%' or ',,c%'. Now
"it only modifies this term: ' [0-9]*%'.
"
"Revision 1.17  2005/06/07 13:53:22  noel
"Added ,,cp. It is the same as ,,c%
"
"Revision 1.16  2004/05/27 22:22:48  noel
"Made ,,cd smart so it would try to delete non-existent checkboxes.
"Fixed a recursion bug in NewHMD to branches with a single child would
"be computed properly.
"
"Revision 1.15  2004/05/27 18:11:53  noel
"Added smart (only the entire tree in which the child exists), automatic
"completion calculations to the ,,cx command.
"Added smart (only for parents, not children) '%' sign insertion for
",,c%.
"
"Revision 1.14  2004/05/17 15:53:38  noel
"Modified SwitchBox() to be more selective.
"
"Revision 1.13  2004/05/17 15:43:23  noel
"Fixed a broken key mapping: ,,c%.
"
"Revision 1.12  2004/02/23 12:19:27  noel
"Fixed Up-to-date problem.
"Fixed 'Safely script names'.
"
"Revision 1.11  2003/09/05 16:37:55  cepl
"Added ,cp binding for the new function InsertCheckBoxPerCent,
"which adds not only the checkbox but also percentage sign.
"
"Revision 1.10  2003/08/23 16:42:15  noel
"Modified completion percentages to be recursive.
"This:
"[_] 0% Project
"	[_] 33% Task
"		[_] Subtask
"		[X] Subtask
"		[X] Subtask
"	[_] 0% Task
"		[_] Subtask
"		[_] 50% Subtask
"			[X] Subsubtask
"			[_] Subsubtask
"			[X] Subsubtask
"			[_]  Subsubtask
"
"Becomes this:
"[_] 29% Project
"	[_] 33% Task
"		[_] Subtask
"		[X] Subtask
"		[X] Subtask
"	[_] 25% Task
"		[_] Subtask
"		[_] 50% Subtask
"			[X] Subsubtask
"			[_] Subsubtask
"			[X] Subsubtask
"			[_]  Subsubtask
"
"Revision 1.9  2003/08/16 13:49:53  noel
"added ! to functions.
"
"Revision 1.8  2003/08/11 19:16:28  noel
"Fixed a bug in which any line that contained the letter x was counted as
"completed.
"
"Revision 1.7  2003/08/03 23:56:46  noel
"
"Replaced HowManyDone() with a new routine. The new routine is recursive,
"ignores headings that don't have checkboxes and does not care what the
"current folding states of the parent or children are. The heading at the
"top of the tree does not even need to have a checkbox. This will work:
"
"Projects
"	[_] Software
"		[_] Input
"		[_] Processing
"			[_] Math
"			[_] Database
"			[_] Networking
"		[_] Output
"	[_] Hardware
"		[_] Keyboard
"		[_] Harddisk
"		[_] Processor
"		[_] Printer
"
"One only needs to ,,cx on Projects to update everything (everything shown).
"As before, including a % on a parent heading with childred, will be replaced
"with a percentage of completion. Nice work Matej!
"
"Revision 1.6  2003/07/14 00:36:57  noel
"Changed [x] to [X] to make it look more full. If the consensus is
"[x], I'll gladly put it back.
"
"Revision 1.5  2003/07/10 16:29:50  cepl
"Calculation of the subtree completion added. The very first alpha
"draft.
"
"Revision 1.3  2003/07/09 13:10:57  matej
"The first draft of the work done in subtree.
"
"Revision 1.2  2003/07/08 17:58:56  matej
"Pøidáno ,cx a ,ci zmìnìn na ,cb.
"
"Revision 1.1  2003/07/08 17:39:12  matej
"Initial revision
"
"Revision 1.3  2003/07/07 14:17:04  noel
"Fixed the folding of the new headers.
"
"Revision 1.2  2003/07/07 14:14:02  noel
"Added appropriate headers.
"}}}1

" Mappings {{{1
" insert a chechbox
map <silent><buffer> <localleader>cb :call SafelyInsertCheckBox()<cr>
map <silent><buffer> <localleader>c% :call SafelyInsertCheckBoxPercent()<cr>
map <silent><buffer> <localleader>cp :call SafelyInsertCheckBoxPercentAlways()<cr>
map <silent><buffer> <localleader>cB :call InsertCheckBox()<cr>

" delete a chechbox
map <silent><buffer> <localleader>cd :call DeleteCheckbox()<cr>

" switch the status of the box
map <silent><buffer> <localleader>cx :call SwitchBox()<cr>:call NewHMD(FindRootParent(line(".")))<cr>

" calculate the proportion of work done on the subtree
map <silent><buffer> <localleader>cz :call NewHMD(FindRootParent(line(".")))<cr>

" Load guard for functions {{{1
if exists('s:loaded')
	finish
endif
let s:loaded = 1

" InsertCheckBox() {{{1
" Insert a checkbox at the beginning of a header without disturbing the
" current folding.
function! InsertCheckBox()
	let @x = "[_] "
	normal! ^"xP
endfunction
" Safely InsertCheckBox() {{{1
" Insert a checkbox at the beginning of a header without disturbing the
" current folding only if there is no checkbox already.
function! SafelyInsertCheckBox()
	if match(getline("."),"^\t\t*\[<>:;|\]") != -1
		return
	endif
	if match(getline("."),"[\[X_\]]") == -1
		let @x = "[_] "
		normal! ^"xP
	endif
endfunction
"}}}1
" Safely InsertCheckBoxPercent() {{{1
" Insert a checkbox and % sign at the beginning of a header without disturbing 
" the current folding only if there is no checkbox already.
function! SafelyInsertCheckBoxPercent()
	if match(getline("."),"^\t\t*\[<>:;|\]") != -1
		return
	endif
        if match(getline("."), "[\[X_\]]") == -1
		if Ind(line(".")+1) > Ind(line("."))
			let @x = "[_] % "
		else
			let @x = "[_] "
		endif
           normal! ^"xP
        endif
endfunction
"}}}1
" Safely InsertCheckBoxPercentAlways() {{{1
" Insert a checkbox and % sign at the beginning of a header without disturbing 
" the current folding only if there is no checkbox already. Include the 
" checkbox even on childless headings.
function! SafelyInsertCheckBoxPercentAlways()
	if match(getline("."),"^\t\t*\[<>:;|\]") != -1
		return
	endif
        if match(getline("."), "[\[X_\]]") == -1
		let @x = "[_] % "
           normal! ^"xP
        endif
endfunction
"}}}1
" SwitchBox() {{{1
" Switch the state of the checkbox on the current line.
function! SwitchBox()
   let questa = strridx(getline("."),"[_]")
   let questb = strridx(getline("."),"[X]")
   if (questa != -1) || (questb != -1)
	   if (questa != -1) 
	      substitute/\[_\]/\[X\]/
	   else
	      substitute/\[X\]/\[_\]/
	   endif
   endif
endfunction
"}}}1
" DeleteCheckbox() {{{1
" Delete a checkbox if one exists
function! DeleteCheckbox()
   let questa = strridx(getline("."),"[_]")
   let questb = strridx(getline("."),"[X]")
   if (questa != -1) || (questb != -1)
	   if (questa != -1) 
	      substitute/\(^\s*\)\[_\] \(.*\)/\1\2/
	   else
	      substitute/\(^\s*\)\[X\] \(.*\)/\1\2/
	   endif
   endif
endfunction
"}}}1
" Ind(line) {{{1
" Return the index of the line.
" Remove it when using the new version of VO
function! Ind(line)
	return indent(a:line) / &tabstop
endf
" FindRootParent(line) {{{1
" returns the line number of the root parent for any child
function! FindRootParent(line)
	if Ind(a:line) == 0
		return (a:line)
	endif
	let l:i = a:line
	while l:i > 1 && Ind(l:i) > 0
		let l:i = l:i - 1
	endwhile
	return l:i
endf

" NewHMD(line) {{{1
" (How Many Done) 
" Calculates proportion of already done work in the subtree
function! NewHMD(line)
	let l:done = 0
	let l:count = 0
	let l:i = 1
	while Ind(a:line) < Ind(a:line+l:i)
		if (Ind(a:line)+1) == (Ind(a:line+l:i))
			let l:childdoneness = NewHMD(a:line+l:i)
			if l:childdoneness >= 0
				let l:done = l:done + l:childdoneness
				let l:count = l:count+1
			endif
		endif
		let l:i = l:i+1
	endwhile
   let l:proportion=0
   if l:count>0
     let l:proportion = ((l:done * 100)/l:count)/100
   else
      if match(getline(a:line),"\\[X\\]") != -1
	      let l:proportion = 100
      else 
	      let l:proportion = 0
      endif
   endif
   call setline(a:line,substitute(getline(a:line)," [0-9]*%"," ".l:proportion."%",""))
   if l:proportion == 100
      call setline(a:line,substitute(getline(a:line),"\\[.\\]","[X]",""))
      return 100
   elseif l:proportion == 0 && l:count == 0
      if match(getline(a:line),"\\[X\\]") != -1
	      return 100
      elseif match(getline(a:line),"\\[_\\]") != -1
	      return 0
      else
	      return -1
      endif
   else
      call setline(a:line,substitute(getline(a:line),"\\[.\\]","[_]",""))
      return l:proportion
   endif
endf


"Modeline {{{1
" vim600: set foldlevel=0 foldmethod=marker:
vimoutliner/plugin/vo_hoist.otl	[[[1
77
Hoisting
What is it?
	: Hoisting is a way to focus on a particular area of an outline. Only the 
	: offspring from a selected parent will be shown. The offspring are 
	: left-justified just as if they were the top level headings and had no 
	: parent.
Installation
	The hoist plugin is included in the VimOutliner plugin directory
		This plugin is disabled by default
		See information in the ~/.vimoutlinerrc on how to enable it
	Optionally set the hoistParanoia variable
		: If you are really paranoid about loosing your data during shakedown 
		: of vo_hoist.vim, you can add this to your ~/.vimoutlinerrc file. It 
		: will prevent VO from automatically removing the temporary hoist 
		: files. This will have a tendency to hugely increase the number of 
		: files in your working directory (but if you're paranoid... ;) )
		let g:hoistParanoia = 1
How do I use it?
	Hoisting
		: Whenever you open a VO document, hoisting will be available.
		Invocation
			Place the cursor on the parent to be hoisted
			,,h
			You will need to hit <ENTER> to accept some informational messages
			You should now see the children of the selected parent ready for editing
			Treat this document just like a normal .otl file
	De-hoisting
		: From within the hoisted document you simply need to quit. The 
		: hoisted data will be saved in place of the old children. The cursor 
		: will be returned to the hoisted parent.
		Invocation
			The :q, :wq, :x and ZZ  perform a de-hoist operation
			A write will automatically be done to save any changes
	Manual De-hoisting
		: Should the de-hoisting ever fail or should an operator quit Vim (by 
		: closing the window with the mouse, say), a manual de-hoisting will 
		: need to be performed.
		You can find a currently hoisted parent by searching for __hoist
		Place the cursor on the parent with the __hoist tag
		,,H
		The edited, hoisted offspring will replace the current offspring
		The __hoist tag will be removed
The Hoist Tag
	Example Tag
	: The hoist tag is added to a hoisted parent for error recovery. It 
	: includes a filename, a line number and a timestamp.
	Example Tag
		__hoist:vo_hoist.46.20030816124249.otl
	Tag Components
		Tag Marker
			__hoist:
			Easy search and replace
		Filename Prefix
			vo_hoist.
			Needed to comply with VO standards for file naming
		Parent Line Number (at time of hoisting)
			46.
		Timestamp
			20030816124249
			YYYYMMDDhhmmss
		Filename Suffix
			.otl
			Duh
The Log Files
	: Log files of the hoists are created to aid in error recovery should that 
	: become necessary. They are created in the same directory as the working 
	: .otl file.
	Log Filename
		.vo_hoist.<otlfilename>.log
	Example Log Filename
		.vo_hoist.test.otl.log
	Contents
		There is one line per hoist operation
		Each is comprised of a parent with a __hoist tag
Limitations
	1 Level Deep
		: Until debug is complete, hoisting is limited to one level.
vimoutliner/plugin/vo_hoist.vim	[[[1
293
"######################################################################
"# VimOutliner Hoisting
"# Copyright (C) 2003 by Noel Henson noel@noels-lab.com
"# The file is currently an experimental part of Vim Outliner.
"#
"# This program is free software; you can redistribute it and/or modify
"# it under the terms of the GNU General Public License as published by
"# the Free Software Foundation; either version 2 of the License, or
"# (at your option) any later version.
"#
"# This program is distributed in the hope that it will be useful,
"# but WITHOUT ANY WARRANTY; without even the implied warranty of
"# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"# GNU General Public License for more details.
"######################################################################

" Detailed Revision Log {{{1
"vo_hoist.vim
"Internal RCS
"$Revision: 1.10 $"
"$Date: 2005/06/12 15:53:54 $
"$Log: vo_hoist.vim,v $
"Revision 1.10  2005/06/12 15:53:54  noel
"Moved key mappings so they work with Matej' new way to load plugins.
"
"Revision 1.9  2003/11/12 17:26:09  noel
"Added a command to place the cursor on the first line of
"a hoisted outline.
"
"Revision 1.8  2003/11/12 17:10:51  noel
"Fixed a bug that occurs on a level 1 heading with no children.
"
"Revision 1.7  2003/10/23 22:14:14  noel
"Minor changes to DeHoist() to compensate for current foldlevel settings.
"
"Revision 1.6  2003/08/17 15:35:24  noel
"Put the new mappings in the correct place this time.
"Added a : and <cr> to the ZZ command.
"
"Revision 1.5  2003/08/17 14:47:42  noel
"Added ZZ, qa, and x to the list of commands that de-hoist the current
"outline.
"
"Revision 1.4  2003/08/17 00:07:31  noel
"Added "silent" to commands generating tedious messages.
"
"Revision 1.3  2003/08/16 20:08:06  noel
"Removed a need to exclude fold level 1 headings.
"
"Revision 1.2  2003/08/16 19:02:44  noel
"First fully functional version. May need some tweaks but it works and is
"quite easy to use.
"
"Revision 1.1  2003/08/14 21:05:05  noel
"First publicly available, experiment version
"
"}}}2

" Load the plugin {{{1
" mappings {{{1
map <silent> <buffer> <localleader>h :call Hoist(line("."))<cr>
map <silent> <buffer> <localleader>H :call DeHoistThis(line("."))<cr>
"}}}1
if exists("g:did_vo_hoist")
	finish
endif
if !exists("g:hoistParanoia")
	let g:hoistParanoia=0
endif
let g:did_vo_hoist = 1
" Functions {{{1
" RemoveTabsLine(line,tabs) {{{2
" remove specified number of tabs from the beginning of line
function! RemoveTabsLine(line,tabs)
	return substitute(getline(a:line),"^\\(\\t\\)\\{".a:tabs."}", "", "")
endfunction
"}}}2
" MakeTempFilename(line) {{{2
" return a string to use as the temporary filename for the hoisted area
function! MakeTempFilename(line)
	return "vo_hoist.".a:line.strftime(".%Y%m%d%H%M%S").".otl"
endfunction
"}}}2
" AddHoistFilename(line) {{{2
" Add a temporary filename to a parent line to indicate hoisting
function! AddHoistFilename(line)
	let l:newparent = getline(a:line)." __hoist:".MakeTempFilename(a:line)
	call setline(a:line,l:newparent)
endfunction
"}}}2
"}}}2
" DeleteHoistFilename(line) {{{2
" Delete a temporary filename from a parent line
function! DeleteHoistFilename(line)
	call setline(a:line,substitute(getline(a:line)," __hoist:.*","",""))
endfunction
"}}}2
" ExtractHoistFilename(line) {{{2
" Extract a filename from a hoisted parent
function! ExtractHoistFilename(line)
	return substitute(getline(a:line),".* __hoist:","","")
endfunction
"}}}2
" IsParent(line) {{{2
" Return 1 if this line is a parent
function! IsParent(line)
	return (Ind(a:line)+1) == Ind(a:line+1)
endfunction
"}}}2
" IsHoistedParent(line) {{{2
" Return 1 if this line is a parent with hoisted children
function! IsHoistParent(line)
	return match(getline(a:line)," __hoist:","") != -1 
endfunction
"}}}2
" FindParent(line) {{{2
" Return line if parent, parent line if not
function! FindParent(line)
	if IsParent(a:line)
		return a:line
	else
		let l:parentindent = Ind(a:line)-1
		let l:searchline = a:line
		while (Ind(l:searchline) != l:parentindent) && (l:searchline > 0)
			let l:searchline = l:searchline-1
		endwhile
		return l:searchline
	endif
endfunction
"}}}2
" FindLastChild(line) {{{2
" Return the line number of the last descendent of parent line
function! FindLastChild(line)
	let l:parentindent = Ind(a:line)
	let l:searchline = a:line+1
	while Ind(l:searchline) > l:parentindent
		let l:searchline = l:searchline+1
	endwhile
	return l:searchline-1
endfunction
"}}}2
"}}}2
" Hoist(line) {{{2
" Write the offspring of a parent to a new file, open it and remove the 
" leading tabs.
function! Hoist(line)
	let l:parent = FindParent(a:line)
	if l:parent == 0
		return
	endif
	call cursor(l:parent,1)
	let l:firstline = l:parent+1
	let l:childindent = Ind(l:firstline)
	let l:lastline = FindLastChild(l:parent)
	let l:filename = MakeTempFilename(l:parent)
	echo l:firstline.",".l:lastline."w! ".l:filename
	let l:folded = foldclosed(l:parent)
	call cursor(l:parent,1)
	normal zo
	exe l:firstline.",".l:lastline."w! ".l:filename
	call AddHoistFilename(l:parent)
	silent write
	" log what we did in case we need to recover manually
	let l:doit = l:parent."write! >> .vo_hoist.".bufname(bufnr("%")).".log"
	exe l:doit
	let l:parentbuffer = bufnr("%")
	"WARNING: switching files
	let l:doit = "silent e +%s/^\\\\(\\\t\\\\)\\\\{"
	let l:doit = l:doit.l:childindent."}// ".l:filename." | "
	let l:doit = l:doit."let b:myParentBuffer = ".l:parentbuffer." | "
	let l:doit = l:doit."let b:myParentLine = ".l:parent." | "
	let l:doit = l:doit."call cursor(1,1)|"
	let l:doit = l:doit."let b:hoisted = 1"
	exe l:doit
	silent write
endfunction
"}}}2
" DeleteChildren(line) {{{2
" Delete the existing offspring of a parent
function! DeleteChildren(line)
	let l:parent = FindParent(a:line)
	let l:firstline = l:parent+1
	let l:lastline = FindLastChild(l:parent)
	exe l:firstline.",".l:lastline."d"
endfunction
"}}}2
" MakeTabString(n) {{{2
" Return a string of n tabs
function! MakeTabString(n)
	let l:string = ""
	let l:i = 0
	while l:i < a:n
		let l:string = l:string."\t"
		let l:i = l:i +1
	endwhile
	return l:string
endfunction
"}}}2
" AddChildren(line) {{{2
" Add left-justified children to parent. The filename is extracted from the 
" end of the parent line. The parent is assumed to have no children at this 
" point.
function! AddChildren(line)
	let l:filename = ExtractHoistFilename(a:line)
	if filereadable(l:filename) == 1
		if a:line == line("$")
			exe "read ".l:filename
			if a:line != line("$")
				exe a:line+1.",$"." s/^/".MakeTabString(Ind(a:line)+1)."/"
			endif
		else
			exe a:line+1."ma v"
			call cursor(a:line,1)
			exe "read ".l:filename
			if a:line+1 != line("'v")
				exe a:line+1.",'v-1"." s/^/".MakeTabString(Ind(a:line)+1)."/"
			endif
		endif
	endif
endfunction
"}}}2
" DeleteHoistFile(line) {{{2
" Delete a temporary filename from a parent line
function! DeleteHoistFile(line)
	if g:hoistParanoia
		return
	endif
	let l:filename = ExtractHoistFilename(a:line)
	call delete(l:filename)
	let l:filename = l:filename."~"
	call delete(l:filename)
endfunction
"}}}2
" DeHoistThis(line) {{{2
" Remove the old children, add the new children and remove the __hoist data
" leading tabs from this file.
function! DeHoistThis(line)
	let l:parent = FindParent(a:line)
	let l:folded = foldclosed(l:parent)
	call cursor(l:parent,1)
	if l:folded == l:parent
		normal zo
	endif
	call DeleteChildren(l:parent)
	call AddChildren(l:parent)
	call DeleteHoistFile(l:parent)
	call DeleteHoistFilename(l:parent)
	if l:folded == l:parent
		normal zc
	endif
endfunction
"}}}2
" DeHoist() {{{2
" Remove the old children, add the new children and remove the __hoist data
" leading tabs from the calling file.
function! DeHoist()
	silent write
	if bufexists(b:myParentBuffer) == 0
		return
	endif
	let l:myParentBuffer = b:myParentBuffer
	let l:myParentLine = b:myParentLine
	bdelete
	" Warning switching files
	exe "buffer ".l:myParentBuffer
	call cursor(l:myParentLine,1)
	let l:parent = FindParent(l:myParentLine)
	let l:folded = foldclosed(l:parent)
	call cursor(l:parent,1)
" 	if l:folded == l:parent
" 		normal zo
" 	endif
 	normal zv
	silent call DeleteChildren(l:parent)
	silent call AddChildren(l:parent)
	silent call DeleteHoistFile(l:parent)
	silent call DeleteHoistFilename(l:parent)
	if l:folded == l:parent
		call cursor(l:parent,1)
		normal zc
	endif
	silent write
endfunction
"}}}2
"}}}1
" Autocommands {{{1
	au BufReadPost vo_hoist.*.otl cmap <buffer> wq call DeHoist()
	au BufReadPost vo_hoist.*.otl cmap <buffer> qa call DeHoist()
	au BufReadPost vo_hoist.*.otl cmap <buffer> q call DeHoist()
	au BufReadPost vo_hoist.*.otl cmap <buffer> x call DeHoist()
	au BufReadPost vo_hoist.*.otl nmap <buffer> ZZ :call DeHoist()<cr>
"}}}1
" vim600: set foldlevel=0 foldmethod=marker:
vimoutliner/plugin/vo_smart_paste.vim	[[[1
74
" Here is a small script that remaps the p and P normal commands such that VO
" will do what one would expect when pasting cut/copied nodes into another
" section of an outline. It will adjust the indents and not paste into the
" middle of a branch.
" Added 2011-03-01(JB): This script will now also copy an outline correctly by
" using yy, and cut an outline by using \\d
" http://www.lists.vimoutliner.org/pipermail/vimoutliner/2008-October/002366.html

map <buffer>p :call VOput()<cr>
map <buffer>yy :call VOcop()<cr>
map <buffer>\\d :call VOcut()<cr>
map <buffer>P ]P

if exists('s:loaded')
	finish
endif
let s:loaded = 1

function! IsParent(line)
	if a:line == line("$")
		return 0
	elseif Ind(a:line) < Ind(a:line+1)
		return 1
	else
		return 0
	endif
endfunction


function! VOcop()
	let thisLine = line(".")
	if (foldclosed(thisLine) == -1) && IsParent(thisLine)
		normal! zc
		let fold_cursor = getpos(".")
		normal! yy
		let get_cursor = getpos(".")
	    call setpos('.',fold_cursor)
	    normal! zo
	    call setpos('.',get_cursor)
	else
		normal! yy
	endif
endfunction

function! VOcut()
	let thisLine = line(".")
	if (foldclosed(thisLine) == -1) && IsParent(thisLine)
		normal! zc
		let fold_cursor = getpos(".")
		normal! dd
		let get_cursor = getpos(".")
	    call setpos('.',fold_cursor)
	    normal! zo
	    call setpos('.',get_cursor)
	else
		normal! dd
	endif
endfunction

function! VOput()
	let thisLine = line(".")
	if (foldclosed(thisLine) == -1) && IsParent(thisLine)
		normal! zc
		let fold_cursor = getpos(".")
		normal! ]p
		let put_cursor = getpos(".")
		call setpos('.',fold_cursor)
		normal! zo
		call setpos('.',put_cursor)
	else
		normal! ]p
	endif
endfunction

vimoutliner/plugin/vo_sort_lists.vim	[[[1
12
function! s:sort_range(pat, start, end)
  let headlines = s:otl2list(getline(a:start, a:end))
  call sort(headlines)
  call setline(s:list2otl(headlines))
endfunction

function! s:otl2list(list)
  let the_list = copy(a:list)
  let min_indent = min(map(the_list, 'len(substitute(v:val,''\(^\s*\).*$'',''\1'', ""))'))
  let result = []
  for line in the_list
    
syntax/vo_base.vim	[[[1
313
"#########################################################################
"# syntax/vo_base.vim: VimOutliner syntax highlighting
"# version 0.3.6
"#   Copyright (C) 2001,2003 by Steve Litt (slitt@troubleshooters.com)
"#
"#   This program is free software; you can redistribute it and/or modify
"#   it under the terms of the GNU General Public License as published by
"#   the Free Software Foundation; either version 2 of the License, or
"#   (at your option) any later version.
"#
"#   This program is distributed in the hope that it will be useful,
"#   but WITHOUT ANY WARRANTY; without even the implied warranty of
"#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"#   GNU General Public License for more details.
"#
"#   You should have received a copy of the GNU General Public License
"#   along with this program; if not, write to the Free Software
"#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
"#
"# Steve Litt, slitt@troubleshooters.com, http://www.troubleshooters.com
"#########################################################################

" HISTORY {{{1
"#########################################################################
"#  V0.1.0 Pre-alpha
"#      Set of outliner friendly settings
"# Steve Litt, 5/28/2001
"# End of version 0.1.0
"# 
"#  V0.1.1 Pre-alpha
"#      No change
"# 
"# Steve Litt, 5/28/2001
"# End of version 0.1.1
"# 
"#  V0.1.2 Pre-alpha
"# 	No Change
"# Steve Litt, 5/30/2001
"# End of version 0.1.2
"#  V0.1.3 Pre-alpha
"# 	No Change
"# Steve Litt, 5/30/2001
"# End of version 0.1.3
"#  V0.2.0 
"# 	Noel Henson adds code for outliner-friendly expand and
"# 	collapse, comma comma commands, color coding, hooks for a
"# 	spellchecker, sorting, and date insertion.
"# Noel Henson, 11/24/2002
"# End of version 0.2.0
"# END OF HISTORY
"# 
"#########################################################################

" Level Colors {{{1
" colors for outline levels 1-9
" Light background {{{2
" added this next conditional at Dillon's recommendation
if &background == "light"
	hi OL1 guifg=black	ctermfg=black
	hi OL2 guifg=red	ctermfg=red
	hi OL3 guifg=blue	ctermfg=blue
	hi OL4 guifg=darkviolet	ctermfg=magenta
	hi OL5 guifg=black	ctermfg=black
	hi OL6 guifg=red	ctermfg=red
	hi OL7 guifg=blue	ctermfg=blue
	hi OL8 guifg=darkviolet	ctermfg=magenta
	hi OL9 guifg=black	ctermfg=black

	" colors for tags
	hi outlTags guifg=darkred	ctermfg=darkred

	" color for body text
	hi BT1 guifg=darkgreen	ctermfg=green
	hi BT2 guifg=darkgreen	ctermfg=green
	hi BT3 guifg=darkgreen	ctermfg=green
	hi BT4 guifg=darkgreen	ctermfg=green
	hi BT5 guifg=darkgreen	ctermfg=green
	hi BT6 guifg=darkgreen	ctermfg=green
	hi BT7 guifg=darkgreen	ctermfg=green
	hi BT8 guifg=darkgreen	ctermfg=green
	hi BT9 guifg=darkgreen	ctermfg=green

	" color for pre-formatted text
	hi PT1 guifg=darkblue	ctermfg=cyan
	hi PT2 guifg=darkblue	ctermfg=cyan
	hi PT3 guifg=darkblue	ctermfg=cyan
	hi PT4 guifg=darkblue	ctermfg=cyan
	hi PT5 guifg=darkblue	ctermfg=cyan
	hi PT6 guifg=darkblue	ctermfg=cyan
	hi PT7 guifg=darkblue	ctermfg=cyan
	hi PT8 guifg=darkblue	ctermfg=cyan
	hi PT9 guifg=darkblue	ctermfg=cyan

	" color for tables 
	hi TA1 guifg=darkviolet	ctermfg=cyan
	hi TA2 guifg=darkviolet	ctermfg=cyan
	hi TA3 guifg=darkviolet	ctermfg=cyan
	hi TA4 guifg=darkviolet	ctermfg=cyan
	hi TA5 guifg=darkviolet	ctermfg=cyan
	hi TA6 guifg=darkviolet	ctermfg=cyan
	hi TA7 guifg=darkviolet	ctermfg=cyan
	hi TA8 guifg=darkviolet	ctermfg=cyan
	hi TA9 guifg=darkviolet	ctermfg=cyan

	" color for user text (wrapping)
	hi UT1 guifg=darkred	ctermfg=cyan
	hi UT2 guifg=darkred	ctermfg=cyan
	hi UT3 guifg=darkred	ctermfg=cyan
	hi UT4 guifg=darkred	ctermfg=cyan
	hi UT5 guifg=darkred	ctermfg=cyan
	hi UT6 guifg=darkred	ctermfg=cyan
	hi UT7 guifg=darkred	ctermfg=cyan
	hi UT8 guifg=darkred	ctermfg=cyan
	hi UT9 guifg=darkred	ctermfg=cyan

	" color for user text (non-wrapping)
	hi UB1 guifg=darkgray	ctermfg=cyan
	hi UB2 guifg=darkgray	ctermfg=cyan
	hi UB3 guifg=darkgray	ctermfg=cyan
	hi UB4 guifg=darkgray	ctermfg=cyan
	hi UB5 guifg=darkgray	ctermfg=cyan
	hi UB6 guifg=darkgray	ctermfg=cyan
	hi UB7 guifg=darkgray	ctermfg=cyan
	hi UB8 guifg=darkgray	ctermfg=cyan
	hi UB9 guifg=darkgray	ctermfg=cyan

	" colors for folded sections
	hi Folded guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=white
	hi FoldColumn guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=white

	" colors for experimental spelling error highlighting
	" this only works for spellfix.vim which will cease to exist soon
	hi spellErr gui=underline guifg=darkred cterm=underline ctermfg=darkred
	hi BadWord gui=underline guifg=darkred cterm=underline ctermfg=darkred
" Dark background {{{2
else 
	hi OL1 guifg=white	ctermfg=white
	hi OL2 guifg=red	ctermfg=red
	hi OL3 guifg=lightblue	ctermfg=lightblue
	hi OL4 guifg=darkviolet	ctermfg=magenta
	hi OL5 guifg=white	ctermfg=white
	hi OL6 guifg=red	ctermfg=red
	hi OL7 guifg=lightblue	ctermfg=lightblue
	hi OL8 guifg=darkviolet	ctermfg=magenta
	hi OL9 guifg=white	ctermfg=white

	" colors for tags
	hi outlTags guifg=darkred	ctermfg=darkred

	" color for body text
	hi BT1 guifg=darkgreen	ctermfg=green
	hi BT2 guifg=darkgreen	ctermfg=green
	hi BT3 guifg=darkgreen	ctermfg=green
	hi BT4 guifg=darkgreen	ctermfg=green
	hi BT5 guifg=darkgreen	ctermfg=green
	hi BT6 guifg=darkgreen	ctermfg=green
	hi BT7 guifg=darkgreen	ctermfg=green
	hi BT8 guifg=darkgreen	ctermfg=green
	hi BT9 guifg=darkgreen	ctermfg=green

	" color for pre-formatted text
	hi PT1 guifg=darkblue	ctermfg=cyan
	hi PT2 guifg=darkblue	ctermfg=cyan
	hi PT3 guifg=darkblue	ctermfg=cyan
	hi PT4 guifg=darkblue	ctermfg=cyan
	hi PT5 guifg=darkblue	ctermfg=cyan
	hi PT6 guifg=darkblue	ctermfg=cyan
	hi PT7 guifg=darkblue	ctermfg=cyan
	hi PT8 guifg=darkblue	ctermfg=cyan
	hi PT9 guifg=darkblue	ctermfg=cyan

	" color for tables 
	hi TA1 guifg=darkviolet	ctermfg=cyan
	hi TA2 guifg=darkviolet	ctermfg=cyan
	hi TA3 guifg=darkviolet	ctermfg=cyan
	hi TA4 guifg=darkviolet	ctermfg=cyan
	hi TA5 guifg=darkviolet	ctermfg=cyan
	hi TA6 guifg=darkviolet	ctermfg=cyan
	hi TA7 guifg=darkviolet	ctermfg=cyan
	hi TA8 guifg=darkviolet	ctermfg=cyan
	hi TA9 guifg=darkviolet	ctermfg=cyan

	" color for user text (wrapping)
	hi UT1 guifg=darkred	ctermfg=cyan
	hi UT2 guifg=darkred	ctermfg=cyan
	hi UT3 guifg=darkred	ctermfg=cyan
	hi UT4 guifg=darkred	ctermfg=cyan
	hi UT5 guifg=darkred	ctermfg=cyan
	hi UT6 guifg=darkred	ctermfg=cyan
	hi UT7 guifg=darkred	ctermfg=cyan
	hi UT8 guifg=darkred	ctermfg=cyan
	hi UT9 guifg=darkred	ctermfg=cyan

	" color for user text (non-wrapping)
	hi UB1 guifg=darkgray	ctermfg=cyan
	hi UB2 guifg=darkgray	ctermfg=cyan
	hi UB3 guifg=darkgray	ctermfg=cyan
	hi UB4 guifg=darkgray	ctermfg=cyan
	hi UB5 guifg=darkgray	ctermfg=cyan
	hi UB6 guifg=darkgray	ctermfg=cyan
	hi UB7 guifg=darkgray	ctermfg=cyan
	hi UB8 guifg=darkgray	ctermfg=cyan
	hi UB9 guifg=darkgray	ctermfg=cyan

	" colors for folded sections
	hi Folded guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=black
	hi FoldColumn guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=black

	" colors for experimental spelling error highlighting
	" this only works for spellfix.vim which will cease to exist soon
	hi spellErr gui=underline guifg=yellow	cterm=underline ctermfg=yellow
	hi BadWord gui=underline guifg=yellow	cterm=underline ctermfg=yellow
endif

" Syntax {{{1
syn clear
syn sync fromstart

syn match outlTags '_tag_\w*' contained
syn match outlTags '_ilink_\s*\(.\{-}:\s\)\?.*' contained

" Noel's style of body text {{{2
syntax region BT1 start=+^ \S+ skip=+^ \S+ end=+^\S+me=e-1 end=+^\(\t\)\{1}\S+me=e-2 contains=spellErr,SpellErrors,BadWord contained
syntax region BT2 start=+^\(\t\)\{1} \S+ skip=+^\(\t\)\{1} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT3 start=+^\(\t\)\{2} \S+ skip=+^\(\t\)\{2} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT4 start=+^\(\t\)\{3} \S+ skip=+^\(\t\)\{3} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT5 start=+^\(\t\)\{4} \S+ skip=+^\(\t\)\{4} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT6 start=+^\(\t\)\{5} \S+ skip=+^\(\t\)\{5} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT7 start=+^\(\t\)\{6} \S+ skip=+^\(\t\)\{6} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT8 start=+^\(\t\)\{7} \S+ skip=+^\(\t\)\{7} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT9 start=+^\(\t\)\{8} \S+ skip=+^\(\t\)\{8} \S+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained

"comment-style bodytext as per Steve Litt {{{2
syntax region BT1 start=+^:+ skip=+^:+ end=+^\S+me=e-1 end=+^\(\t\)\{1}\S+me=e-2 contains=spellErr,SpellErrors,BadWord contained
syntax region BT2 start=+^\(\t\)\{1}:+ skip=+^\(\t\)\{1}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT3 start=+^\(\t\)\{2}:+ skip=+^\(\t\)\{2}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT4 start=+^\(\t\)\{3}:+ skip=+^\(\t\)\{3}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT5 start=+^\(\t\)\{4}:+ skip=+^\(\t\)\{4}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT6 start=+^\(\t\)\{5}:+ skip=+^\(\t\)\{5}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT7 start=+^\(\t\)\{6}:+ skip=+^\(\t\)\{6}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT8 start=+^\(\t\)\{7}:+ skip=+^\(\t\)\{7}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region BT9 start=+^\(\t\)\{8}:+ skip=+^\(\t\)\{8}:+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained

"Preformatted body text {{{2
syntax region PT1 start=+^;+ skip=+^;+ end=+^\S+me=e-1 end=+^\(\t\)\{1}\S+me=e-2 contains=spellErr,SpellErrors,BadWord contained
syntax region PT2 start=+^\(\t\)\{1};+ skip=+^\(\t\)\{1};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT3 start=+^\(\t\)\{2};+ skip=+^\(\t\)\{2};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT4 start=+^\(\t\)\{3};+ skip=+^\(\t\)\{3};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT5 start=+^\(\t\)\{4};+ skip=+^\(\t\)\{4};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT6 start=+^\(\t\)\{5};+ skip=+^\(\t\)\{5};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT7 start=+^\(\t\)\{6};+ skip=+^\(\t\)\{6};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT8 start=+^\(\t\)\{7};+ skip=+^\(\t\)\{7};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region PT9 start=+^\(\t\)\{8};+ skip=+^\(\t\)\{8};+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained

"Preformatted tables {{{2
syntax region TA1 start=+^|+ skip=+^|+ end=+^\S+me=e-1 end=+^\(\t\)\{1}\S+me=e-2 contains=spellErr,SpellErrors,BadWord contained
syntax region TA2 start=+^\(\t\)\{1}|+ skip=+^\(\t\)\{1}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA3 start=+^\(\t\)\{2}|+ skip=+^\(\t\)\{2}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA4 start=+^\(\t\)\{3}|+ skip=+^\(\t\)\{3}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA5 start=+^\(\t\)\{4}|+ skip=+^\(\t\)\{4}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA6 start=+^\(\t\)\{5}|+ skip=+^\(\t\)\{5}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA7 start=+^\(\t\)\{6}|+ skip=+^\(\t\)\{6}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA8 start=+^\(\t\)\{7}|+ skip=+^\(\t\)\{7}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region TA9 start=+^\(\t\)\{8}|+ skip=+^\(\t\)\{8}|+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained

"wrapping user text {{{2
syntax region UT1 start=+^>+ skip=+^>+ end=+^\S+me=e-1 end=+^\(\t\)\{1}\S+me=e-2 contains=spellErr,SpellErrors,BadWord contained
syntax region UT2 start=+^\(\t\)\{1}>+ skip=+^\(\t\)\{1}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT3 start=+^\(\t\)\{2}>+ skip=+^\(\t\)\{2}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT4 start=+^\(\t\)\{3}>+ skip=+^\(\t\)\{3}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT5 start=+^\(\t\)\{4}>+ skip=+^\(\t\)\{4}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT6 start=+^\(\t\)\{5}>+ skip=+^\(\t\)\{5}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT7 start=+^\(\t\)\{6}>+ skip=+^\(\t\)\{6}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT8 start=+^\(\t\)\{7}>+ skip=+^\(\t\)\{7}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UT9 start=+^\(\t\)\{8}>+ skip=+^\(\t\)\{8}>+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained

"non-wrapping user text {{{2
syntax region UB1 start=+^<+ skip=+^<+ end=+^\S+me=e-1 end=+^\(\t\)\{1}\S+me=e-2 contains=spellErr,SpellErrors,BadWord contained
syntax region UB2 start=+^\(\t\)\{1}<+ skip=+^\(\t\)\{1}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB3 start=+^\(\t\)\{2}<+ skip=+^\(\t\)\{2}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB4 start=+^\(\t\)\{3}<+ skip=+^\(\t\)\{3}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB5 start=+^\(\t\)\{4}<+ skip=+^\(\t\)\{4}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB6 start=+^\(\t\)\{5}<+ skip=+^\(\t\)\{5}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB7 start=+^\(\t\)\{6}<+ skip=+^\(\t\)\{6}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB8 start=+^\(\t\)\{7}<+ skip=+^\(\t\)\{7}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained
syntax region UB9 start=+^\(\t\)\{8}<+ skip=+^\(\t\)\{8}<+ end=+^\(\t\)*\S+me=s-1 contains=spellErr,SpellErrors,BadWord contained

"comment-style bodytext formatting as per Steve Litt
syntax match Comment "^\s*:.*$"
setlocal fo-=t fo+=crqno
setlocal com=sO:\:\ -,mO:\:\ \ ,eO:\:\:,:\:,sO:\>\ -,mO:\>\ \ ,eO:\>\>,:\>

" Headings {{{2
syntax region OL1 start=+^[^:\t]+ end=+^[^:\t]+me=e-1 contains=outlTags,BT1,BT2,PT1,PT2,TA1,TA2,UT1,UT2,UB1,UB2,spellErr,SpellErrors,BadWord,OL2 keepend
syntax region OL2 start=+^\t[^:\t]+ end=+^\t[^:\t]+me=e-2 contains=outlTags,BT2,BT3,PT2,PT3,TA2,TA3,UT2,UT3,UB2,UB3,spellErr,SpellErrors,BadWord,OL3 keepend
syntax region OL3 start=+^\(\t\)\{2}[^:\t]+ end=+^\(\t\)\{2}[^:\t]+me=e-3 contains=outlTags,BT3,BT4,PT3,PT4,TA3,TA4,UT3,UT4,UB3,UB4,spellErr,SpellErrors,BadWord,OL4 keepend
syntax region OL4 start=+^\(\t\)\{3}[^:\t]+ end=+^\(\t\)\{3}[^:\t]+me=e-4 contains=outlTags,BT4,BT5,PT4,PT5,TA4,TA5,UT4,UT5,UB4,UB5,spellErr,SpellErrors,BadWord,OL5 keepend
syntax region OL5 start=+^\(\t\)\{4}[^:\t]+ end=+^\(\t\)\{4}[^:\t]+me=e-5 contains=outlTags,BT5,BT6,PT5,PT6,TA5,TA6,UT5,UT6,UB5,UB6,spellErr,SpellErrors,BadWord,OL6 keepend
syntax region OL6 start=+^\(\t\)\{5}[^:\t]+ end=+^\(\t\)\{5}[^:\t]+me=e-6 contains=outlTags,BT6,BT7,PT6,PT7,TA6,TA7,UT6,UT7,UB6,UB7,spellErr,SpellErrors,BadWord,OL7 keepend
syntax region OL7 start=+^\(\t\)\{6}[^:\t]+ end=+^\(\t\)\{6}[^:\t]+me=e-7 contains=outlTags,BT7,BT8,PT7,PT8,TA7,TA8,UT7,UT8,UB7,UB8,spellErr,SpellErrors,BadWord,OL8 keepend
syntax region OL8 start=+^\(\t\)\{7}[^:\t]+ end=+^\(\t\)\{7}[^:\t]+me=e-8 contains=outlTags,BT8,BT9,PT8,PT9,TA8,TA9,UT8,UT9,UB8,UB9,spellErr,SpellErrors,BadWord,OL9 keepend
syntax region OL9 start=+^\(\t\)\{8}[^:\t]+ end=+^\(\t\)\{8}[^:\t]+me=e-9 contains=outlTags,BT9,PT9,TA9,UT9,UB9,spellErr,SpellErrors,BadWord keepend

" Auto-commands {{{1
if !exists("autocommand_vo_loaded")
	let autocommand_vo_loaded = 1
	au BufNewFile,BufRead *.otl                     setf outliner
"	au CursorHold *.otl                             syn sync fromstart
	set updatetime=500
endif

" The End
" vim600: set foldmethod=marker foldlevel=0:
vimoutliner/scripts/fs2otl	[[[1
7
#!/bin/sh
echo "$1"
echo "$1" | perl -pe 's/./-/g;'
cd "$1"
find . \
    | sort \
    | perl -pe 's|^\./||; s|[^/]+/|\t|g; s/([^\t])/[_] $1/;'
vimoutliner/scripts/Node/COPYING	[[[1
118
The Litt Perl Development Tools License
Version 1.0, 3/14/2003
---------------------------------------

The Litt Perl Development Tools License (LPDTL)
consists of the GNU GPL plus an exception, plus an
exception to that exception.

This program is free software; you can
redistribute it and/or modify it under the terms
of version 2 of the GNU General Public License as
published by the Free Software Foundation.

This program is distributed in the hope that it
will be useful, but WITHOUT ANY WARRANTY; without
even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General
Public License along with this software; see the
file COPYING.GPL. If not, write to the Free
Software Foundation, Inc., 59 Temple Place, Suite
330, Boston, MA 02111-1307 USA. Other locations
for the GNU General Public License include:

  http://www.troubleshooters.com/licenses/LPDTL/COPYING.GPL

and

  http://www.gnu.org/licenses/gpl.txt


THE EXCEPTION

As a special exception, the author of this Perl
Development Tool gives permission for additional
uses of the text contained in this Perl
Development Tool.

The exception is that, if you reference the LPDTL
licensed software, by use of a Perl "use" or
"require" statement, from other files, this does
not by itself cause the files referencing this
Perl Development Tool to be covered by the GNU
General Public License. Your use of the
referencing files is in no way restricted on
account of their referencing the code in this Perl
Development Tool.

Likewise, if you link the LPDTL licensed software
with other files to produce an executable, this
does not by itself cause the resulting executable
to be covered by the GNU General Public License.
Your use of that executable is in no way
restricted on account of linking the LPDTL
licensed software's code into it. 


EXCEPTION LIMITATIONS

This exception does not however invalidate any
other reasons why the referencing files, or any
produced executables, might be covered by the GNU
General Public License.

This exception applies only to the code released
by its author under the Litt Perl Development
Tools License.  Such code must clearly state that
it's covered by the Litt Perl Development Tools
License. If you copy code from other GNU-GPL
compatible software, as the General Public License
permits, the exception does not apply to the code
that you add in this way. To avoid misleading
anyone as to the status of such modified files,
you must delete this exception notice from them.

If you write modifications of your own for
software licensed under the Litt Perl Development
Tools License, it is your choice whether to permit
this exception to apply to your modifications. If
you do not wish that, delete this exception
notice. 

This exception cannot be applied to software whose
license, End User License Agreement, or Terms Of
Use limit reverse engineering or discussion about
the software. This exception cannot be applied to
software incorporating any type of software
patents.


THE EXCEPTION TO THE EXCEPTION

The intent of the Litt Perl Development Tools
License (LPDTL) is to produce a free software
development environment enabling a software
developer to create free software, nonfree
software, or proprietary software.  Therefore, all
of the resulting program's software development
features must be contained in the LPDTL licensed
software, or in GPL licensed software. It is a
violation of the LPDTL to place any software
development features in any file not licensed
under either the GPL or the LPDTL.

A "software development feature" is a feature
enabling creation or modification of software.


DISCUSSION OF INTENT OF THIS LICENSE

You can find a discussion of the intent of this
license in the LPDTL_discuss.txt file. If you
haven't been given a copy of this file, you can
find it in the
http://www.troubleshooters.com/licenses/LPDTL/
directory.
vimoutliner/scripts/Node/COPYING.GPL	[[[1
340
		    GNU GENERAL PUBLIC LICENSE
		       Version 2, June 1991

 Copyright (C) 1989, 1991 Free Software Foundation, Inc.
                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

			    Preamble

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation's software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Library General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps: (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author's protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone's free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.

		    GNU GENERAL PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The "Program", below,
refers to any such program or work, and a "work based on the Program"
means either the Program or any derivative work under copyright law:
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term "modification".)  Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program's
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.

  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.

  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and "any
later version", you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

			    NO WARRANTY

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

		     END OF TERMS AND CONDITIONS

	    How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
convey the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found.

    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


Also add information on how to contact you by electronic and paper mail.

If the program is interactive, make it output a short notice like this
when it starts in an interactive mode:

    Gnomovision version 69, Copyright (C) year name of author
    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, the commands you use may
be called something other than `show w' and `show c'; they could even be
mouse-clicks or menu items--whatever suits your program.

You should also get your employer (if you work as a programmer) or your
school, if any, to sign a "copyright disclaimer" for the program, if
necessary.  Here is a sample; alter the names:

  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
  `Gnomovision' (which makes passes at compilers) written by James Hacker.

  <signature of Ty Coon>, 1 April 1989
  Ty Coon, President of Vice

This General Public License does not permit incorporating your program into
proprietary programs.  If your program is a subroutine library, you may
consider it more useful to permit linking proprietary applications with the
library.  If this is what you want to do, use the GNU Library General
Public License instead of this License.
vimoutliner/scripts/Node/COPYING.LPDTL.1.0	[[[1
118
The Litt Perl Development Tools License
Version 1.0, 3/14/2003
---------------------------------------

The Litt Perl Development Tools License (LPDTL)
consists of the GNU GPL plus an exception, plus an
exception to that exception.

This program is free software; you can
redistribute it and/or modify it under the terms
of version 2 of the GNU General Public License as
published by the Free Software Foundation.

This program is distributed in the hope that it
will be useful, but WITHOUT ANY WARRANTY; without
even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General
Public License along with this software; see the
file COPYING.GPL. If not, write to the Free
Software Foundation, Inc., 59 Temple Place, Suite
330, Boston, MA 02111-1307 USA. Other locations
for the GNU General Public License include:

  http://www.troubleshooters.com/licenses/LPDTL/COPYING.GPL

and

  http://www.gnu.org/licenses/gpl.txt


THE EXCEPTION

As a special exception, the author of this Perl
Development Tool gives permission for additional
uses of the text contained in this Perl
Development Tool.

The exception is that, if you reference the LPDTL
licensed software, by use of a Perl "use" or
"require" statement, from other files, this does
not by itself cause the files referencing this
Perl Development Tool to be covered by the GNU
General Public License. Your use of the
referencing files is in no way restricted on
account of their referencing the code in this Perl
Development Tool.

Likewise, if you link the LPDTL licensed software
with other files to produce an executable, this
does not by itself cause the resulting executable
to be covered by the GNU General Public License.
Your use of that executable is in no way
restricted on account of linking the LPDTL
licensed software's code into it. 


EXCEPTION LIMITATIONS

This exception does not however invalidate any
other reasons why the referencing files, or any
produced executables, might be covered by the GNU
General Public License.

This exception applies only to the code released
by its author under the Litt Perl Development
Tools License.  Such code must clearly state that
it's covered by the Litt Perl Development Tools
License. If you copy code from other GNU-GPL
compatible software, as the General Public License
permits, the exception does not apply to the code
that you add in this way. To avoid misleading
anyone as to the status of such modified files,
you must delete this exception notice from them.

If you write modifications of your own for
software licensed under the Litt Perl Development
Tools License, it is your choice whether to permit
this exception to apply to your modifications. If
you do not wish that, delete this exception
notice. 

This exception cannot be applied to software whose
license, End User License Agreement, or Terms Of
Use limit reverse engineering or discussion about
the software. This exception cannot be applied to
software incorporating any type of software
patents.


THE EXCEPTION TO THE EXCEPTION

The intent of the Litt Perl Development Tools
License (LPDTL) is to produce a free software
development environment enabling a software
developer to create free software, nonfree
software, or proprietary software.  Therefore, all
of the resulting program's software development
features must be contained in the LPDTL licensed
software, or in GPL licensed software. It is a
violation of the LPDTL to place any software
development features in any file not licensed
under either the GPL or the LPDTL.

A "software development feature" is a feature
enabling creation or modification of software.


DISCUSSION OF INTENT OF THIS LICENSE

You can find a discussion of the intent of this
license in the LPDTL_discuss.txt file. If you
haven't been given a copy of this file, you can
find it in the
http://www.troubleshooters.com/licenses/LPDTL/
directory.
vimoutliner/scripts/Node/deletetest.otl	[[[1
18
Top
	Level2
	Level2b
		Level3
			deleteme
				gone
				gone
			deleteme
				gone
				gone
			this should stay
				deleteme
			deleteme
				gone
				gone
		Level3b
	2level2
Top2
vimoutliner/scripts/Node/example_attribs.pl	[[[1
162
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

#####################################################################
# This exercise demonstrates the use of attributes for each node.
# Attributes are facts about an entity, rather than an entity itself.
# In real practice, many times attributes can be substituted for nodes
# and vice versa. However, an attribute CANNOT have children.
#
# This is the first exercise using multiple Walker objects. The first
# Walker object counts each node's children, and if the node has
# children, it creates an attribute named "children" for that node.
# The value of the attribute is the number of direct children for
# that node.
#
# Nodes are accessed two ways in the cbPrintNode() callback. The entire
# attribute hash is accessed with hasAttributes and getAttributes(), 
# while single named attributes are accessed with hasAttributes and
# getAttributes(). 
# 
# One more action that's demonstrated is the use of secondary navigation
# within a callback routine. For each node, the callback routine
# navigates to the first child and then each successive sibling of that
# child in order to count the direct children. This is a common
# algorithm with Node.pm. It might look inefficient, and you might be
# tempted to perform the count during the callback that prints the
# information. Don't do it. Multiple walkers help keep Node.pm 
# enabled programs easy to understand and modify. Because the 
# entire node tree is in memory, the double navigation isn't
# particularly slow.
#
# Real world programs make heavy use of multiple walkers. For instance,
# the EMDL to UMENU program (not packaged here) has over 10 walkers.
#
#####################################################################

use strict;	# prevent hard to find errors

use Node;	# Use Note.pm tool

package Callbacks;
sub new()
	{
	my($type) = $_[0];
	my($self) = {};
	bless($self, $type);
	$self->{'errors'} = 0;
	$self->{'warnings'} = 0;
	return($self);
	}

sub getErrors(){return $_[0]->{'errors'};}
sub getWarnings(){return $_[0]->{'warnings'};}

sub cbCountChildren()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;}
	
	my $childCount=0;
	if($checker->hasFirstChild())
		{
		$childCount++;
		my $checker2 = $checker->getFirstChild();
		while($checker2->hasNextSibling())
			{
			$childCount++;
			$checker2 = $checker2->getNextSibling();
			}
		$checker->setAttribute("children", $childCount);
		}
	}

sub cbPrintNode()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	for(my $n=0; $n < $level; $n++) {print "\t";}
	print "* ";
	print $checker->getValue();		# print the text of the node
	print "\n";

	for(my $n=0; $n <= $level; $n++) {print "\t";}
	print "(";

	my %attribs = {};
	%attribs = $checker->getAttributes() if $checker->hasAttributes();

	my @keys = keys(%attribs);
	foreach my $key (sort @keys)
		{
		print $key, "=", $attribs{$key}, "; ";
		}

	print ")\n";

	if($checker->hasAttribute("children"))
		{
		for(my $n=0; $n <= $level; $n++) {print "\t";}
		print "This node has ";
		print $checker->getAttribute("children");
		print " children.\n";
		}
	}

package Main;

sub main()
	{
	#### PARSE FROM FILE README.otl
	my $parser = OutlineParser->new();		# instantiate parser
	$parser->setCommentChar("#");			# ignore lines starting with #
	$parser->fromFile();				# get input from file
	my $topNode=$parser->parse("README.otl");

	#====================================================================
	# The preceding statement parses file README.otl into a node hierarchy
	# and assigns the top level node of that hierarchy to $topNode. When
	# you run the program you'll notice that the text in $topNode does
	# not appear in README.otl, but instead has value
	# "Inserted by OutlineParser".
	#
	# This is a feature, not a bug. In order to accommodate the typical
	# case of an outline having several top level items, and yet still
	# be able to represent the whole hierarchy as a single top node,
	# the OutlineParser object creates a new node with value
	# " Inserted by OutlineParser"
	# and places all the outline's top level items under that newly
	# created node.
	#
	# If the outline you're working on is guaranteed to have only
	# a single top level item, and if you want that to be the top
	# level node, you can simply do the following:
	#
	# $topNode=$topNode->getFirstChild();
	#====================================================================

	#### INSTANTIATE THE Callbacks OBJECT
	my $callbacks = Callbacks->new();

	#### WALK THE NODE TREE,
	#### OUTPUTTING LEVEL AND TEXT
	my $walker = Walker->new
		(
		$topNode,				
		[\&Callbacks::cbCountChildren, $callbacks]
		);
	$walker->walk();
	my $walker = Walker->new
		(
		$topNode,				
		[\&Callbacks::cbPrintNode, $callbacks]
		);
	$walker->walk();
	}

main();
vimoutliner/scripts/Node/example_bylevel.pl	[[[1
227
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

use strict;	# prevent hard to find errors

use Node;	# Use Node.pm tool

#####################################################################
# The Walker object walks the node hierarchy recursively. That is,
# it goes deep before going laterally. That's just what's needed for
# many applications. However, sometimes it's necessary to look at 
# one level at a time.
#
# There are many ways to accomplish this. Some involve sorting and
# merging. Many involve arrays of nodes on a given level, and
# plunging one deep into each one.
#
# In this example we'll start with a walker that assigns the full
# path to each node as an attribute of that node. We'll then loop
# through all levels starting with 0, and for each one we'll print all
# children of nodes at that level. Every time there's a parent change,
# we'll print a header for that parent.
#
# This example also illustrates the use of variables within the 
# Callback object. You might have wondered why callbacks must be
# part of an object rather than free floating functions. The answer
# is that the use of callbacks as object methods means that we can
# keep totals and break logic variables within the callback object,
# thereby eliminating the (nasty) necessity of global variables.
#
# We cannot simply pass variables into and out of callback
# routines because, by the very nature of a callback routine,
# its arguments and return type are strictly predefined. In the
# case of Node.pm the arguments are always $self, $checker and 
# $level. To get any other information into or out of the callback
# routine, we must use a non-callback method of the same object.
#
# It should be noted that there's nothing wrong with having
# multiple callback objects. If there are numerous callback 
# routines it might make sense to group them by functionality,
# or by totals and persistent variables they must keep track of.
# 
# As you run, study and understand this code, be aware that converting
# a hierarchy to a list by levels is a very difficult and complex task.
# Imagine keeping a list of children, and for each level using those
# children to find the next generation, and rewriting the array. Or
# prepending a level number followed by a child index on each line, 
# and then sorting the whole array by the level number and child
# index, and finally running a routine to output the formatted 
# output, complete with break logic and headers.
#
# Now consider how easy Node.pm made this job. First, a trivial
# Walker to calculate full paths, then a level loop calling a
# Walker to print only children of nodes at the desired level. The
# code is short, and it's very readable and understandable. The 
# callback routines are short enough that you can safely use non-
# structured techniques such as returning from the middle instead
# of using nested if statements. The result is even more readability.
#
# One could make the (very valid) point that nodes are visited many
# times to process each once, and that this is not efficient in
# terms of runtime performance. Absolutely true!
#
# However, the programming simplicity prevents truly collosal
# efficency problems, such as cascading intermediate files, sorts,
# and the various other CPU cycle grabbers that seem to crop up
# in complex algorithms. And remember, the entire tree is in memory,
# with navigation via simple pointers, so the environment of Node.pm
# favors runtime speed.
#
# Case in point. My original EMDL to UMENU converter was such an
# epic production that I needed to study it for 4 hours every time
# I made a minor improvement. I had developed it using informal OOP
# and structured techniques, and had paid close attention to
# efficiency. The resulting program took 15 seconds to convert a
# 2300 line EMDL file.
#
# I rewrote the converter using Node.pm. This was a complete
# rewrite -- all new code -- no salvage. It was so much simpler
# that I wrote it in 12 hours. But I was very concerned with
# runtime. If the 15 seconds doubled, this would be a hassle,
# and if it quadrupled it would be totally impractical. When 
# I ran it, the program did everything the original did, but
# did it in 2 seconds. Node.pm had given me a 7 fold speed 
# increase.
# 
#####################################################################

package Callbacks;
sub new()
	{
	my($type) = $_[0];
	my($self) = {};
	bless($self, $type);
	$self->{'errors'} = 0;
	$self->{'warnings'} = 0;
	$self->{'childrenatlevel'} = 0;
	$self->{'currentlevel'} = 0;
	$self->{'previousparentfullpath'} = "initialize";
	return($self);
	}

sub getErrors(){return $_[0]->{'errors'};}
sub getWarnings(){return $_[0]->{'warnings'};}

sub getChildrenAtLevel(){return $_[0]->{'childrenatlevel'};}
sub setChildrenAtLevel(){$_[0]->{'childrenatlevel'} = $_[1];}
sub incChildrenAtLevel(){$_[0]->{'childrenatlevel'}++;}

sub getCurrentLevel(){return $_[0]->{'currentlevel'};}
sub setCurrentLevel(){$_[0]->{'currentlevel'} = $_[1];}

sub cbCalculateFullPath()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	if($checker->hasParent)
		{
		my $fullpath = $checker->getParent()->getAttribute("fullpath");
		$fullpath .= "/";
		$fullpath .= $checker->getValue();
		$checker->setAttribute("fullpath", $fullpath);
		}
	else
		{
		$checker->setAttribute("fullpath", $checker->getValue());
		}
	}

sub cbPrintNode()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	#### DO NOTHING UNLESS THIS NODE IS AT THE CURRENTLY SOUGHT LEVEL
	return unless $level == $self->getCurrentLevel();

	#### DO NOTHING UNLESS THIS NODE HAS CHILDREN
	return unless $checker->hasFirstChild();

	#### PRINT HEADER
	print "\n", $checker->getAttribute("fullpath"), "\n";
	
	#### PRINT CHILDREN AND COUNT CHILDREN AT LEVEL
	my $checker2 = $checker->getFirstChild(); # We returned if there wasn't one
	print "\t", $checker2->getValue(), "\n";
	$self->incChildrenAtLevel();

	while($checker2->hasNextSibling())
		{
		$checker2 = $checker2->getNextSibling();
		print "\t", $checker2->getValue(), "\n";
		$self->incChildrenAtLevel();
		}
	}


package Main;

sub main()
	{
	#### PARSE FROM FILE README.otl
	my $parser = OutlineParser->new();		# instantiate parser
	$parser->setCommentChar("#");			# ignore lines starting with #
	$parser->fromFile();				# get input from file
	my $topNode=$parser->parse("README.otl");


	#### INSTANTIATE THE Callbacks OBJECT
	my $callbacks = Callbacks->new();

	#### WALK THE NODE TREE,
	#### CALCULATING FULL PATHS AND PUTTING THEM IN AN ATTRIBUTE
	my $walker = Walker->new
		(
		$topNode,				# start with this node
		[\&Callbacks::cbCalculateFullPath, $callbacks]	# do this on entry to each node
		);
	$walker->walk();

	#### PRINT LEVEL 0
	print "\n\n********** BEGIN LEVEL ", "0", "\n";
	print "\t", $topNode->getValue(), "\n";

	#### SET STARTING PARENT LEVEL,
	#### AND SET $childCount SO THE LOOP WILL FIRE THE FIRST TIME
	my $level=0;
	my $childCount=9999;

	#==================================================================
	# The main loop follows, level by level. At each level, nodes are
	# queried for their children, which are then printed below the
	# node's full path. The result is a list of nodes sorted by
	# level.
	#
	# We add 1 to the level in the level header because we're referring
	# to the level of the children, not of the current node. We keep 
	# looping to deeper levels until a level counts no children.
	#
	# This logic result in an empty level header at the bottom. If this
	# were a big concern, we could print the level headers in the
	# Callbacks::cbPrintNode() callback, with slightly altered logic.
	# However, it's a minor point, so for simplicity we print the
	# level header at the top of this loop in the main routine.
	#==================================================================
	while($childCount > 0)
		{
		print "\n\n********** BEGIN LEVEL ", $level + 1, "\n";
		$callbacks->setChildrenAtLevel(0);
		$callbacks->setCurrentLevel($level);
		my $walker = Walker->new
			(
			$topNode,
			[\&Callbacks::cbPrintNode, $callbacks]
			);
		$walker->walk();
		$childCount = $callbacks->getChildrenAtLevel();
		$level++;
		}
	}

main();
vimoutliner/scripts/Node/example_delete.pl	[[[1
107
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

use strict;	# prevent hard to find errors

use Node;	# Use Node.pm tool

#####################################################################
# This exercise demonstrates the deletion of nodes.
#
# Because Perl is a garbage collection language, node deletion
# DOES NOT deallocate memory and the like. However, in the absense
# of a copy of the node, it will be garbage collected and unavailable.
# Also, the deletion process specificly undef's the deleted node's
# first and last children.
#
# You noticed I mentioned keeping a copy. The algorithm of a Walker
# object moves a node around the tree like a checker. Calling
# $checker->deleteSelf() does not render $checker undefined. In fact,
# it still has its parent, nextSibling and previousSibling pointers
# intact. What this means is that the Walker's next iteration goes
# to exactly the same node as it would have if the deletion had not
# taken place. In other words, you do not need to "move the checker
# back one" after a deletion.
#
# This makes deletion algorithms very simple.
#
# There may come a time when you want to delete a node but keep its
# children. In that case, you must first attach its children to nodes
# that will not be deleted. 
#
#####################################################################

package Callbacks;
sub new()
	{
	my($type) = $_[0];
	my($self) = {};
	bless($self, $type);
	$self->{'errors'} = 0;
	$self->{'warnings'} = 0;
	return($self);
	}

sub getErrors(){return $_[0]->{'errors'};}
sub getWarnings(){return $_[0]->{'warnings'};}

sub cbDelete()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	#### DELETE THIS NODE IF ITS VALUE CONTAINS deleteme
	my $text = "init";
	$text = $checker->getValue() if $checker->hasValue();
	if($text =~ m/deleteme/)
		{
		$checker->deleteSelf();
		}
	}

sub cbPrintNode()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;}

	for(my $n=0; $n < $level; $n++) {print "\t";}
	print $checker->getValue(), "\n";
	}

package Main;

sub main()
	{
	#### PARSE FROM FILE README.otl
	my $parser = OutlineParser->new();
	$parser->setCommentChar("#");
	$parser->fromFile();
	my $topNode=$parser->parse("deletetest.otl");

	#### INSTANTIATE THE Callbacks OBJECT
	my $callbacks = Callbacks->new();

	#### WALK THE NODE TREE,
	#### DELETING NODES WITH "deleteme" IN THEM
	my $walker = Walker->new
		(
		$topNode,
		[\&Callbacks::cbDelete, $callbacks]
		);
	$walker->walk();

	#### WALK THE NODE TREE,
	#### OUTPUTTING LEVEL AND TEXT
	$walker = Walker->new
		(
		$topNode,
		[\&Callbacks::cbPrintNode, $callbacks]
		);
	$walker->walk();
	}

main();
vimoutliner/scripts/Node/example_hello.pl	[[[1
15
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

use strict;	# prevent hard to find errors
use Node;	

my $topNode = Node->new("myname", "mytype", "myvalue");
print "\n::: ";
print $topNode->getName(), " ::: ";
print $topNode->getType(), " ::: ";
print $topNode->getValue(), " :::\n";
vimoutliner/scripts/Node/example_insert.pl	[[[1
550
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

use strict;	# prevent hard to find errors

use Node;	# Use Node.pm tool

#####################################################################
# WARNING: This is a difficult exercise. Do not attempt this exercise
# until you have completed the prerequisites listed in the README.otl
# file.
#
# I suggest you approach this example starting with the main routine
# at the bottom of the file, and then drilling down into subroutines
# and callbacks. Understand the big picture before drilling down.
#
# This exercise demonstrates insertion of nodes, and much, much more.
# Insertion is accomplished by the insertFirstChild(), 
# insertSiblingBeforeYou(), insertSiblingAfterYou(), and
# insertLastChild() methods. The insertLastChild() method is not
# demonstrated.
#
# This exercise is VERY contrived. It is contrived to show techniques
# of building a node tree using insertions, and also how to switch
# two nodes. The switching of the two nodes is especially contrived,
# but I could think of no better way of demonstrating node moving.
#
# This exercise builds a tree that represents a date book type calendar.
# Level 0 is Calender, level 1 are the years, of which there is only 2004,
# Level 2 are the months, level 3 the days, and level 4 the hour long
# timeslots. There is no provision for weekends, nor after hours
# appointments. It is a demonstration only.
#
# Using an array of month names and an array of days per month, you build
# the month and day levels using a nested loop. The hour level is built
# using a Walker. Node names are things like "January" or 31 or
# "11:00-12:00". Node types are things like "Year", "Month", "Day" or
# "Hour". Node values are undefined unless an appointment is made, in 
# which case the value is the node text.
#
# A special Walker is used to mark any day, month or year entities
# if they contain appointments. Specifically, all appointments in that
# day, month or year are counted, and that number of stars are placed
# beside the day, month or year. This is implemented by using an
# return callback so that by the time the callback is called, all children
# have been calculated.
#
#####################################################################

package Callbacks;
sub new()
	{
	my($type) = $_[0];
	my($self) = {};
	bless($self, $type);
	$self->{'errors'} = 0;
	$self->{'warnings'} = 0;
	return($self);
	}

sub getErrors(){return $_[0]->{'errors'};}
sub getWarnings(){return $_[0]->{'warnings'};}

#=================================================================
# The cbMakeMarks() callback is called on return to a node from
# its children (return callback). It executes only on year, month 
# and day nodes. It iterates through all its immediate children,
# totalling up the "appointments" attribute and setting its
# own attribute to that total. Remember, because this is a
# callback triggered on return from children, it is guaranteed
# that all children have been counted, and that all those children
# have totalled their children, etc.
#
# In the case of a day node, instead of totalling the "appointments"
# attribute, it counts the number of hour nodes with defined values.
# A defined value on an hour node is an appointment.
#
# Last but not least, on non-zero counts, this callback sets the
# day, month or year node's value to a number of asterisks equal
# to the number of appointments in its subtree.
#
# Read this code carefully. Once you understand it, you'll have
# many insights to Node.pm.
#=================================================================
sub cbMakeMarks()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	#### PROCESS ONLY DAY, MONTH OR YEAR NODES
	unless		(
			$checker->getType() eq "Day" ||
			$checker->getType() eq "Month" ||
			$checker->getType() eq "Year"
			)
		{
		return;
		}

	my $count = 0;
	my $childNode = $checker->getFirstChild();
	while(defined($childNode))
		{
		if($checker->getType() eq "Day")
			{
			if(defined($childNode->getValue()))
				{
				$count++;
				}
			}
		else
			{
			if($childNode->hasAttribute("appointments"))
				{
				$count += $childNode->getAttribute("appointments");
				}
			}
		$childNode = $childNode->getNextSibling();
		}
	$checker->setAttribute("appointments", $count);
	if($count > 0)
		{
		my $string;
		for(my $n=0; $n < $count; $n++){$string .= '*';}
		$checker->setValue($string);
		}
	}

#=================================================================
# The cbInsertHours() callback operates ONLY on day nodes. When
# called from a day node, it inserts hourlong appointment slots
# starting at 8am and ending at 5pm. The code is pretty 
# straightforward.
#=================================================================
sub cbInsertHours()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node


	return unless $checker->getType() eq "Day"; # Insert hours under days only

	my $checker2;
	for(my $n=8; $n <= 16; $n++)
		{
		my $startHour = "$n:00";
		my $n2 = $n + 1;
		my $endHour = "$n2:00";
		my $node = Node->new("$startHour" . "-" . "$endHour", "Hour", undef);
		if($checker->hasFirstChild())
			{
			$checker2 = $checker2->insertSiblingAfterYou($node);
			}
		else
			{
			$checker2 = $checker->insertFirstChild($node);
			}
		}
	}

#=================================================================
# The cbPrintNode() callback prints the name of the node,
# and its value if a value is defined. It's very straighforward.
#=================================================================
sub cbPrintNode()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	#### DON'T PRINT LEVEL 0 (CALENDER)
	return if $level == 0;

	for(my $n=1; $n < $level; $n++) { print "\t";}

	print $checker->getName() if $checker->hasName();
	print ":   ";

	print $checker->getValue() if $checker->hasValue();
	print "\n";
	}


#=================================================================
# The cbPrintNodeDiagnosic() callback is not used, but provided
# for any necessary debugging.
#=================================================================
sub cbPrintNodeDiagnostic()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node

	for(my $n=0; $n < $level; $n++) { print "\t";}

	print ">";
	print $checker->getName() if $checker->hasName();
	print " ::: ";

	print $checker->getType() if $checker->hasType();
	print " ::: ";

	print $checker->getValue() if $checker->hasValue();
	print "<\n";
	}

package Main;

###########################################################################
# The insertDays() subroutine handles insertion of days below all
# month nodes.
###########################################################################
sub makeAppointments($)
	{
	my $yearNode = shift;
	#### MARCH 22  AT 8AM
	my $monthNode = $yearNode->getFirstChild() ->		#January
			getNextSibling() ->			#February
			getNextSibling();			#March
	my $dayNode = $monthNode->getFirstChild();
	while($dayNode->getName() != 22)
		{
		$dayNode = $dayNode->getNextSibling();
		unless(defined($dayNode))
			{
			die "No March 22\n";
			}
		}
	my $hourNode = $dayNode->getFirstChild();
	$hourNode->setValue("Spring Cleaning");

	#### JUNE 22  AT 9AM
	#### WRONGLY LABELED AS FALL FESTIVAL
	#### INSTEAD OF SUMMER BREAK
	$monthNode = $monthNode->getNextSibling() ->		# April
			getNextSibling() ->			# May
			getNextSibling();			# June
	$dayNode = $monthNode->getFirstChild();
	while($dayNode->getName() != 22)
		{
		$dayNode = $dayNode->getNextSibling();
		unless(defined($dayNode))
			{
			die "No June 22\n";
			}
		}
	$hourNode = $dayNode->getFirstChild()->getNextSibling();
	$hourNode->setValue("Fall Festival");

	#### SEPTEMBER 22  AT 10AM
	#### WRONGLY LABELED AS FALL FESTIVAL
	#### INSTEAD OF SUMMER BREAK
	$monthNode = $monthNode->getNextSibling() ->		# July
			getNextSibling() ->			# August
			getNextSibling();			# September
	$dayNode = $monthNode->getFirstChild();
	while($dayNode->getName() != 22)
		{
		$dayNode = $dayNode->getNextSibling();
		unless(defined($dayNode))
			{
			die "No September 22\n";
			}
		}
	$hourNode = $dayNode -> getFirstChild() ->		#8-9
				getNextSibling() ->		# 9-10
				getNextSibling();		# 10-11
	$hourNode->setValue("Summer Break");

	#### DECEMBER 22 FROM 3PM TO 5PM (2 TIMESLOTS)
	#### HAPPY HOLIDAYS PARTY
	$monthNode = $monthNode->getNextSibling() ->		# October
			getNextSibling() ->			# November
			getNextSibling();			# December
	$dayNode = $monthNode->getFirstChild();
	while($dayNode->getName() != 22)
		{
		$dayNode = $dayNode->getNextSibling();
		unless(defined($dayNode))
			{
			die "No December 22\n";
			}
		}
	$hourNode = $dayNode->getFirstChild();
	while($hourNode->getName() ne "15:00-16:00")
		{
		$hourNode = $hourNode->getNextSibling();
		unless(defined($hourNode))
			{
			die "No 4pm slot\n";
			}
		}
	$hourNode->setValue("Happy Holidays Party");
	$hourNode = $hourNode->getNextSibling();
	$hourNode->setValue("Happy Holidays Party");

	#### DECEMBER 30 AT 9AM BUY PARTY SUPPLIES
	while($dayNode->getName() != 30)
		{
		$dayNode = $dayNode->getNextSibling();
		unless(defined($dayNode))
			{
			die "No December 30\n";
			}
		}
	$hourNode = $dayNode->getFirstChild()->getNextSibling();
	$hourNode->setValue("Buy Party Supplies");
	}

###########################################################################
# The insertMonthsAndDays() subroutine handles insertion of months
# below the year, and days below every month. It works by iterating through
# an array of months, and finding number of days in an array of month
# lengths. It does NOT use the Node.pm navigational system to find months.
# Use of the Node.pm navigational system for this purpose is demonstrated
# in the insertion of hours in all days.
#
# Note that we could have avoided using a nested loop by using a Walker
# and associated callback to install the days under every month. In such
# a case the array of month lengths would have been placed in the Callback
# object. However, for the sake of variety, we chose to use a nested loop
# to load the months and days.
###########################################################################
sub insertMonthsAndDays($)
	{
	my $yearNode = shift;
	my $checker = $yearNode;
	my $checker2;
	my @monthNames=("January", "February", "March", "April", "May",
		"June", "July", "August", "September", "October",
		"November", "December");
	my @monthLengths=(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	my $monthSS = 0;
	foreach my $monthName (@monthNames)
		{
		my $node = Node->new($monthName, "Month", undef);
		$node->setAttribute("days", $monthLengths[$monthSS]);
		if($yearNode->hasFirstChild())
			{
			$checker = $checker->insertSiblingAfterYou($node);
			}
		else
			{
			$checker = $yearNode->insertFirstChild($node);
			}
		for(my $n=1; $n <= $monthLengths[$monthSS]; $n++)
			{
			$node = Node->new($n, "Day", undef);
			if($checker->hasFirstChild())
				{
				$checker2 = $checker2->insertSiblingAfterYou($node);
				}
			else
				{
				$checker2 = $checker->insertFirstChild($node);
				}
			}
		$monthSS++;
		}
	}

###########################################################################
# This subroutine switches the June 22 9am appointment and the
# September 22 10am appointment. In each case, both the appointment
# text and the time needed switching.
#
# The sane way to accomplish this task would have been to modify
# the nodes in place. However, this subroutine was created solely to 
# demonstrate the movement of nodes, so that's what we did.
#
# Note that the fact that the two are at different times complicates the
# situation. It's not enough to just trade nodes -- the Sept 9am node
# must be placed after the existing June 10am node, which itself is after
# the erroneous June 9am node containing what should be September's 
# appointment. After such placement, the original June 9am node must
# have its name updated so that it is a 10am node. A similar process
# takes place for September. The original nodes are also deleted.
#
# Please follow the (convoluted and contrived) logic:
#   1. Store the June hour node in $juneNode
#   2. Store the September hour node in $septNode
#   3. After the existing June 10am, place a CLONE of the Sept appointment
#   4. Before the existing Sept 9am,  place a CLONE of the June appointment
#   5. Delete the original June appointment
#   6. Delete the original September appointment
#   7. On the original June 10am node, make it 9am
#   8. On the original September 9am node, make it 10am
###########################################################################
sub switchJuneAndSeptemberAppointments($)
	{
	my $yearNode = shift;

	#### FIND NODE FOR JUNE 22 9AM APPOINTMENT
	my $juneNode = $yearNode->getFirstChild();
	while(defined($juneNode))
		{
		last if $juneNode->getName() eq "June";
		$juneNode = $juneNode->getNextSibling();
		}
	die "Cannot find month of June\n" unless defined($juneNode);

	$juneNode = $juneNode->getFirstChild();
	while(defined($juneNode))
		{
		last if $juneNode->getName() eq "22";
		$juneNode = $juneNode->getNextSibling();
		}
	die "Cannot find June 22\n" unless defined($juneNode);

	$juneNode = $juneNode->getFirstChild();
	while(defined($juneNode))
		{
		last if $juneNode->getName() eq "9:00-10:00";
		$juneNode = $juneNode->getNextSibling();
		}
	die "Cannot find June 22 at 9am\n" unless defined($juneNode);

	#### FIND NODE FOR SEPTEMBER 22 10AM APPOINTMENT
	my $septNode = $yearNode->getFirstChild();
	while(defined($septNode))
		{
		last if $septNode->getName() eq "September";
		$septNode = $septNode->getNextSibling();
		}
	die "Cannot find month of September\n" unless defined($septNode);

	$septNode = $septNode->getFirstChild();
	while(defined($septNode))
		{
		last if $septNode->getName() eq "22";
		$septNode = $septNode->getNextSibling();
		}
	die "Cannot find September 22\n" unless defined($septNode);

	$septNode = $septNode->getFirstChild();
	while(defined($septNode))
		{
		last if $septNode->getName() eq "10:00-11:00";
		$septNode = $septNode->getNextSibling();
		}
	die "Cannot find September 22 at 9am\n" unless defined($septNode);

	#### SWITCH THE NODES
	my $newJune = $juneNode->getNextSibling()->insertSiblingAfterYou($septNode->clone());
	my $newSept = $septNode->getPrevSibling()->insertSiblingBeforeYou($juneNode->clone());
	$juneNode->deleteSelf();
	$septNode->deleteSelf();

	#### FIX NAMES OF SURROUNDING CLONES
	$newJune->getPrevSibling()->setName("9:00-10:00");
	$newSept->getNextSibling()->setName("10:00-11:00");

	return;
	}


###########################################################################
# In the main routine, you carry out or delegate the following tasks
# in order to create an appointment calendar:
#   1. Insert single level 0 and 1 nodes
#   2. Instantiate the Callbacks object
#   3. Insert all month and day nodes
#   4. Insert all hour nodes
#   5. Make appointments
#         erroneously switching the june 22 & Sept 22 appointments
#   6. Mark days, months and years containing appointments
#   7. Output the calendar
#   8. Switch back June22 and Sept22
#   9. Re mark days, months and years
#   10. Output a separator between bad and good calendars
#   11. Re output the calendar
#
###########################################################################
sub main()
	{
	#### INSERT SINGLE LEVEL 0 AND 1 NODES
	my $topNode=Node->new("Calender", "Calender", "Calender");
	my $yearNode=$topNode->insertFirstChild(Node->new("2004", "Year", undef));

	#### INSTANTIATE THE Callbacks OBJECT
	my $callbacks = Callbacks->new();

	#### INSERT MONTH AND DAY NODES
	insertMonthsAndDays($yearNode);

	#### INSERT THE HOURS USING A Walker
	my $walker = Walker->new
		(
		$topNode,
		[\&Callbacks::cbInsertHours, $callbacks]
		);
	$walker->walk();


	#### MAKE A FEW APPOINTMENTS
	#### ACCIDENTALLY SWITCHING SUMMER AND FALL
	makeAppointments($yearNode);

	#### MARK DAYS, MONTHS AND YEAR THAT HAVE APPOINTMENTS
	#### USING A WALKER WITH ONLY A RETURN CALLBACK
	$walker = Walker->new
		(
		$topNode,
		undef,
		[\&Callbacks::cbMakeMarks, $callbacks]
		);
	$walker->walk();

	#### WALK THE NODE TREE,
	#### OUTPUTTING THE CALENDER
	$walker = Walker->new
		(
		$topNode,				# start with this node
		[\&Callbacks::cbPrintNode, $callbacks]	# do this on entry to each node
		);
	$walker->walk();

	#### CORRECT THE MISTAKE
	#### SWITCH JUNE 22 AND SEPT 22
	switchJuneAndSeptemberAppointments($yearNode);

	#### RE-MARK DAYS, MONTHS AND YEAR THAT HAVE APPOINTMENTS
	#### USING A WALKER WITH ONLY A RETURN CALLBACK
	$walker = Walker->new
		(
		$topNode,
		undef,
		[\&Callbacks::cbMakeMarks, $callbacks]
		);
	$walker->walk();

	#### OUTPUT A SEPARATOR BETWEEN ORIGINAL AND CORRECTED CALENDARS
	for (my $n=0; $n<5; $n++)
		{
		print "######################################################\n";
		}

	#### RE-WALK THE NODE TREE,
	#### RE-OUTPUTTING THE CALENDER
	$walker = Walker->new
		(
		$topNode,				# start with this node
		[\&Callbacks::cbPrintNode, $callbacks]	# do this on entry to each node
		);
	$walker->walk();
	}

main();
vimoutliner/scripts/Node/example_nodepath.pl	[[[1
135
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

use strict;	# prevent hard to find errors

#####################################################################
# Node.pm is a tool you will probably use in many projects located
# in varying directories. How do you enable those projects to
# include Node.pm? Here are some ways:
#   1. Place Node.pm in the project's directory
#   2. Place Node.pm on Perl's module path
#   3. Run the project as perl -I/path/to/Node project.pl
#   4. Shebang line #!/usr/bin/perl -w -I/path/to/Node
#   
# Number 1 can become problematic as the number of apps using Node.pm
# increases. If you have 30 different copies in 30 different directories,
# how do you keep them all up to date.
#
# Number 2 is a much better option. It works. However, which @INC
# directory do you place it in? When you update Perl or your distribution,
# it goes away.
#
# Number 3 is great, except you need to create a shellscript to call
# Perl with your program as an argument. BE SURE not to leave a space
# between the -I and the directory, or that space actually becomes
# part of the directory.
#
# Number 4 is greater, because it doesn't require a shellscript. Once
# again, no space between -I and the directory. In all cases where 
# you know what directory will contain Node.pm, number 4 is a great
# alternative. 
#
# But what if you don't know in advance what directory
# will contain Node.pm? What if you're writing an application to be
# run at varying locations with varying setups? What if, in addition,
# you don't want the end user messing with the source code to change
# the shebang line? In that case, you can actually place the path
# to Node.pm in a configuration file. It takes several lines of code,
# but it's certainly nice to be able to accommodate the user's
# environment without requiring change to the source code.
#
# This exercise demonstrates how to set the Node.pm location from a
# configuration file. Once again, if you're the sole user it might be
# better to change the shebang line, but if you're distributing
# your program like the autumn leaves, a configuration file is the 
# way to go.
#
#####################################################################


#####################################################################
# The loadNodeModule() subroutine is a complete substitute for:
#    use Node
# 
# It includes:
#	require Node;
#	import Node;
# 
# The preceding two calls completely replace a use Node statement,
# and better still, unlike the use statement, they happen at 
# runtime instead of compile time. Therefore, this subroutine reads
# the directory from a config file, then executes that directory
# with the proper require and import statements. Obviously, the
# loadNodeModule() subroutine must be executed before any code depending
# on the Node.pm module is executed.
#####################################################################
sub loadNodeModule()
	{
	#### CHANGE THE FOLLOWING TO CHANGE THE DEFAULT APP FILENAME
	my $defaultConfFileName = "./myapp.cfg";

	#### CHANGE THE FOLLOWING TO CHANGE APP FILENAME ENVIRONMENT VAR
	my $envVarName = "MY_APP_CONFIG";

	my($conffile) = $ENV{$envVarName};
	print $conffile, "\n" if defined $conffile;
	$conffile = $defaultConfFileName unless defined($conffile);
	print "Using config file $conffile.\n";

	open CONF, '<' . $conffile or die "FATAL ERROR: Could not open config file $conffile.";
	my @lines = <CONF>;
	close CONF;

	my @nodedirs;
	foreach my $line (@lines)
		{
		chomp $line;
		if($line =~ m/^\s*nodedir\s*=\s*([^\s]*)/)
			{
			my $dir = $1;
			if($dir =~ m/(.*)\$HOME(.*)/)
				{
				$dir = $1 . $ENV{'HOME'} . $2;
				}
			push @nodedirs, ($dir);
			}
		}

	if(@nodedirs)
		{
		unshift @INC, @nodedirs;
		}

	require Node;
	import Node;
	}

#####################################################################
# The main() routine calls loadNodeModule to include Node.pm,
# and then runs a few lines of code to conclusively prove that
# Node.pm is loaded. It also prints out the @INC array to show that
# directory in which Node.pm resides is now in the @INC path.
#
# Note that in the absense of any change to the environment variable
# defined in loadNodeModule(), the configuration file will be ./myapp.cfg.
#####################################################################
sub main()
	{
	loadNodeModule();
	my $topNode = Node->new("myname", "mytype", "myvalue");
	print "\n::: ";
	print $topNode->getName(), " ::: ";
	print $topNode->getType(), " ::: ";
	print $topNode->getValue(), " :::\n";
	foreach my $line (@INC)
		{
		print $line, "\n";
		}
	}

main();
vimoutliner/scripts/Node/example_otl2markup.pl	[[[1
123
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

#####################################################################
# This exercise demonstrates use of the return callback routine. The
# return callback routine occurs when node navigation returns to a 
# node from its children. Therefore, the return callback routine is
# never executed by nodes without children.
#
# An obvious use of the return callback routine is to print end tags
# for nested markup. A node's end tag must follow all markup for all
# the node's children, so the return callback is perfect for that
# purpose.
#
# Because childless nodes never execute the return callback routine, 
# in the case of childless nodes this program prints the end tags
# from the entry callback routine.
#
# This program prints the attributes of each Node object. You'll 
# immediately note that the "children" attributes you set are printed.
# But you'll also observe that a "_lineno" attribute has been set for
# all nodes except the top one. That attribute was set by the Parser
# object, and corresponds to the line in the parsed outline file. This
# attribute is extremely helpful in printing error messages.
#####################################################################


use strict;	# prevent hard to find errors

use Node;	# Use Note.pm tool

package Callbacks;
sub new()
	{
	my($type) = $_[0];
	my($self) = {};
	bless($self, $type);
	$self->{'errors'} = 0;
	$self->{'warnings'} = 0;
	return($self);
	}

sub getErrors(){return $_[0]->{'errors'};}
sub getWarnings(){return $_[0]->{'warnings'};}

##############################################################
# cbPrintTag is the entry callback, and is called on first
# entry to each node. It prints the start tag and text. If
# the node is a leaf level node, it also prints the end tag
# on the same line.
##############################################################
sub cbPrintTag()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;}
	
	#### PRINT START TAG AND CONTENT
	for(my $n = 0; $n < $level; $n++) {print "\t";}
	print "<node level=", $level, ">";
	print $checker->getValue() if $checker->hasValue();

	#### IF THIS IS A LEAF LEVEL ITEM, PRINT THE
	#### END TAG IMMEDIATELY. OTHERWISE, THE
	#### RETURN CALLBACK WILL TAKE CARE OF THE END TAG.
	unless($checker->hasFirstChild())
		{
		print "</node>";
		}

	#### PRINT NEWLINE
	print "\n";
	}

##############################################################
# cbPrintEndTag is the return callback, and is called on reentry
# to the node, after all its children have been processed.
# It is not called by leaf level (childless) nodes. The purpose
# of this routine is to print the end tag.
#
# For nodes with children, the end tag must be printed after
# all information for the node's children has been printed,
# in order to preserve proper nesting.
##############################################################
sub cbPrintEndTag()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;}
	
	#### PRINT END TAG FOR PARENT
	for(my $n = 0; $n < $level; $n++) {print "\t";}
	print "</node>";
	print "\n";
	}

package Main;

sub main()
	{
	#### PARSE FROM FILE README.otl
	my $parser = OutlineParser->new();
	$parser->setCommentChar("#");
	$parser->fromFile();	
	my $topNode=$parser->parse("README.otl");

	#### INSTANTIATE THE Callbacks OBJECT
	my $callbacks = Callbacks->new();

	#### WALK THE NODE TREE,
	#### OUTPUTTING LEVEL AND TEXT
	my $walker = Walker->new
		(
		$topNode,				# start with this node
		[\&Callbacks::cbPrintTag, $callbacks],	# do this on entry to each node
		[\&Callbacks::cbPrintEndTag, $callbacks]# do this on return from node's children
		);
	$walker->walk();
	}

main();
vimoutliner/scripts/Node/example_parse.pl	[[[1
114
#!/usr/bin/perl -w

# Copyright (C) 2004 by Steve Litt
# Licensed with the GNU General Public License, Version 2
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK
# See http://www.gnu.org/licenses/gpl.txt

use strict;	# prevent hard to find errors

use Node;	# Use Node.pm tool

#####################################################################
# This exercise demonstrates the most elemental use of Node.pm.
# It does nothing more than read README.otl into a Node tree, and
# then print the tree.
#
# Here's the high level logic:
# 	Set up a Callback object to house the callback routines
# 	Instantiate and configure a Parser object to parse README.otl
# 	Instantiate a Walker object to walk the resulting node tree
# 	Link Callbacks::cbPrintNode() as the Walker's entry callback
#
#####################################################################

##############################################################
# You need an object to house callback routines. The object can
# be named anything, but it should have facilities to count up
# errors and warnings. Its new() method should always be something
# like what you see below, and there should have getErrors() and
# getWarnings() methods.
#
# The cbPrintNode() method is typical of a simple callback routine.
# All callback routines have exactly three arguments, $self, 
# $checker and $level. $self refers to the object containing
# the callback routine, $checker is the node that called this
# callback routine, and $level is the level of that node in the
# hierarchy. Armed with these pieces of information, you can 
# perform almost any operation on the current node ($checker).
#
# The callback routines are called by the Parser object during
# parsing. A callback routine can be called upon first entry 
# into a node, or it can be called upon reentry into that node
# after processing all that node's children. The latter is
# an excellent way of outputting end tags at the proper time.
##############################################################
package Callbacks;
sub new()
	{
	my($type) = $_[0];
	my($self) = {};
	bless($self, $type);
	$self->{'errors'} = 0;
	$self->{'warnings'} = 0;
	return($self);
	}

sub getErrors(){return $_[0]->{'errors'};}
sub getWarnings(){return $_[0]->{'warnings'};}

sub cbPrintNode()
	{
	my($self, $checker, $level) = @_;
	unless (defined($checker)) {return -999;} # don't process undef node
	print $level, " ::: ";			# print the level
	print $checker->getValue();		# print the text of the node
	print "\n";
	}

package Main;

sub main()
	{
	#### PARSE FROM FILE README.otl
	my $parser = OutlineParser->new();		# instantiate parser
	$parser->setCommentChar("#");			# ignore lines starting with #
	$parser->fromFile();				# get input from file
	my $topNode=$parser->parse("README.otl");

	#====================================================================
	# The preceding statement parses file README.otl into a node hierarchy
	# and assigns the top level node of that hierarchy to $topNode. When
	# you run the program you'll notice that the text in $topNode does
	# not appear in README.otl, but instead has value
	# "Inserted by OutlineParser".
	#
	# This is a feature, not a bug. In order to accommodate the typical
	# case of an outline having several top level items, and yet still
	# be able to represent the whole hierarchy as a single top node,
	# the OutlineParser object creates a new node with value
	# " Inserted by OutlineParser"
	# and places all the outline's top level items under that newly
	# created node.
	#
	# If the outline you're working on is guaranteed to have only
	# a single top level item, and if you want that to be the top
	# level node, you can simply do the following:
	#
	# $topNode=$topNode->getFirstChild();
	#====================================================================

	#### INSTANTIATE THE Callbacks OBJECT
	my $callbacks = Callbacks->new();

	#### WALK THE NODE TREE,
	#### OUTPUTTING LEVEL AND TEXT
	my $walker = Walker->new
		(
		$topNode,				# start with this node
		[\&Callbacks::cbPrintNode, $callbacks]	# do this on entry to each node
		);
	$walker->walk();
	}

main();
vimoutliner/scripts/Node/INSTALL	[[[1
23
INSTALLATION PROCEDURES FOR Node.pm
	Version 0.2.0 released 5/13/2004

Downloading
	Download from
		http://www.troubleshooters.com/projects/Node/Node.#.#.#.tgz
Installing
	The tarball extracts into a directory called Node
	cd to the directory into which you want to place Node
	Move any existing Node directory out of the way
	tar xzvf Node.#.#.#.tgz
Testing
	cd into the Node directory
	./hello.pl
	troubleshoot as necessary
Using
	In any perl program using Node not in the Node directory...
		Use following code at beginning
			#!/usr/bin/perl -w -I/path/to/Node
			use strict;
			use Node;
		If destination machine has unknown Node.pm directory...
			See example_nodepath.pl
vimoutliner/scripts/Node/LPDTL_discuss.txt	[[[1
26
INTENT OF THE LITT PERL DEVELOPMENT TOOL LICENSE

The intent of the Litt Perl Development Tool License (LPDTL) is to provide
programmers with a development tool that is copylefted free software without
requiring applications built from this tool to be free software.

I (Steve Litt) have tried to craft the LPDTL to prevent "cute and
innovative" ways of taking this tool private. For instance, a person might
try to make the LPDTL licensed code dependent on subroutines in proprietary
subroutines. This is why the LPDTL has a clause stating that all
*development* features must reside in the LPDTL code, or in GPL code, but
not non-GPL-compatible code.

Although the LPDTL allows its use with software of almost any license, it
specifically forbids use with licenses doing any of the following:

1. Restricting reverse engineering

2. Restricting discussion about the software

3. Code that includes software patents

I feel that restrictions on reverse engineering and discussion, and software
patents, are so destructive to society, that I have included language
preventing use of LPDTL licensed code with any software incorporating any of
these three atrocities.
vimoutliner/scripts/Node/myapp.cfg	[[[1
4
#### THIS FILE CONFIGURES example_nodepath.pl.
#### IN ORDER TO USE example_nodepath.pl,
#### CHANGE FOLLOWING PATH TO THE DIRECTORY WHERE YOU PLACED Node.pm ####
nodedir=/path/to/nodemodule
vimoutliner/scripts/Node/Node.pm	[[[1
475
#!/usr/bin/perl -w

#######################################################################
# Copyright (C) 2003 by Steve Litt, all rights reserved.
# Licensed under version 1 of the 
#    Litt Perl Development Tools License
# See COPYING file
# Or COPYING.LPDTL.1.0
# Or see http://www.troubleshooters.com/licenses/LPDTL/COPYING.LPDTL.1.0
#
# ABSOLUTELY NO WARRANTY, USE AT YOUR OWN RISK!
#
# Version 0.2.0 released 5/13/2004

use strict;

package Node;
sub new($$$$)
	{
	my($typeOfClass) = $_[0];
	my($self) = {};
	bless($self, $typeOfClass);

	$self->{'name'}=$_[1];
	$self->{'type'}=$_[2];
	$self->{'value'}=$_[3];


	$self->{'nextsibling'}=undef;
	$self->{'prevsibling'}=undef;
	$self->{'parent'}=undef;
	$self->{'firstchild'}=undef;
	$self->{'lastchild'}=undef;

	$self->{'attributes'}={};

	return($self);
	}


#### For single attribute
sub setAttribute()
	{
	$_[0]->{'attributes'}->{$_[1]} = $_[2];
	}

sub removeAttribute()
	{
	delete $_[0]->{'attributes'}->{$_[1]};
	}

sub getAttribute()
	{
	if($_[0]->hasAttributes())
		{
		return $_[0]->{'attributes'}->{$_[1]};
		}
	else
		{
		return(undef);
		}
	}

sub hasAttribute()
	{
	if($_[0]->hasAttributes())
		{
		return defined($_[0]->getAttribute($_[1]));
		}
	else
		{
		return(undef);
		}
	}

#### For attribute array
sub hasAttributes()
	{
	return defined($_[0]->getAttributes());
	}
sub getAttributes()
	{
	return %{$_[0]->{'attributes'}};
	}

sub setAttributes()
	{
	$_[0]->{'attributes'} = $_[1];
	}




#### For traversing
sub getFirstChild()             {return($_[0]->{'firstchild'});}
sub getNextSibling()            {return($_[0]->{'nextsibling'});}
sub getParent()                 {return($_[0]->{'parent'});}        

sub hasFirstChild()             {return(defined($_[0]->{'firstchild'}));}
sub hasNextSibling()            {return(defined($_[0]->{'nextsibling'}));}
sub hasParent()                 {return(defined($_[0]->{'parent'}));}        

#### For reverse traversing
sub getLastChild()              {return($_[0]->{'lastchild'});}
sub getPrevSibling()            {return($_[0]->{'prevsibling'});}

sub hasLastChild()              {return(defined($_[0]->{'lastchild'}));}
sub hasPrevSibling()            {return(defined($_[0]->{'prevsibling'}));}

#### For content
sub getName()                   {return($_[0]->{'name'});}
sub getType()                   {return($_[0]->{'type'});}
sub getValue()                  {return($_[0]->{'value'});}       
sub setName()                   {$_[0]->{'name'} = $_[1];}
sub setType()                   {$_[0]->{'type'} = $_[1];}
sub setValue()                  {$_[0]->{'value'} = $_[1];}

sub hasName()                   {return(defined($_[0]->{'name'}));}
sub hasType()                   {return(defined($_[0]->{'type'}));}
sub hasValue()                  {return(defined($_[0]->{'value'}));}       

#### For setting pointers, should probably be private or protected
sub setFirstChild()             {$_[0]->{'firstchild'} = $_[1];}
sub setNextSibling()            {$_[0]->{'nextsibling'} = $_[1];}
sub setParent()                 {$_[0]->{'parent'} = $_[1];}        
sub setLastChild()              {$_[0]->{'lastchild'} = $_[1];}
sub setPrevSibling()            {$_[0]->{'prevsibling'} = $_[1];}

#### For creation
sub insertSiblingBeforeYou()
	{
	my($self) = $_[0];
	my($oldPrevSibling) = $self->getPrevSibling();
	$self->setPrevSibling($_[1]);
	$self->getPrevSibling()->setParent($self->getParent());
	$self->getPrevSibling()->setNextSibling($self);
	if(!defined($oldPrevSibling))
		{
		$self->getParent()->setFirstChild($self->getPrevSibling());
		$self->getPrevSibling()->setPrevSibling(undef);
		}
	else
		{
		$self->getPrevSibling()->setPrevSibling($oldPrevSibling);
		$oldPrevSibling->setNextSibling($self->getPrevSibling());
		}
	return($self->getPrevSibling());
	}

sub insertSiblingAfterYou()
	{
	my($self) = $_[0];
	my($oldNextSibling) = $self->getNextSibling();
	$self->setNextSibling($_[1]);
	$self->getNextSibling()->setParent($self->getParent());
	$self->getNextSibling()->setPrevSibling($self);
	if(!defined($oldNextSibling))
		{
		if(defined($self->getParent()))
			{
			$self->getParent()->setLastChild($self->getNextSibling());
			}
		$self->getNextSibling()->setNextSibling(undef);
		}
	else
		{
		$self->getNextSibling()->setNextSibling($oldNextSibling);
		$oldNextSibling->setPrevSibling($self->getNextSibling());
		}
	return($self->getNextSibling());
	}

sub insertFirstChild()
	{
	my($self) = $_[0];
	my($oldFirstChild) = $self->getFirstChild();
	if(defined($oldFirstChild))
		{
		$oldFirstChild->insertSiblingBeforeYou($_[1]);
		}
	else
		{
		$self->setFirstChild($_[1]);
		$self->setLastChild($_[1]);
		$self->getFirstChild()->setParent($self);
		}
	return($self->getFirstChild());
	}

sub insertLastChild()
	{
	my($self) = $_[0];
	my($oldLastChild) = $self->getLastChild();
	if(defined($oldLastChild))
		{
		$oldLastChild->insertSiblingAfterYou($_[1]);
		}
	else
		{
		$self->setFirstChild($_[1]);
		$self->setLastChild($_[1]);
		$self->getFirstChild()->setParent($self);
		}
	return($self->getLastChild());
	}

#### For cloning
sub clone()
	{
	my($self) = $_[0];
	my($clone) = Node->new();
	$clone->setName($self->getName());
	$clone->setType($self->getType());
	$clone->setValue($self->getValue());

	$clone->setParent($self->getParent());
	$clone->setFirstChild($self->getFirstChild());
	$clone->setLastChild($self->getLastChild());
	$clone->setPrevSibling($self->getPrevSibling());
	$clone->setNextSibling($self->getNextSibling());
	return($clone);
	}

#### For deletion
sub deleteSelf()
	{
	my($self) = $_[0];
	my($prev) = $self->getPrevSibling();
	my($next) = $self->getNextSibling();
	my($parent) = $self->getParent();
	if((defined($self->getPrevSibling()))&&(defined($self->getNextSibling())))
		{
		$self->getNextSibling()->setPrevSibling($self->getPrevSibling());
		$self->getPrevSibling()->setNextSibling($self->getNextSibling());
		}
	elsif((!defined($self->getPrevSibling()))&&(!defined($self->getNextSibling())))
		{
		$self->getParent()->setFirstChild(undef);
		$self->getParent()->setLastChild(undef);
		}
	elsif(!defined($self->getPrevSibling()))
		{
		$self->getParent()->setFirstChild($self->getNextSibling());
		$self->getNextSibling()->setPrevSibling(undef);
		}
	elsif(!defined($self->getNextSibling()))
		{
		$self->getParent()->setLastChild($self->getPrevSibling());
		$self->getPrevSibling()->setNextSibling(undef);
		}
	$self->setFirstChild(undef);
	$self->setLastChild(undef);
	}

sub deleteTree()
	{
	my($self) = $_[0];

#	#### Code to delete children and decendents here
	$self->deleteSelf();
	}

package OutlineParser;
sub new()
	{
	my($typeOfClass) = $_[0];
	my($self) = {};
	bless($self, $typeOfClass);
	$self->{'head'} = Node->new("Header Node", "Head", "Inserted by OutlineParser");
	$self->{'fromstdin'} = 1;
	$self->{'zapblanks'} = 1;
	return($self);
	}

sub setCommentChar($$)
	{
	$_[0]->{'commentchar'} = $_[1];
	}

sub getCommentChar($)
	{
	return($_[0]->{'commentchar'});
	}

sub hasCommentChar($)
	{
	return(defined($_[0]->{'commentchar'}));
	}

sub getFirstNonBlankChar($$)
	{
	my $self = shift;
	my $line = shift;
	chomp $line;
	my @parts = split(/\s+/,$line, 2);
	$line = join('', @parts);
	my $firstchar = substr($line, 0, 1);
	return $firstchar;
	}


sub parse()
	{
	my($self) = $_[0];
	my($fname) = $_[1];

	my(@levelStack);
	push(@levelStack, ($self->{'head'}));
	my($checker) = $self->{'head'};
	my($lineno) = 0;
	my($prevLevel) = -1;

	my($inf);
	if($self->{'fromstdin'} == 0)
		{
		defined($fname) or die "OutlineParser::parse() requires a filename argument, terminating.\n";
		open(INF, "<" . $fname) or die "OutlineParser::parse() could not open $fname for input, terminating.\n";
		$inf = q(INF);
		}
	else
		{
		$inf = qw(STDIN);
		}
	while(<$inf>)
		{
		my($line) = $_;
		chomp($line);
		$lineno++;
		my $zapFlag = 0;
		my $firstNonBlankChar = $self->getFirstNonBlankChar($line);
		if(($self->{'zapblanks'} != 0) && ($firstNonBlankChar eq ''))
			{
			$zapFlag = 1;
			}
		if($self->hasCommentChar() && ($self->getCommentChar() eq $firstNonBlankChar))
			{
			$zapFlag = 1;
			}
		
		unless($zapFlag)
			{
			my($level) = 0;

			$line =~ m/^(	*)(.*)/;
			if(defined($1))
				{
				$level = length($1);
				$line = $2;
				}
			else
				{
				$line = $2;
				}

			my $node = Node->new("", "Node", $line);
			$node->setAttribute('_lineno', $lineno);

			if($level == $prevLevel)
				{
				$levelStack[$prevLevel]->insertSiblingAfterYou($node);
				$levelStack[$level] = $node;
				}
			elsif($level == $prevLevel + 1)
				{
				$levelStack[$prevLevel]->insertFirstChild($node);
				$levelStack[$level] = $node;
				}
			elsif($level > $prevLevel + 1)
				{
				die "Multiple indent at line $lineno, \"$line\", terminating.\n";
				}
			elsif($level < $prevLevel)
				{
				my($dedent) = $prevLevel - $level;
				while($level < $prevLevel)
					{
					pop(@levelStack);
					$prevLevel--;
					}
				$levelStack[$prevLevel]->insertSiblingAfterYou($node);
				$levelStack[$level] = $node;
				}
			$prevLevel = $level;
			}
		}
	if($self->{'fromstdin'} == 0) {close(INF);}
	return($self->getHead());
	}

sub fromStdin() {$_[0]->{'fromstdin'} = 1;}
sub fromFile() {$_[0]->{'fromstdin'} = 0;}
sub zapBlanks() {$_[0]->{'zapblanks'} = 1;}
sub dontZapBlanks() {$_[0]->{'zapblanks'} = 0;}
sub getHead() {return($_[0]->{'head'});}


package Walker;
sub new()
	{
	my $typeOfClass = $_[0];
	my $self = {};
	bless($self, $typeOfClass);
	$self->{'top'} = $_[1];
	$self->{'entrycallback'} = $_[2];
	$self->{'exitcallback'} = $_[3];
	return($self);
	}

sub walk()
	{
	my($self) = $_[0];
	my($ascending) = 0;
	my($checker)=$self->{'top'}; # like a checker you move around a board
	my($level)=0;
	my($continue) = 1;
	my $counter = 0;
	while($continue)
		{
		if($ascending == 0)
			{
			if(defined($self->{'entrycallback'}))
				{
				my @args = @{$self->{'entrycallback'}};
				my $sub = shift(@args);
				push(@args, ($checker, $level));
				&{$sub}(@args);
				}
			if($level < 0) {$continue=0;} ## Callback sets negative to terminate
			}
		else
			{
			if(defined($self->{'exitcallback'}))
				{
				my @args = @{$self->{'exitcallback'}};
				my $sub = shift(@args);
				push(@args, ($checker, $level));
				&{$sub}(@args);
				}
			if($level < 0) {$continue=0;} ## Callback sets negative to terminate
			if($checker == $self->{'top'}) {$continue=0;}
			}

		if($continue == 0)
			{
			#skip this if/elsif/else entirely
			}
		elsif(($ascending == 0) && (defined($checker->getFirstChild())))
			{
			$ascending = 0;
			$checker = $checker->getFirstChild();
			$level++;
			}
		elsif((defined($checker->getNextSibling())) && ($checker != $self->{'top'}))
			{
			$ascending = 0;
			$checker = $checker->getNextSibling();
			}
		elsif(defined($checker->getParent()))
			{
			$ascending = 1;
			$checker = $checker->getParent();
			$level--;
#			if($level < 1) {$continue = 0;}
			}
		else
			{
			$continue = 0;
			}
		$counter++;
		}
	}


1;

vimoutliner/scripts/Node/README.otl	[[[1
177
MANUAL FOR THE Node.pm Tool
	Version 0.2.0 released 5/13/2004
License
	Litt Perl Development Tools License, version 1
		See COPYING file
		This license is the GNU GPL with an exception
			See COPYING.GPL
	NO WARRANTY!!!!! See COPYING.GPL
Purpose
	Handling hierarchies in Perl
	Implements a tree of nodes
	Each node has a name, a type, a value, and optionally attributes
	Each node can have zero, one or many attributes
	Each attribute has a name and a value
	Especially made to handle tab indented outlines in memory
Learning Node.pm
	Learn from the example programs: Study them in this order:
		example_hello.pl
		example_parse.pl
		example_otl2markup.pl
		example_attribs.pl
		example_bylevel.pl
		example_delete.pl
		example_insert.pl
		example_nodepath.pl
	That's the only way to learn this tool
	Do each example program in order
		Run
		Read
		Study
	Example programs
		example_hello.pl
			Proof of concept
			7 lines of perl
			Instantiate and read from a Node object
		example_parse.pl
			Parse a tab indented outline file into a Node tree
			Use a Walker object to walk the tree and print the Nodes
			Create a Callback object and callback routine
		example_otl2markup.pl
			Use return callback to create end tags
		example_attribs.pl
			Set and get Node attributes
			Observer "_lineno" attribute,
				which was set by the Parser object
		example_bylevel.pl
			Read the Node tree recursively and output by level
			Use the Callbacks object to store information
			Use multiple callbacks to simplify a complex algorithm
			Observe that the performance is still quite good
		example_delete.pl
			Delete nodes during a callback
			Observe that the Walker object takes the deletion in stride
			Observe that the Walker object does not "lose its place"
		example_insert.pl
			Insert nodes
			Build a Node tree without an outline or Parser object
			Create child nodes using an array
			Create child nodes from a callback routine
			Use a return callback to count occurrences within in its subtree
			Access and use a Node's name, type and value
			Move nodes within the tree
		example_nodepath.pl
			Load a Node.pm file in a different directory
			Load a Node.pm file at runtime from an entry in a config file
			Use an environment variable to change the name of the config file
File manifest
	Documentation
		INSTALL
		README.otl
	Licensing
		COPYING
		COPYING.GPL
		COPYING.LPDTL.1.0
		LPDTL_discuss.txt
	Node.pm file

		Node.pm
	Example Programs
		example_hello.pl
		example_parse.pl
		example_otl2markup.pl
		example_attribs.pl
		example_bylevel.pl
		example_delete.pl
		example_insert.pl
		example_nodepath.pl
	Sample node path config file (for example_nodepath.pl)
		myapp.cfg
	Sample outline (used for example_delete.pl)
		deletetest.otl
Objects
	Node.pm implements three object types:
		Node
		OutlineParser
		Walker
	Node
		A single element in the hierarchy
		All nodes connected
			Parent pointer
				(the pointer is a Perl reference, of course)
			First child pointer
			Last child pointer
			Previous sibling pointer
			Last sibling pointer
		Each node has:
			A name
				hasName()  
				getName()  
				setName()  
			A type
				hasType()  
				getType()  
				setType()  
			A value
				hasValue() 
				getValue() 
				setValue() 
			Zero, one or many attributes
				Each attribute has a name and a value
				Single attribute methods:
					hasAttribute()
					getAttribute()
					setAttribute()
					removeAttribute()
				Attribute array methods:
					hasAttributes()
					getAttributes()
					setAttributes()
		Node methods enable all hierarchy operations
			Node insertion
				insertFirstChild()
				insertLastChild()
				insertSiblingBeforeYou()
				insertSiblingAfterYou()
			Node deletion
				deleteSelf()
			Low level node traversal
				hasFirstChild()  
				getFirstChild()  
				hasLastChild()   
				getLastChild()   
				hasPrevSibling() 
				getPrevSibling() 
				hasNextSibling() 
				getNextSibling() 
				hasParent()      
				getParent()      
	OutlineParser
		Object to convert a tab indented outline to a tree of Node objects
		Outline must be well formed...
			Each line indented zero or one tab to the right of its parent
		You can set and access properties of the parse
			hasCommentChar()
			getCommentChar()
			setCommentChar()
			fromStdin()
			fromFile()
			zapBlanks()
			dontZapBlanks()
		After setting parse properties, you perform the parse
			my parser = OutlinerParser->new();
			parser->setCommentChar('#');
			parser->fromFile();
			my $topNode = parser->parse("myoutline.txt");
	Walker
		Object to traverse entire Node hierarchy
		Performs actions via callback routines
			my $walker = Walker->new($topNode, $entryCallbackRef, $returnCallbackRef);
			Entry callback occurs when node is first accessed
			Return callback occurs when node is re-accessed after going through children
			Callbacks should be object methods, not freestanding
			Callbacks must take 3 arguments:
				$self: The object containing the callback
				[\&Callbacks::cbPrintNodeInfo, $callbacks]);
Installation
	See INSTALL file
vimoutliner/scripts/otl2aft.awk	[[[1
284
# *Title: otl2aft 
# *Author: Todd Coram (http://maplefish.com/todd)
# *TOC
#
#		~Version 1.3~
#
# 		~This source is hereby placed into the Public Domain.~
#		~What you do with it is your own business.~
#		~Just please do no harm.~
#
#------------------------------------------------------------------------
#
# * Introduction
#
# Otl2aft converts VimOutliner files into 
# [AFT (http://www.maplefish.com/todd/aft.html)] documents. This file
# can be run with nawk, mawk or gawk.
#
# This tool was created upon the request/inspiration of David J Patrick 
#(of http://linuxcaffe.ca fame).
#
# You can downloaded the most up to date
# source [here (http://www.maplefish.com/todd/otl2aft.awk)]. 
# A PDF version of this file resides
# [here (http://www.maplefish.com/todd/otl2aft.pdf)].
#
# AEY: Changed all # symbols within regular expressions to \043
# to avoid problems with # being the comment character.
#
# * Code
#
# In the beginning we want to print out the AFT title and author.
# We expect the otl file to contain two top level headlines. The first
# will be used as the title and the second as the author.
#
# We also print out some control bits and a table of contents placeholder.
#
BEGIN { 
  VERSION="v1.3 9/04/2009";
  # AEY: Note first line is now for OTL use only; we ignore it here.
  getline;			# expect title
  print "#---SET-CONTROL tableparser=new"
  # AEY: Commented out following lines, since this info is now metadata.
  #print "*Title: " $0;
  #getline;			# expect author
  #print "*Author: " $0;
  #print "\n*TOC\n"
}

# AEY: > now starts an inline comment. We ignore these.
/^[\t]+>/ {
  next;
}

# AEY: < is now used for metadata. We only act on certain ones.
#/^[\t]+<[ \t]*title:[ \t]*/ {
/^[\t]+</ {
  # "Munch" off the first part, which we don't care about
  #sub(/^[\t]+<[ \t]*/,"");
  # If there's no colon, there won't be a tag, so we don't care.
  spec = rightpart($0,"<");
  if (match(spec,/:/)) {
    key = leftpart(spec,":");
    value = rightpart(spec,":");
        
    if (key == "title") {
      print "*Title: " value;
    } else if (key == "author") {
      print "*Author: " value;
    } else if (key == "aft") {
      print value;  # "aft:" is an all-purpose "aft"-code insertion tag
    }
  } else {
    if (spec == "toc") {
      print "*TOC";
    }
  }
  next;
  
}

# AEY: Any other metadata line starting with < is currently ignored.
#/^[\t]+</ {
#  next;
#}

# AEY: Stop processing after ---END--- line
#/^---END---/ {
/^\043--- END ---/ {
  exit;
}

# AEY: If we find a VIM Outliner checkbox, get rid of it
/\[[_X]\][ ]/ {
  gsub(/\[[_X]\][ ]/, "");
}

# Scan for  one or more tabs followed by a colon (:). This is the outliner's
# markup for ''body text (wrapping)''.
# If we are not nested inside a list (subheaders), then [reset] before doing
# any work. This makes sure we properly terminatel tables and other modes.
#
# Our work here involves simply killing tabs and removing the colon. 
# We then continue reading the rest of the file.
#
/^[\t]+:/ {
  if (!list_level) reset();
  gsub(/\t/,"");
  sub(/[ ]*:/, "");
  # AEY: Need to handle bulleted and numbered lists too,
  # but not here. From our point of view, ": * " is now verboten.
  #sub(/^[\t ]*\*/,"\t*");
  #sub(/^[\t ]*\043\./,"\t#.");
  # End changes
  print $0; next;
}

# AEY: Support for our own style of bulleted and numbered lists (experimental).
/^[\t]+(\*|\043[\.\)])/ {
  if (!list_level) reset();
  gsub(/\t/,"");
  if (list_level || $0 ~ /[ ]*(\*|\043[\.\)])/) {
    handlelist();
  }
  print $0; next;
}
# AEY: * now handled like heading, but must add extra space to avoid confusing Aft
#/^[\t]+\*/ {
#  gsub("*"," *");
#  # Continue on and handle as normal
#}

# Scan for ''user defined text block (wrapping)''. If we get this, we
# kill the tabs, remove the |>| and if we discover a crosshatch |#|, we
# start a list. If we are already in a list, we continue the list. Both
# starting and continuing is handled by [handlelist].
#
# AEY: Removed this
#/^[\t]+>/ {
#  if (!list_level) reset();
#  gsub(/\t/,"");
#  sub(/>/, "");
#
#  if (list_level || $0 ~ /[ ]*[\043*]/) {
#    handlelist();
#  }
#  print $0; next;
#}

# Scan for |;| or |<| which indicate ''preformatted body text'' and 
# ''user-defined preformatted text block'' respectively. Both of these
# are non wrapping but we ignore that (for now). We handle lists just like
# the previous scan action.
#
# AEY: Removed < handling
/^[\t]+;/ {		# Handle ";" and "<" (preformated text)
  if (!list_level) reset();
  gsub(/\t/,"");
  sub(/;/, "");

  if (list_level || $0 ~ /[ ]*\043/) {   # Convert "< #" into numbered lists.
    handlelist();
  }
  print $0; next;
}

# Scan for a table.  This is tricky. We want to cast the Outliner table
# into the AFT ''new table'' format.  AFT tables (especially as rendered
# by LaTeX) really want to have captions/headers. We fake that for now
# by using a |-| place holder. This should be fixed!
#
/^[\t]+\|/ {
  if (!in_table) reset();
  in_table = 1
  gsub(/\t/,"");
  if ($1 ~ /\|\|/) {
    print "\t!   _      !";
    print "\t!----------!"
  } 
  gsub(/\|\|/,"!");
  gsub(/\|/,"!");
  print "\t"$0
  print "\t!----------!"
  next;
}

# The default scan matches anything not matching the above scan. We simply
# go through and set the known indent level based on the number of tabs
# seen.
#
{ match($0,/^[\t]+/); indent = RLENGTH; if (indent == -1) indent = 0; }

# Given the iden level set by the default scan (above), we now determine
# what type of AFT output to do. 
#
# Indent levels lower than 7 are represented directly
# using AFT sections.
#
# AEY: Added $0 = "*"$0; back in to ensure top-level headings remain headings!
# (This existed in earlier versions, but not in version 1.3.)
#indent < 7 { gsub(/\t/,"*"); print "";}
indent < 7 { gsub(/\t/,"*"); $0 = "*"$0; print "";}

# Indent levels greater than 6 are represented by AFT bullet lists.
# This is done by first killing some tabs (we don't want to start off
# nesting too deeply), and using the remaining tabs to adjust to the 
# appropriate list nesting level.
#
indent > 6 { 
  gsub(/\t\t\t/, ""); 
  match($0,/^[\t]+/);
  remtabs = substr($0,RSTART,RLENGTH);
  text = substr($0,RSTART+RLENGTH);
  $0 = remtabs"* "text;
  print "";
}

# After adjusting indentation, just print out the line.
#
{ print $0 }

# **handlelist
#  Look at the indentation and produce lists accordingly.
#
function handlelist() {
  if (!list_level) {
    list_indent = length(indent) + 1;
  }
  list_level = list_indent - length(indent);

  if ($0 ~ /[ ]*\043/) {    # Convert " #" into numbered lists.
    for (i=0; i < list_level; i++) 
      printf("\t");
    gsub(/[ ]*\\043/,"#.");
  } else if ($0 ~ /[ ]*\*/) { # Convert " *" into bullet lists.
    for (i=0; i < list_level; i++) 
      printf("\t");
    gsub(/[ ]*\*/,"*");
  } else if (list_level) {
    for (i=0; i < list_level; i++) 
      printf("\t");
  }
}

# **reset
# Reset various parameters to get us out of various modes.
#
function reset() {
  if (list_level) {
    print "  ";
    list_level = 0;
  }
  if (in_table) {
    print "\t!----------!\n"
    in_table = 0;
  }
}

# AEY: "Trim" function, added for sanity's sake.
function trim(str) {
  sub(/^[ \t]*/,"",str);
  sub(/[ \t]*$/,"",str);
  return str;
}

# AEY: Get everything to left of specified regex, and trim it too.
function leftpart(str,regex) {
  if (match(str,regex)) {
    return trim(substr(str,1,RSTART-1));
  } else {
    return "";
  }
}

# AEY: Get everything to right of specified regex, and trim it too.
function rightpart(str,regex) {
  if (match(str,regex)) {
    return trim(substr(str,RSTART+RLENGTH));
  } else {
    return "";
  }
}

# That's all folks!
vimoutliner/scripts/otl2aft.pdf	[[[1
1114
%PDF-1.4
%ÐÔÅØ
5 0 obj
<< /S /GoTo /D (section.1) >>
endobj
8 0 obj
(Introduction)
endobj
9 0 obj
<< /S /GoTo /D (section.2) >>
endobj
12 0 obj
(Code)
endobj
13 0 obj
<< /S /GoTo /D (subsection.2.1) >>
endobj
16 0 obj
(handlelist)
endobj
17 0 obj
<< /S /GoTo /D (subsection.2.2) >>
endobj
20 0 obj
(reset)
endobj
21 0 obj
<< /S /GoTo /D [22 0 R  /Fit ] >>
endobj
33 0 obj <<
/Length 1549      
/Filter /FlateDecode
>>
stream
xÚíXKoÛF¾ûWðHÑz_|õ:u`_6B"Éi[°$*"7ÿ>óZäÔÍ¥EÑ©åpvÞûÍP:ºtôúL?ñûóììüÒeÉ5f·ÍJÒ"JÓTyWD³*ú7wK÷®Ûnòiv}~iÈU$ÅÓ"QN»hêr¼m6ÉìÚ4®`_5:Ä(mVLø¨Á,h¶áâ÷×`÷C%Y:,¼%ù÷hV·ÍOp;Çk6nà¶«¾Û¢rª9ÜpvY«æze§RëF0Õ 45©V6K£©Í÷¿~JQ;U¯&6oÈýzË®@ÁK«aWÁÑôid¼r>åh<WÚÑÔÊ	Ë§Ð­'Nðª%bÇ]b"£U¡"õØV3`Æ±q·P¦¦ìàwÖ6OäS¯´NC<ÌºÁlaé´¬ób¤¬þ!¨dèÝ¨Ô[ÌJ\.
( O¶.¾/×óe-BÅÑø0Í2«	D¾ü$ZOþ<ó? ì f&ÍòØ¨'ÊBHô`	Öm}*!©öÿgâ8³déðV¡Ô¦WifàçÊìï&¹CL31E³Ã(b0î¤thFe:Ë!./HpqÛ ò ÜyÍ"-ÿÞc]lñv¨úùÐóZúZÀÔ5Lè¤ÔüøF îf)ÊçLEí¡äíæ v½ºtÌïQAÙ±¥_Q5øAðªØvª|ä¡ìÛòS3±Yü(q½AsÛ`X1o0Ïkå'æy6ïZnEãz#­TÈ°\ï÷%fbÅ~}m¢L«<M#gaFHh¾:ûðIG¼» 4z$ÎUäÕ¦9¬ÑÛ³ßxâ·:f¡á¥ÖöÍÉëã+îwrzdz7ï¨ðB:ìÜë¾ó«´dtÜ0¿L½óñ¼¡2ù7*æ+Ñ»$~·ÀA÷íÂF?!³|ÔÆ^"»¤ô2Ô0íå%¬gOÎ7©Úm-©8ra­÷c\KÑ0ÅÓY?üà¤Ö/¨ÚÍsý $Ï\çaÊwJöv²gy8/%GdÁ~©+ÈpÊ£÷NÎC+QÓË¹ª±kI1pzè`Dûþ@£Gå×2nñÃV
_Þ=.Ä9ë^0cÄ9[Þz¨ld^üÃfÉGPE<§^WÒW1i·!Ë	JE@À,x$þÏèNÍòð Å/"9Hinù÷Uðë0TL¿fÝoð42ç¿¢ÙÜ  ç°KUxóîÏdéO)ÎP|·RÄª§¯ð¦Aó¨ªPF¹ªil"u`/C¼ çXG¸¨ ³MYI±y1L>bÕ4®¸qGöl/«Ù2ntH!yÛÁ8üP_&Úgÿ4T4Ch=:ïÁÒQfJ±çá»YS;ÄGB¿>U}Éçtám_ÿx|où·;31dë¢âÕ`êøI1£¯µuRXGE´ïb¹&íê3Zå°ÜA»õýW5ïùÆ«Ñ¡¯±Æ³ïáüpb ã_¤Öý:Ç&@ý(6>-d#Y´gbivÞÖ³½5A,å½|Gòz67[iZðõødæ¨Û6Ôjú´¨®uËs ®÷Ä)2¨D­Y(8¸ÙpIÓ¸ÂÇe9(ò²Âq}ØeGÃ¶I:êRÇAU\¤]Û·7+ïh?`7ðña'E»Ðí%1'°Òä{~Ôß6û£A@Ùí÷¶Y§¬l>{ÏÚc¯Ê½ÍåO#Ä
"¦¢ýü^"ÔTwË*ôï=ë¬ò71*÷ÃÿSLõß ¹Øu
endstream
endobj
22 0 obj <<
/Type /Page
/Contents 33 0 R
/Resources 32 0 R
/MediaBox [0 0 612 792]
/Parent 45 0 R
/Annots [ 23 0 R 24 0 R 25 0 R 26 0 R 27 0 R 28 0 R 29 0 R 30 0 R 44 0 R 31 0 R ]
>> endobj
23 0 obj <<
/Type /Annot
/Border[0 0 0]/H/I/C[0 1 1]
/Rect [264.572 627.958 420.187 643.898]
/Subtype/Link/A<</Type/Action/S/URI/URI(http://maplefish.com/todd)>>
>> endobj
24 0 obj <<
/Type /Annot
/Subtype /Link
/Border[0 0 0]/H/I/C[1 0 0]
/Rect [69.87 527.954 157.312 537.474]
/A << /S /GoTo /D (section.1) >>
>> endobj
25 0 obj <<
/Type /Annot
/Subtype /Link
/Border[0 0 0]/H/I/C[1 0 0]
/Rect [69.87 500.507 116.589 510.027]
/A << /S /GoTo /D (section.2) >>
>> endobj
26 0 obj <<
/Type /Annot
/Subtype /Link
/Border[0 0 0]/H/I/C[1 0 0]
/Rect [86.233 483.969 159.374 493.532]
/A << /S /GoTo /D (subsection.2.1) >>
>> endobj
27 0 obj <<
/Type /Annot
/Subtype /Link
/Border[0 0 0]/H/I/C[1 0 0]
/Rect [86.233 467.431 135.8 476.449]
/A << /S /GoTo /D (subsection.2.2) >>
>> endobj
28 0 obj <<
/Type /Annot
/Border[0 0 0]/H/I/C[0 1 1]
/Rect [291.833 257.877 511.047 269.862]
/Subtype/Link/A<</Type/Action/S/URI/URI(http://www.maplefish.com/todd/aft.html)>>
>> endobj
29 0 obj <<
/Type /Annot
/Border[0 0 0]/H/I/C[0 1 1]
/Rect [425.811 227.484 542.13 240.282]
/Subtype/Link/A<</Type/Action/S/URI/URI(http://linuxcaffe.ca)>>
>> endobj
30 0 obj <<
/Type /Annot
/Border[0 0 0]/H/I/C[0 1 1]
/Rect [322.917 197.703 542.13 209.688]
/Subtype/Link/A<</Type/Action/S/URI/URI(http://www.maplefish.com/todd/otl2aft.awk)>>
>> endobj
44 0 obj <<
/Type /Annot
/Border[0 0 0]/H/I/C[0 1 1]
/Rect [69.87 184.153 89.011 196.139]
/Subtype/Link/A<</Type/Action/S/URI/URI(http://www.maplefish.com/todd/otl2aft.awk)>>
>> endobj
31 0 obj <<
/Type /Annot
/Border[0 0 0]/H/I/C[0 1 1]
/Rect [280.314 184.153 516.676 196.139]
/Subtype/Link/A<</Type/Action/S/URI/URI(http://www.maplefish.com/todd/otl2aft.pdf)>>
>> endobj
34 0 obj <<
/D [22 0 R /XYZ 69.866 758.996 null]
>> endobj
35 0 obj <<
/D [22 0 R /XYZ 70.866 721.134 null]
>> endobj
40 0 obj <<
/D [22 0 R /XYZ 70.866 545.608 null]
>> endobj
6 0 obj <<
/D [22 0 R /XYZ 70.866 309.543 null]
>> endobj
10 0 obj <<
/D [22 0 R /XYZ 70.866 168.732 null]
>> endobj
32 0 obj <<
/Font << /F37 36 0 R /F19 37 0 R /F44 38 0 R /F46 39 0 R /F51 41 0 R /F15 42 0 R /F60 43 0 R >>
/ProcSet [ /PDF /Text ]
>> endobj
50 0 obj <<
/Length 1777      
/Filter /FlateDecode
>>
stream
xÚÝX[oÛ6~Ï¯ðÚ»JI]¨¦+°^×aXÖØÒn/±³8¶aÙiuûí;7J#§°ChS$Ï<ç;dÜõâÞ£ÇÃ£ÁóÌôTq¡zÃÓ^G6ËzyEqÒNz'î*ãàÉ«¾
B{Ö7üqð\¥>a%Uø
¬9EÐþ?H}âÐQ&ù)óxL²TðÚKh?÷ÃTàOdÝS*J(¥IÁ¿Ákhoèªà;hw ]BSÐ"hÐ@¡%Ò×ò­Òc·eÎ`b
mmíÚRÆÿ]þÃÐÖ2;&*Ú
¡c2õ%7lã	RTì.´ÐkoÄCù~âùa(þÁïé%´Q-,Eb%cq£3ï=ù¥Ã'7¨zOTh[«n	ý}-ÿï<¶íÉÚT¾½-ßwò¹=7Hx«L"£Îq¯d?½)ÞÐ93uE*Oâ(uQe\.û:8E6Ü_±S¹/c4/tnFt@âÅ¼ s8ðnðô¨¯mpÅýÿÆ+Z-ÂßÆiL®SØå ­»çâtV5
Ì=%ÝF,ê#~ý¦!¼(qà÷l#*8]mØGYÒÊf:gæ.ú)°ï§`§ÁÖ­-;ß´vVz¿Aòr½&µfÎ¼­IUd¬vRÁúDÁËÓ~¨máüê"Èé/W[^@W[9ìu®¨°3qäüç¢§¢o~cËóbÕìÊ}¤¶ÁV,t"+KâM¼ÈDÓmUd­u6~ Pð÷6³w^#B´=c£XÕØQö­Xôþ2òîní'4eu¾èÑ+Ï»+w<"ÞU¨HÛVHùgÑGêÏõ´!÷\üvûfÖ8¾Z³I`W¼ÎmÜæÂ%LZG¥LU.y§qÁÂ5«Fô	©ÕÙ'RcÙÌ';$HÔÔÎùkî¶~Êß|Û%-[¢éÏÓ	»X{FÁ :ólágêO°9BZ.'Ü!q. V»3iêÇ;~)ßPPIcüÚ·­/õ3°ÝÖÉ>vtËkB;r÷÷N=º|uÚlÖ¼9ocÉz1uGëÈ«å`Iò´&ó£wÐ¾9øTuvò"	ô¯¼}©åï(_ÊÿÂÅ>od´òpXJ8Û å¨!´-P~ázëÎ°ï3ÔLkT½ó	M râôéJ¢ùñuvoálMD¥$RÀDÒà®UÊ(ÅMÉ:,§:ðà
¾S.õÐÆñhÐÁñ©± <Z*ÓQ¢ZI	µÐ:ûy0|Àqwðî£ºµö\6sùA%\~ù~ò ´¼GÉ¤[¤uåÓÿQ§®'µçë¬¬9ª¸Htë´½÷µM6ì·5Üð\&@Tè9¥ÿ1.ËiÛ:8S#éÝÎ"Ê!Èû¨qÊY~Êâ¨Z bbÛRÃ«¨
KÃ;j½]u®¡þÂáUW¼úlyqBcLÑ¶;E[Ó:Ô|Ì8(ÑI4OöøF{ ´§NQÃ5Áb¯@Ã$u
Øß[áW^8}°Z2Ydôí¥$ÏZÕê¬>B'/²[aÒ£0)ýÂ ©>ZÝÜ}¡w{È5ç¢øÝ>jQ÷oþë ÉyD¸'û7hy×Û>ÝÚ¾¹<pÔ4ÚìkÚµ¡Ï¯ÿ/8N2ënÅ98I:
jÇÐ¡k¥6©$²M?ìdõô½»1ÇÌYMrÐÄMðå¡«ÈÓÈÄ5«5ÝNù¶änå¥°zÿlu}]©/Á×r%ßÃÌu~³Îª&ä;«4{*ùãùÅý%mÅ®|´T>Ãå0¬.úkºRÑ{ÃK÷ÔÁ7¸àÝòº#º0ãå.ÎÄª)4·y·ù%w¨ãÌ]dÂÎÝ´­÷.ÀG`¶t4¾°RVK,¢ËÐNGo5ÍKbÞ£c¹\<HîÂ»â±?vî)Á- ¶wõÞ¢R­vÞ}º®Á¡eís¼ôýû7©J
bÐeBIþ»ây¯NíÇÞëgF©)ÜìÃfVöb]¿(N5ò}!b¼÷\ëg:W {m{þÕ¯
endstream
endobj
49 0 obj <<
/Type /Page
/Contents 50 0 R
/Resources 48 0 R
/MediaBox [0 0 612 792]
/Parent 45 0 R
/Annots [ 46 0 R 47 0 R ]
>> endobj
46 0 obj <<
/Type /Annot
/Subtype /Link
/Border[0 0 0]/H/I/C[1 0 0]
/Rect [411.15 543.943 427.073 556.741]
/A << /S /GoTo /D (subsection.2.2) >>
>> endobj
47 0 obj <<
/Type /Annot
/Subtype /Link
/Border[0 0 0]/H/I/C[1 0 0]
/Rect [314.666 337.88 330.589 350.678]
/A << /S /GoTo /D (subsection.2.1) >>
>> endobj
51 0 obj <<
/D [49 0 R /XYZ 69.866 758.996 null]
>> endobj
48 0 obj <<
/Font << /F63 52 0 R /F15 42 0 R /F60 43 0 R /F64 53 0 R /F33 54 0 R /F32 55 0 R >>
/ProcSet [ /PDF /Text ]
>> endobj
58 0 obj <<
/Length 1651      
/Filter /FlateDecode
>>
stream
xÚ½kÛDðûý
ß	§Ô¾]¯jAÒPE%R[*_â&%¹ªßÎ¼v½öå®)B|XízvvfvÞk,<9ùfzrþ87Vq¥*L_Ë<4ULçÁó0DZ)>|6Ñá·0M^N8¬3ÿ`§q©Ð¥CqN0.ÊGÒÌÄ¦"»ìô/T¦`:ñÆ}`¼Ø½I%&<åckÂÀ/JXU%S]ÁÆkF¢kE~{¯ÖÀx#óO|å^~KÅË¿ybáhrÝqGä#hç=(/+p>Âf£õxmIw¡¼¼Cw£åJìé0ZÑÕ¥èËÒÁyÎ(ãkâ´S6q&º_Âf-læ>ÆDDG>½´bY[øÀHÙ_ÈS-swCÞ
O9ÀeìÀ4MÀ{ãü$fu;JÁ@[^×8eÄ¢¾°'QjÒp
Yí@KDÞâ÷lá°x7)S{ê\7ùmRâ5íÙyÎjV¨/=í=Ó"xm5Õl{ÜúÂ0ñq¦Hòõcø²¦òÔ×)8©
³-*à-2*Ü3æ`¨±NJ{UXï:²8M²¡¹DúÒ»I#ê ¸A6(ÉÃf×«×råwz|ryòY sÆ¸@õöS¾D¢"®
EwÐegyh$"ÝÁ»ÆyUÁ-z4Òd é1üÄ&zäàYàå\r|ã«8?)È²ÂîÇa	[oÐ¾gÜì%º]é¨³«öÀ#3]ö	çÐPõ!ëx`7²Y¢òØéÐf.bGfâ¼åï$÷0Ixb¬cÁµxÜ ñWI¬Sç:Ñ!W »Êb`ÆX×3qv òvkgq¼ÔH¸Ê²ì®DÓs+-9¼P:Ó ÖNõêÆº¥d!()aÿ7©T/´I%x±(|Ñ>Pm¢àÒð(¡]¯V§^¾|%kÉú6iõåÆÖÌ7ål5Èþ·Ó'Â_ò¤¥õ0<P¼=upÝÖ7íÛÕ5B_+¿jZVàqÍûH9:Ê}*ü8_;ùïB»FRï7Ýqu6;ÖfMszycð©TÓÝ8ú¿Õ?buDÑ¤Ø¢b²¢þ«¡dM	«BY;îaÊ2äR;ÃÜ»´µq¯ñNÄYZ,xR÷^P¡¦ÆæÍvÁ[®ou	³àïêÀwTZH½¹VXaÛAj(ÞÆ8 .:ÀV´OwµX
V4`PÒÚR¶ß"AòÆ¾«B·$ ½0WO¡2QPgÏÅ î°kúêÐµ=bEJ½ºDrR?¶×½îñëAjHâ£ê÷ì®ÙJ,ÄÕGÊÎ¹nwÄ\\×Iï?ä)½ðtø#'Ô¯éð»!aj¾¬¶¤#Jà~bþ¸8Þ£àNÿó­ÕgHCENëe({ýÃOÎ¬.¾h{ÉÒ¶k¾{À§«kéèå0+|jv/Ä8ð5¹Á>°´T[×dY{ÛØ]º´ËæÀ[ÂCa+ûä¦0÷­7ÀìóbÃ®ã@þ]ìò83ò´þþpÛõP¹
·[-1\Hë¸í6¯7;6>v¼Øá	e¶÷llL1EºØNÒ(63QÇªk¹uþ¡{3Ë¾p?púôéî¸[*Þü89¦þ0eZ
.7i.ø5³w?:0(PÈì
ëA=î÷¢¹ *Îb¥Ù7Tã	Jíÿ£#J+=|ÀaoInÝöbùüðq°erðïüð[ûå2åÕ]6z0÷¼%ÿÏ¬}ÙûKÚ0)§þ)hú_°¤«ÕÛ»)/éá¾ÛûÂõ©ä¤zö¥{í
1¬ù-çr1·Èì²¶×?ù²Ñ¥=ñ³°ÿ.Þ¾»~7IÐòPÒn¨eØØ_/âs¿á)Ø[$ö£×è(+ý×1þO¹÷ä¸FýÑôä÷¸Ñ
endstream
endobj
57 0 obj <<
/Type /Page
/Contents 58 0 R
/Resources 56 0 R
/MediaBox [0 0 612 792]
/Parent 45 0 R
>> endobj
59 0 obj <<
/D [57 0 R /XYZ 69.866 758.996 null]
>> endobj
56 0 obj <<
/Font << /F63 52 0 R /F15 42 0 R /F60 43 0 R /F64 53 0 R /F20 60 0 R >>
/ProcSet [ /PDF /Text ]
>> endobj
63 0 obj <<
/Length 935       
/Filter /FlateDecode
>>
stream
xÚÍWÝoÚ0ç¯ÈÊhí| êúÐmm§©Ú¤·®h	HE ÚTuûÎç3q ¡2©'ìûúÝ/ÌXÌ:­¼ïT'oqæµY[¾Õd^+¬fy,°:=ëÂËcö¯·?;ÏAx-î\d
ä
#E Ý ô=¿e¹~êBÅ2 Ñ)Ðè
è;,¹å~ Ë¬t+/í;n(|{¶{Ãr #\î{aÐVªÆpÐ%Ök LÝ[ ÒÔ@ye@umÙ-S8ÆÄ×%ÇReè¡ZLSº9-¶çèPè~w³3·¿ ÒÙ§#	ôÙø5ïØ®úvið|Ó r8UÀkYüó^h¸#@Ì}?ÇåÜ|?ÏùXT  =`^ÄØ£¾¶cê¸¾/ìnïV"ª¡D­yä/,èÅ¸Må¾Lö[
I:S¿ï2óEË)aÉ\ù"/Ì(·cu4Ò×¥/W¡e
^¦ÇÂHyõ 0*ÎAD ØC¡!
½PC$¤º}Óô¤}1©P*FY@$ÔÎì³_±éw¬öCDVJ&4²ÉÔD2#»'q¼&!£¡®®eßH¦½E(¥ÝV°°}
í:Ò"öøBzC9¯ýQë¨êÌ¢ÅâBÆÌä¢Dl}u¸Þüi(»7j¹öR$jhøç*}dÓhÑÅL{êjáKe,
Êx¹+læü²µÏðÑ}¹FC9ÔnEÓ(È¿jiàsÛKìÜ®OÓ¬Â	þü°ÈÃ©Ù0q©bßÄíÐ08QM(¿ÇÔ´µXÕ^©nREÕ'¦9%û!=LÚ\ÞÇª(µ2GêDOY!­6D&]{ùbe<)|eÖÌCK$ÑÕÅ ¤TTÀRu+Õ25©z64
[äYU+J/0ÏÈ®ÚÚìº"FF8gÏÉ*Â+I«ðeUm)«jÿ%£vñæ¼² îª7ßHfb<>9>=x	¼¦1fië\BÆ4dÝ;adwµgÉ&£;ü«;³ù?yäxE%+·-f£kÒWÿh«ÁÇtÛiv¡K¿Qé¢«¼pÀÚe¢~ÁÀ{Ð4¾bØCÙúm0H­Ü©üjù
endstream
endobj
62 0 obj <<
/Type /Page
/Contents 63 0 R
/Resources 61 0 R
/MediaBox [0 0 612 792]
/Parent 45 0 R
>> endobj
64 0 obj <<
/D [62 0 R /XYZ 69.866 758.996 null]
>> endobj
14 0 obj <<
/D [62 0 R /XYZ 70.866 532.65 null]
>> endobj
18 0 obj <<
/D [62 0 R /XYZ 70.866 192.629 null]
>> endobj
61 0 obj <<
/Font << /F63 52 0 R /F15 42 0 R /F60 43 0 R /F46 39 0 R >>
/ProcSet [ /PDF /Text ]
>> endobj
67 0 obj <<
/Length 265       
/Filter /FlateDecode
>>
stream
xÚ=OÃ0÷üKÁîÏN! EbañµDº¡þwÎvÃ#Çñ½ á¢:Õ|Õ2{0ÀM×¶°p­Aa×Ê6Q]5¤Îes.ç+ò¥ÐµÎtÄâD>ÎT8I
ÃÚy6Üf/q>KÄzh´·¬nÐ£ìâáNØká^Ø	[AÆ(>cÇ4±ñ®Ï®o2÷^xí³`åÄnt®ýOêi4¥h¦þÝ<58ÉKüÎãd¡Ëúã?9'<8üvRÃY¹9gÂcÌF3³ZïRy¶jxçxXOnì{]ê®Úw&
endstream
endobj
66 0 obj <<
/Type /Page
/Contents 67 0 R
/Resources 65 0 R
/MediaBox [0 0 612 792]
/Parent 45 0 R
>> endobj
68 0 obj <<
/D [66 0 R /XYZ 69.866 758.996 null]
>> endobj
65 0 obj <<
/Font << /F63 52 0 R /F15 42 0 R /F60 43 0 R >>
/ProcSet [ /PDF /Text ]
>> endobj
69 0 obj
[795.8]
endobj
70 0 obj
[777.8 500 777.8]
endobj
71 0 obj
[444.4]
endobj
72 0 obj
[562.2 587.8 881.7 894.4 306.7 332.2 511.1 511.1 511.1 511.1 511.1 831.3 460 536.7 715.6 715.6 511.1 882.8 985 766.7 255.6 306.7 514.4 817.8 769.1 817.8 766.7 306.7 408.9 408.9 511.1 766.7 306.7 357.8 306.7 511.1 511.1 511.1 511.1 511.1 511.1 511.1 511.1 511.1 511.1 511.1 306.7 306.7 306.7 766.7 511.1 511.1 766.7 743.3 703.9 715.6 755 678.3 652.8 773.6 743.3 385.6 525 768.9 627.2 896.7 743.3 766.7 678.3 766.7 729.4 562.2 715.6 743.3 743.3 998.9 743.3 743.3 613.3 306.7 514.4 306.7 511.1 306.7 306.7 511.1 460 460 511.1 460 306.7 460 511.1 306.7 306.7 460 255.6 817.8 562.2 511.1 511.1 460 421.7 408.9 332.2 536.7 460 664.4 463.9 485.6]
endobj
73 0 obj
[500 500 500 500 500 500 500 500 277.8 277.8 277.8 777.8 472.2 472.2 777.8 750 708.3 722.2 763.9 680.6 652.8 784.7 750 361.1 513.9 777.8 625 916.7 750 777.8]
endobj
74 0 obj
[525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525 525]
endobj
75 0 obj
[583.3 555.6 555.6 833.3 833.3 277.8 305.6 500 500 500 500 500 750 444.4 500 722.2 777.8 500 902.8 1013.9 777.8 277.8 277.8 500 833.3 500 833.3 777.8 277.8 388.9 388.9 500 777.8 277.8 333.3 277.8 500 500 500 500 500 500 500 500 500 500 500 277.8 277.8 277.8 777.8 472.2 472.2 777.8 750 708.3 722.2 763.9 680.6 652.8 784.7 750 361.1 513.9 777.8 625 916.7 750 777.8 680.6 777.8 736.1 555.6 722.2 750 750 1027.8 750 750 611.1 277.8 500 277.8 500 277.8 277.8 500 555.6 444.4 555.6 444.4 305.6 500 555.6 277.8 305.6 527.8 277.8 833.3 555.6 500 555.6 527.8 391.7 394.4 388.9 555.6 527.8 722.2 527.8 527.8]
endobj
76 0 obj
[575 575 575 575 575 575 575 575 575 319.4 319.4 350 894.4 543.1 543.1 894.4 869.4 818.1 830.6 881.9 755.5 723.6 904.2 900 436.1 594.4 901.4 691.7 1091.7 900 863.9 786.1 863.9 862.5 638.9 800 884.7 869.4 1188.9 869.4 869.4 702.8 319.4 602.8 319.4 575 319.4 319.4 559 638.9 511.1 638.9 527.1 351.4 575 638.9 319.4 351.4 606.9 319.4 958.3 638.9 575 638.9 606.9 473.6 453.6 447.2 638.9]
endobj
77 0 obj
[312.5 562.5 562.5 562.5 562.5 562.5 562.5 562.5 562.5 562.5 562.5 562.5 312.5 312.5 342.6 875 531.2 531.2 875 849.5 799.8 812.5 862.3 738.4 707.2 884.3 879.6 419 581 880.8 675.9 1067.1 879.6 844.9 768.5 844.9 839.1 625 782.4 864.6 849.5 1162 849.5 849.5 687.5 312.5 581 312.5 562.5 312.5 312.5 546.9 625 500 625 513.3 343.7 562.5 625 312.5 343.7 593.7 312.5 937.5 625 562.5 625 593.7 459.5 443.8 437.5 625]
endobj
78 0 obj
[514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6 514.6]
endobj
79 0 obj
[380.8 380.8 489.6 761.6 272 326.4 272 489.6 489.6 489.6 489.6 489.6 489.6 489.6 489.6 489.6 489.6 489.6 272 272 272 761.6 462.4 462.4 761.6 734 693.4 707.2 747.8 666.2 639 768.3 734 353.2 503 761.2 611.8 897.2 734 761.6 666.2 761.6 720.6 544 707.2 734 734 1006 734 734 598.4 272 489.6 272 489.6 272 272 489.6 544 435.2 544 435.2 299.2 489.6 544 272 299.2 516.8 272 816 544 489.6 544 516.8 380.8 386.2 380.8]
endobj
80 0 obj
[458.6 458.6 458.6 458.6 458.6 458.6 458.6 458.6 249.6 249.6 249.6 719.8 432.5 432.5 719.8 693.3 654.3 667.6 706.6 628.2 602.1 726.3 693.3 327.6 471.5 719.4 576 850 693.3 719.8 628.2 719.8 680.5 510.9 667.6 693.3 693.3 954.5 693.3 693.3 563.1 249.6 458.6 249.6 458.6 249.6 249.6 458.6 510.9 406.4 510.9 406.4 275.8 458.6 510.9 249.6 275.8 484.7 249.6 772.1 510.9 458.6 510.9 484.7 354.1 359.4 354.1]
endobj
81 0 obj <<
/Length1 922
/Length2 3450
/Length3 0
/Length 4062      
/Filter /FlateDecode
>>
stream
xÚ­w<ýÿÇe;R2R=âÇÌ(ÈÊÊççpÛ!{ef"{¯l-2223ï©û{÷íwßÿþ×õÇçù¯Ïëz¿/^N}C%Ö©ÅàE `¨, ¢£l
 `QQe/¯
	Ã£°U)@edÄ u¤ñ@|e%%dE¥@¼
ÖÉ²³Ç*?¤%G$a ÞéHÔÃÐ!Bâ=Áüìp.HA¡ Ç6H;ùéIc¤ÿ
#\þN¹!q.DSÀ/ Ñ$A{¤-¢%Þ$zùÿ°õOquW4ZæøSþ×¤þ9¢Ðÿ­À::¹â8@@â0ÿ,½üË2ý¯k4ñ04
®±C#Ñ¿B(u¡ÂÃí[Úù+Ä þi8¸_ ZFZ&JæWþ»Ó_I}
7òtú-û³úCÿÇÄéàP(q¼Pb!ñùûdùËÔ0p,±Ä$¥ óÿ"IÞP A = ¤Ñ1Áâ- q$Àý\¨4 QùúEÒâ Dó7ÉÈ øoÄ È?P þÄÏ`þ@b1ö7J±?¡ ÷Jüo$JáÝ±¤]á¿ç®¬õð'#6¥$ 	)Âÿ©»âpHþ×_M\ßßl".ô@ÂAãX¸\Ð½äºB_µÇEB§íêcu«ÛGZhßÆBç÷Ýt­2=,Nc:½L±|Ùý;»KD³Ï­õmçØ±ãe7ëå4¯gì¦Ót<?8q}Ü`hªÝû(yJox¶¿0ÁìIWæN÷F¾ªÑ
Õ4'I[MGz´©zÚ84¸OÓ1Å¹0L"tÆ1!|æM ï½Pê+ï>a]Ï>¦Î~x|ä NéÂ6§¥ÚdW <«ìY|´RUWXûZRÆÞþÁüýïê*îÏöïp/6Ö\:\Té-fïoÄ¾½öÒä`¬õ¸E¤b15ù3bº
Ì;íÐÛVµP¼yÌ\2wb U³©$»Õuºq0¦fÀxxµ¿*Õ#lÆL9ÿá¥Â¬Âã¾a\·ºM¥»Ô`G(ßÊS¢:®Ü#a/²÷*u|·$æ¬ëq¨ù6'G`)@ÁÓ|_éÓ²îkEÃY ¨4×~pVbcõ¾`^oïÞBå'}ÀÆ@¯ûA°R^Z2ý³Z¦g\4YúÎ°GÉ§¶ã(ÐÓ¬°íë÷w~¬^«Û}KÅ·ú\)i·´öÙ×-¼êÖ
÷êfÖ¶1MÊú?ç½3.¾åðàÌmzÂ]#ÿÂ©!á¶´ý1t5Nlm£ çºØì×/çù_áá¨ÇßU{ßå²¹Û$`^~ÄéV¿ÌâQ®ëh9XG°­¤g-Óú¥os¼¼Yíô)½Lz+ÚLóoÏNÛiÆW±ªHLã&Æøûú£ÉN
Ðd.ù4®¹e Üßì×BÆÁXÞì]-I<Ôå-êß¸³¬Í°óUÀsrFÞÈ#Üâ§e³?wü¸ÃÍ¹¹rtO D@ÿêÍ`ÜÄeøSöcdÞb&<÷4¶yâÃ]D]UÂô7ÝÀBÄ¡EÙk?·q«ãï|B¿=fÍ3i¢Vú~Òrµ
¾<Ì4l<U|~ØA|^êÄ}âíõÑf.»-¸~ï<ºI¥`Þ8JU¯=sQ×åqºÅÖºHs_©¦d¯3ËõfóU ÞVWe¸®aPrªí^Òq^*·tË÷Ý8nyªl`z«u^aä$ÙSIuGBÜ¾ðíÇU¿±óÀàÆ¸Ö¢¡ü:ÇçM·D_Òºr¿.G|ì	aZ­Ø?¡5«;öÙ4mYÙQ&Óñ÷Û¼xøéã¹KC²Êy}»q& ±N*>¾'?¸·Ú=:ÏÜÓ´XÜ¥ {¨ªÀðì;~YzÎËGæÏà%=çn±ä
ù,?·Ý5Þ³®¬T.,ûòyUk÷Âör¿ä~P­O]CÝÛ69ã~ z³Ûæí¨Øð\ÌÀ*>zèNdªýBdw¶óX¿wDq§Öpltå]s`sÃT£ÇEËóâÚñ®KeEÆ5ðÚ5¥u¤M×îÕ,OEª¼ð/E§3ëÙñ#R[b.&æ·gõ^Q°/yÞJ±¸ÙÀx÷lÈ³»:óåÊ­ $½ÿäWªäã?Úf¦/%ahÚeToÌ0)ApÏ©Ï¹òÊd?m"Ó×9.®FJ®Å05¶é5@·áåæoÕy&eãß¯jÏQ{Ú¼½ãQ£Íy"æ§¶0ÞÖ=ç³o®`zç²^)äÖ0g¤vûå~Û±­lê²º1=Qh<í«xÆófYéêKÎëgÀÓ¨úåZÂI±`fê±ú^DÅâüà+;RÙÖ8ÍÇüGçßMÃèE|h®¨M"kîD~½øèÛ6ês
ðÐþ+cæE}t$×ôåbë½|åÎNFî¾ú|«×JßjÕzJZ£ð3áTq[J±7[ÇÑÐêQL\«	^kÿÎ.§*Å5Ë£Ó¶¯\bkù½Öé¥ým%y:én\e¶¦,«-Õ©?»<ªuBzÿíJ|Âí¨ýÙãþüûs$jsÝ=²ÁËU¥ ËÕxô]Í
-#FcR«Õ~¢ên,¡Ì1å[b¢	Ò/`åUâ«·|Á@æè¬Àõ¼¤MöðqýÒNZÓâO©,ûNIÔK7$uSGFytp$æÉ\õ½¹Ø|qIyÑJÐ_÷qláºOF't4ãzàÙJ¨ÒVrù¶¸~§¿õÑs·/ø2gqr8ÁeCÓHÛö6eU5vA³¼³tNûñëkåm¼¦Z-UÞLZdSÔ¬$OÏ_à4µ©Ýo­?H"uÔ*ÔGøpõþ³õò9ÿ ÉæCé+¢9Æ×:ìWÛcWÖ¯µ20£¬?åùFgøp<¢wÊfÖ03ØihpàOò?âj×s] ÿbI¶²mÜÅ3O²/RC­ZX`Ïºvu}¡ìV«}Qu
Èæb¹Vµæ{±DËÄÈÁÔ;ÅÏ&vGVG`ÃAmjíþöåÌ¡.gtÂ1çGüMl;¼©Xï¤7«Ý^¶o_9G£éÀO³~XVÞ\Ñ%øÌøtæ¸oV»±æ ¹ì¦æw?Kj®¶¼ù¹/5s ¢©ZÓ°Ldc[CjÕwæ"<=,YÖ>»ÝWPy² ¢m¡|ÑGyVâ­$d%{Ö·Á/ØËbÞ êhbp¦¡=ÿNÎ\VR×7³JÈù%Eÿ¸½©i[{Ñüû^Èp?7[#:S±¥¾·»|ËUÒõ÷wy²Ã¢pÕÔ,£v7¿çâ³¹øu!ÞÜÀSZê¹Ðy)á.Û:ôacÌ cÛR}£"»ºEß»BäË¦hy
*3A&p2 W¶ËÃ)_èØ3ué c¥áÏ=v7Æ$ÔÉ'÷ñíââ^ÐLNaã@1&OGÌNe3h]p¡ÙÓF;;WñÌzmÃ÷÷:ÚýçÂ¦Ï#W¶Ìz+|´÷ãPIn~ £oí«ÇVO99&xcD]¬ÍAôR¹Î\U¥MLiÿ7Ößü±Çk[²Ú£gª¦Öu!âvm­e{®Ko<éÔFuU/<ì6/~eÀë`2³5³4féIxÆ.ºYÎÎ¥ËÎb^ßðªJ&©¯ãª«Äêò/F[3Öo°Ñ§é³¯íº~|rsÝ¬;½ íP:s&KÓñÞòF1Ç2Ö*ô¶ïØYéVä³oÜ!BbÃ@.@k\}Ã·ü]¢	6C¿xIÃxQ)¨Ïå;¤58+©&ëeØëù]¹êT¢îø¥.»9ÎpÙXkëÂ£sÇ,Stz.i= ?þÔÒÛÊFûë~o8 M Tæ?È¨ÁB$ÜÊ"ùN)dÝÕåÞd	Ì©/¹X³XÎ·þðMÙçQõ;© £cî{;|À¢ÉxÌÍ§èf»·Èýâ­ÔBÛyìZÉês§â=wõ·ã)NJxSK«»¬òû-w=á÷g3á\_¿Òç¾Åj:ÏÙ÷^ãBv *×²ÍCÈD«Ì"Úîk?7>%jßE^Þp«]§åÈÞøâþÝl0ñª·,CÏ¦äÜøyïLÅÅòþ^àÍpÖ³.ÅÀGr¯)å8)²æ§^WSu+*ßôñÛÏ0êm]^ÞFõÈAUêCkÒÓo[4U}»þ>¸ù,¶~Ð¦¿?ÝJ>ÀÏ¥£ðêPMNÒ³#3Y!£Ý*!=´\kaÇãæÊ&e¹ç'Le7©$V;Gt@ª#V çòé6öí¥}	½4sÎqÜýù&Î;ùû³çØhV][nØ	mc¡øãÆqy)Ø=+¯(µ
u1øZ¹aæh	ãIÖhUpÏÇû¥²6ë¤ëÁon´ËP]up/ñ7¹³R+^º´ØL6¡ñÚµ+¨ØÄ©3yHàöè´ª×4t;ëC¼²¿)Í¤2=bä	Å	ñ!ÛAO[rI¦I·_ãÚ
'&úÆs+ÌÊBFû³#&:gÇiFÒ½Y­MS!=Á]èÇ/'Îo=þî3tì¶£3]âR3YdJ²>ò½\(b%»õHÅp¨ÊõesBB5lÂ¬ó¤¸8þ]N@}iºW qí°Ó»6»^óO1Uq$·ZD©ÎAÏ;cP³Q|C¥Ûó6¦ÅòøJiÙtc<ANC"nRÀOëô½UHU÷äá
endstream
endobj
82 0 obj <<
/Type /FontDescriptor
/FontName /JTJVAZ+CMBX10
/Flags 4
/FontBBox [-301 -250 1164 946]
/Ascent 694
/CapHeight 686
/Descent -194
/ItalicAngle 0
/StemV 114
/XHeight 444
/CharSet (/C/I/c/d/e/i/n/o/one/r/t/two/u)
/FontFile 81 0 R
>> endobj
83 0 obj <<
/Length1 995
/Length2 3230
/Length3 0
/Length 3874      
/Filter /FlateDecode
>>
stream
xÚ­y<ûÇ#ë¥D<ö¥!K
Ùw}3ÆX¦}ß²g§ìCdM,E¨ì²\»¤(Êý¦îïvûÝûïïõüó¼Ï9ßóù<ç{~ncQ%G=\ÆBÄ r®²DøùU°pAßáàr DV(y9â DZNRJ*âT0îx,ÒTÉ Jnp,Òta8ÜÔÃ1H8/(¡PÑÜõ; ÀéìáÎH4üÃ&Ú	Èüvôrÿ+åÇzLB$Â É¢#Âp'XCÒü?Lý³¹
¥sûÑþçþ¹!QøÿV`ÜÜ½pp, qcÑÿ,5ÿiNú&B:(¡Qp@üÏÒSéw4@âå	ÿ£ÿi4¶À7M´M4/ý÷>&`H4î&ÞýWÛÕ?ò7¦EúâbââR!éùëÍúbªh#MZ¨4 Ãbaxi3H vûp_c°#H#¹8a° ×)-U~~$ ÖüE¤ûÃþ&Y ìð ââ Øñ7 `øo(¿! #Ã+ õ7BH­Ð¿!©æJd1è¿[KI`wÒa~Ô°¿!IÍó7$ÀýB(Içù-MúJ¯øï[TVÆøD¡¨B*d âwþ§ÐÁ£q?Ò.üÅNHÒæÀá¾pÐäÆA>Ôå^Cx¿jÁk"¥²óã½ÚöáÖS!d¨â>mÙ³òL&Ê.oìÑ-~jA	é£Ç+Þv+·°meêâÝyvCÖO77|ù %Óí/K1/ìÊùÔ½~ß@èÆÍUêiîÞuY¡Ò2fj(°In#Æt²H©Æ$W!þ.4¦>cZ¼ÎÐä'Ût¸e·«½§_´8Hx¹{¶:Ðº4zÑ+_7Ã<þá7{Ëi®l%j+6kDpû2Î*£ò©ûÛÊÜB}}6)¢z=2º©µÛäDuB@À«Ç3Zvz;/Æ8Úêßë#oË«fojÒéx!ç×ª²ù¾kIjMÞS=zXÁéPÍðÎE­¨*Ò©Çot9\Ts¶~âCê¤rHHú*¢0ÁãÆ-ÆO
v´ªg¢]ÛkªÉz¤¡;VK}vÜ_g ´Ó°]¡¯*Í¾Àû~ÜÈcp\j?\Lî,ô¸FíJÃå³\È"UU	*ïG3Ü¦PKûøìi7glä#¯¿O·¤î[9ØrJ­Úl;$û¿2¿iÑU_g^ÍfDfA¼rÎ­BÆ´`´È]Æn:Õ:£ h«·3îqÖï;ª-~÷N×ùº}tµMç1iYz>_äñöe´ÙÙPnUE²KÝ·LOìÏªÒ ÂÆðkyu¡ô¦é²tu)	ÎêrÜ#G0 ¥ívBßºýéßfÞåÊô÷ã¢Î-*Béfu2¯`Ü>ñ rêµöÈÁe8» ½¤Ã76Rjz®©ÿ"«òøùbë{|­£`]í¥«½ÌOMè$ww"£¶õkZ¨,n½MÚâU«RöIî©+ÉÁ)V°tø7h}X]¤°ï8AC ô´8¡ï>¡	ì»·zÿº½e@ÿZ;ÇçL¯ååÏ¿Ò4îÊ¨7ÿÄeícÚÛ´yfûÏìéÒ&+o`¦>äìÑKÇ}ë¨XY!y|z¦ÂUæ;ËÁÈéXm¶Ä.«-«2¶éÔÜ=[ï^¶Ø5ó~¤JE/(é5CËÒö²(¦uï|Ëµ0\g§¾«|Ðêg.Ñ­5U Q«îÏ	t~ò¡õ®`òÜa0±r@v¿FccÁ¥ o©ûq°¤È¥ÒDØ`=yREåFtYýco¶(imE&ùr%¬Ë}j7 áß®{í¶ã»¾ Q3*ÿhE¸×Þª>~µ¥¾ôüAb|ó3¢ÄQ¯Èíæywu|×­Ã!«-N ³~ 3À®+Ëwªó.röo°¯ÎPÎÊ}Ï]*­(¥Á4ß>²ák½Ï_ÔYøÍ²ÖT°ô²®ÜT¶LÎ	Ñm4ø 3¤ºdÁÅoûæ&¦÷Jì×ðÄ)F¹/'7³Ïmdb=z·49Ü4ÌÇ÷}ç|r_º~Å¹'çw6§|F
2M7¦YæYtùÚSÀpJÎo¢º2,#ÑFbÐî2·êÊlÏö¯|{}»<u¢ªì¼iòWQ	ÐuÊ6£R8¥G²;eÕì=øw/KÿWcªK8gÿò¶àÎéÎN·×u°y'ø'Xc3LS/ûHÓÅÛÐàjyÒù^ön÷äÕF#b Ãx¤ÒÊ«t¨g¶¢¶ÛÐ?®¯ÉðOõÅ8Ü-FaÙ8ÕÁt0guyª©ñ¾ÁøLo´4}_/¥ØÂúÌBÊ M¯±õä{oº¨J«6³ÖjÒæ}§æw5Ü:k/kï¹û·y«ÅìÇ9ÕWKÒÔ:V9È&ïÌ
ã»â.ì«* &Ejl¶}R§\àM­5âÈÚäj~>_ÄNVÙÀ³}3wXÁ{Iw{ÚÐ¬­0ïMqç3W{'®ì¬Ä¿ï4*1HÚ`o|ëäblÑU!NDâÞ=IÎQAuØ-lÓÒ+0ÝbÚ+,¬z@bÏåfåJÓwßÊË©Lô1¿<þPN·ÛdZx¸ñµt¢ÎæÁã1wËté!¿¹hñ«µÍ­ÎzIßíð>_/ÖoßÝ¦¦
waCà{1¹IÐÚE§<[
Îðúì¹ÉÙïÊÛU:{sY0ß9¤w"ì(FrdÄjzâ©ÖFö¡éû5ëTßÕ¿+¯¹×SÑß?=øÍï©T¹ÙCÌ|2ôTbXÒ$è¹»)e1:×al;i¡-6çæb'mè5÷d('BÆN³¹XGsJåbÐ4ËÃcnïh$%QaÏÐÕè{ôY$Òé¾îRbÆbËÇYå_ÃG;b:¶ÜtªÉLøÇuÅÃMÖ÷8ÕNã
ÏäÄxÑuV.êâ£çtzÎïTò4, ÷/uíSgNIQ®Ò¦i
çDlÍ]½þN¼Þ[ïÜÊùðÖº);Bl<«3àTîvß%;¼@èÌ"0bL÷S4¼kP³°ÿ>þ­ÐÑaæFV]õÈä5í­üÌ0ö2½¼¦8ÿ§T\,ÙêiÚÓÂlI2cÅ±g{ÓÛº&..-=Ê£á1f´ÎéçÞOW ÌSj¦íhÇ*\ü2,zÓ	H1î¶JÞQPÄÆÝZ2¡uê|2&"©Q"Üòr±v.ZÎ0gH¨bR¸ðú¸¡ZÖG´Æ!uw¢MÄÜÉQÄù+Ý}É})ß¬¢(«=z¶p/¿ìsP.wILº½é@¡4½bß´vÅ+f³ÂË§gÞP/CHkh_|»±|ÈmfÎïG êb±ì.·Cê_]40TÀ3Å1Ü-²·îZ¼i«}/Æåî¤)µßÆtïñÛÅÈ,ÿýâò¾Ól Ä¾ÏÖqt¼<Qè#Â#»#ÂLðåCÞ`K6§sª{?·xï
hU;Ùñ´=¯åÅk=>ÃzGã;ëìf-H-C¬_ëMPÛo4rnÝçBçe;V»ºÄû:lóÏ¿5¨5E%Ñùä|6eåv%/¨kbÛáI;oP
W7/(.<ót¸Óª¢gJQ½p1b¢|Þz§ÀFäRUØÖkGUA¡|û÷*5j8ÑB3ó`æ:ÂáKQ
ú±éûÐ[Ù'KçÂRÂBq©Í°KçåÞ&­}ÔßWå[Ô)é3TÈÅiiTïTâýNoT&_Ö(ÜÇèÚ;%Ô¾jÓÏOÓÔ[ÅÎf.¶§º§ 7­Ú#mXõ\ZÞ2ç,àÚL';ùlØÂ¶­ù¬ým¡³xMYãQáúbu%ë];í{û£Êu!`Ñ£·QñÒâÑQfÅ~3Rñ¢ë**Âö)%³×|O_Jª­x]ÄoÕýòpüÊ¨Géu²Ú§PW;rlâ´Ó¬uGE«3õôÓ¼~{¼­.VéL¼\å²æõDY`÷¥yàï+íýÐ7ÇN%ÙU_äÇµÂ<¯ß·²hÐÑQÅÃ¹ä3ysD¬»x)Ö²Ö|­^UÙ ÿNAý?ÍØ¢8µV¨Á^¬{BUÃì4QC3&Ë7Me¬ÃøOxIÖtaV}®1¬pHg.ñ\*@~¾,»æ%+¨)v£ÅÄùPê£AynÜ¿Û÷üZfpûÄÐ¯ßWªe,(¨-3÷åM/twÙÙÿ´«Mp?å¹£Ç>ª3O+ejÓV{,Úäî:õþN$Ùyì¤É`/âbj^ÒórÍÊsqËä¯ãé8#A º/Ñ¯2dwàø¸/dÝÒ}ÓËNáFyµx¥hÌ|okªÓ~`Þ©²{î&õ´:
5Sâ±ÌmMa§¸{áµN5:ÞÝJF·u½á±¹×ëâ|Ô©õ7\|ÿ[)
endstream
endobj
84 0 obj <<
/Type /FontDescriptor
/FontName /TUJSUI+CMBX12
/Flags 4
/FontBBox [-53 -251 1139 750]
/Ascent 694
/CapHeight 686
/Descent -194
/ItalicAngle 0
/StemV 109
/XHeight 444
/CharSet (/C/I/a/c/d/e/h/i/l/n/o/one/period/r/s/t/two/u)
/FontFile 83 0 R
>> endobj
85 0 obj <<
/Length1 771
/Length2 1129
/Length3 0
/Length 1673      
/Filter /FlateDecode
>>
stream
xÚ­RkXSW	0b[¦
EÈM <"¯ <B)TPÄÀÍãÞ4¹¡a"_VF+Hm?¶EiªA°<D"4¨ íë×oèßùî³×Zgïu×ÙÎ1qî,>Ãpp§yÐ Í§!<#ÅÙ9D¹c¸d7PÝ >L'áCq!¸T%CSR	àâ:/ò,	¡<.Ø\"JÈ<®Äá<*ÀAìü9r(K|
ø( É0Å(ÔyOá >¯`¾BúJ29i
¸,Øt¤I>Uj4NN¤ÿ­ÅÍÃbq4W2ß~!©?ñ\	*Vý®À%Reó¡[,M¯Ì±!UH³áWòXXwâõ
Gåa¨òcP
\±.àã/vBæ·à·=,fc¼ÛïO»@ÆpQø@% ùC½PÓþ¨Éd¨|x ßëSâ¢a¡ç£X
 3¼W&ãª(ä¨i ÅøP	 tLõÀp¼Èd2 QæßÕ¨)ó«FE¯0PÅP._ þük7âJµ»'¸Óä(ÄËø0ÿò2Äõ!z]P2SGé½ó6d.|R±'ôLGåWù*mYvkCN­vÇ¸~ÃònYÝõ ý#!zÖºp"ò*_À´»ÀJoRÇQszl,m]KOÄ-3ðÆ9;MK®ê¬$§öô:KëÜ}k§ÒTEÒ|¾°8`ZñÓ­S{Dm½æñ×Þ+¤$|uÆ?8ÒòüáfüÞûUóÓ+^öÚénwú-µ~KØ¹©û+âªÜi£ÐNz·ûEÄ1ÍVywÇÖ£¿8j·Ö_dÿbv·ÓÕï®£Ö¢+\Q¸%!|ë·+Kó*ÞlþÊÎÓíøA]É>÷¾f¹è\= &­;î»ëÙçGNy¦ggõ3¿´ûÁÀS;½õ­IïÉ 4·q×VÄnÉ}MÛ¹©ÇFVÐ½yðÁ«ö ;éõOÙ`ßÍ,Û[åûÖöÒ)£Ìg¢ÓëÙ;Üj.6}Ê	UùmÿÁùüPóÆöPðã©55ÇïôJÌnÚëìÎî/M¼ß»?cì**3+9u$rÌ¼!(o3ó[³ Û¢+=ü2ÞtEIõøÇdUdä[>ÛZ]t^ãÎ<
ê<Þ·ÅyÍûå:ÚÃ¦dGNX­ïwu'×å? ÿMÂ(ö?Ò{ÍÞÕ¾;\ø¹õ4c¨µãHr}Úªv")è¨ðÎgOÖî>`µiì}Î³Ã?¢¨grç¢¯ ,UúÛtBÞÜWßrÛ?iKôþþ=OâYûÿ­ÑÉ­³OºTVn&[1°÷]n\QªËGç¦{3u]ÖVÁ?Iß	ýÖ«êÄ§8«¿³råmZº1TßÍh9iâp^èýX Ì2Ðw¶xî,VµZ/ù´v½énÃ.êÜýú÷&f»¹ïJßvaÕá©´7¼·ôi|ÐþQ­àU-XoÖ¹×Rç¯(í.+Z1°§ºÍ¸êVáÑ¨}ôÚj'¯=ºè$_
Ý(ã¶ohügÌÕú½ýk®ÏÄD{WÂs@oüNuÒiCj£âu³nR?g1¾²øûG©Ø6ìKëôzqÿÝ¯Ùk*V-íÊ6(5.lïÊnã3$nqxv°W£ºR´,¡Í"j2Ó·<Ä>¡Ce6aÑG9o*ô:ªÊPìØ vHÏ­ÚÒ).ÇwÚ*= ªqàØÈÇ´áð)¯Ë£ÁÿÎRÝKâT$¦"ïÇ_´ý°gX>l}h¦&oV6{"ÁÌ}Ýj{(õ×/µt×'>Ê÷Úè7{C³7ÿFó[Âô²Ü`½¤ýÒUÿÕþNyÜë7;FÞøe°Èár[Ä¾Øìz}ð=ËÇñÂ<uîeÛTPrF2×þ¢ìÇë[#Ê|,h×:Í¶ß^Ù%-gä:d;ß°^e¸ðl3,P
endstream
endobj
86 0 obj <<
/Type /FontDescriptor
/FontName /SYFPBV+CMMI10
/Flags 4
/FontBBox [-32 -250 1048 750]
/Ascent 694
/CapHeight 683
/Descent -194
/ItalicAngle -14
/StemV 72
/XHeight 431
/CharSet (/greater/less)
/FontFile 85 0 R
>> endobj
87 0 obj <<
/Length1 1678
/Length2 11652
/Length3 0
/Length 12600     
/Filter /FlateDecode
>>
stream
xÚ­eT\Í¶®qwwww$¸whwwàÜ»îî»Ë·÷9;¹ûþ½£{ôXÏ³f½õV­j*2%U&QS1PdçÌÄÆÌÆWac°1³²~D ¢s9[ìÄü 6>>v$ÐøýáýËÏÅÉÏÅ@Ù{8Z[8hÅèþ)âÚ-Mì òFÎ@Û÷&F6 U%ÐÙ jcPùg@ètt2#°±L-MÆ@sK;$IÛ <ÿºØÿoÊèèô.
@û/tw¦ ;)ÐEô>ð]ËÿYÿÝ\ÒÅÆFÁÈööÿõÿ¤l-m<þ§ dkïâtÈLvÿ]ªü·6y ©¥íg¥l,MDíÌm Ö,$-Ý¦JÎ& 3#'à¿â@;ÓÿñîÜ¿$°h)Èj)0ü{OÿS2²´sVó°ÿO×ÿÅløÝGKwë»½lïïÿ}Òû¯¹$ìL@¦væ v.n££Âûéy'.ÀÒÎè º¿fa¶9¿¼{â09"ü³¡Ü\ ÑBÿ&n ËÇ?Ä`ÿC| ÿ+Eò±X>ý! ôâ°Èü¡÷äþÐ{OÅÿï{O¥?Ä`QùCï=UÿÐ{Oµ?ôÞSýñ X4þÐû4ÿÐû|Zÿ¡÷óÈbôÞ+ÿÐ{¥Éë=g²y?ñÿáäü'bkûg<ë»|Ó¿ðÝàã]ÿû6ØÙþUñ¾B³?ø^oöþ´ü£ãtýÓë<ÈÅñ¯vï%æá»B?zß÷ÙÂÃÞh÷WÅ{Ìò/|·Ñê/|wÇú/|·Àæ/|÷ç¯¥¼n¿:ÿ³Ð¹ßkAvÀ¿ÒïÚíÿ¤ßÇÚ9ílfÎ¢lÿý÷òð»Hû÷;ôÓlïwøãôûl. ÷÷þÿÈÆöîÇ_n±½/ÞéÿÐõ/w¸ÞËÞßÁÿLünÅ_-Þµüë]°³#ð¯-z_³è¯ï=\þÂwK]ÿÂwáníÿûh÷¿ð½½Ç¿ðÿ½k>~¹{1±¿+xÿaýç$òø¸ù|þ¯JÇw7ÿu¿_YÿËfïè4AX^ [¥6ùJLCÓ4oW¨ïíDZJ ·)u ß¨Ó|¬ÈÀDÙÞ#u{&tìðV<pOÝs5ÜËðl%Ô¼Ê÷Øµ'¿:Fmo»9áWÙ-KÒ*ìÏ¾8ÎS¢WÛ]#ëÑqmèÉææÑÌ°ùRGÍA¦æPÎ¶îôj}2È×*®aõÔáñX øª{nÒAÊ¡²M¥²/|RZZûÖ7T-	0WuìA¯À©Hå`Vg{HL_àNHË»3¶vh½Pqëmïp0XÊ,±^|) UÆÐ<Ày¾Rîùò;dý(·üÏ½QóbÔué´¡É[­(pµû32§°<ÙPn²>ú"Û'½y¹dèú;!XþB{´úH÷ì«hÚ7 ¨tÓH"'Û§ëÈB+rùóc¬sõ®¶Òl´
ºüó¼wÆ::ÊdCD¥äjhKkilþb¦÷©PXcµ¹Jö²íSër%Xm1ØÔ:ât=»w&Åóa?ÂffSfpYÂÌ¥I??3Oã÷à¼ 1^öú:aþòýc³ÕMìÑ~¸!ÁPó!ò¤¶"¨¿sÃT­eµûb«²´^S@¤A¸©\èVä=a-6înùºáÃ© áe³hô=_iâVaT[Kgéòn\¸)ö~Ê s øÝ1ÙÚ¯.]}9ów30¥ò»¯D*¯|KE²{MÀDJæcÉKO1V¹Yð¼äª&d
xö/'íÌhë1Z¿ô¸ÞüÞv/,ò½1bM07êÎêÐQëZ%éé»d¹¿WëÏæ>qÅó'Ì^º´GïÇÐOÆEB*>ùäbJ¸5=ÕI4ª7cíDE¾¥`þ¿ê1¦ÌXCõ©â¿#N+Ðµno¢ëMÞ-ÊFfw6A ¿g®ów5¡-qÊ¶e nü]«ü.GSÊ<êê1(²¯#î¬>©3·¤Ê´$×¨Z¬a¯ÛªUu<h!ôDñ^×:SÛ ~]@ÂJáe}øj<Ä¬ÁJdí¥'[ë¥`Uü¯ê¬OùÅ&ãì×/dbpü¬ôàNê§8[q>úZ/l½ÖC¤Ç®a®
Â¹×Ê¤+Xï\ôË#ÜÚ6j4Q»ÁÔðÞ 1é¯âMh]Y'½?õCGRq0~Ó6.pqNûÂn¥õÀ?:Ì·Z7ì¥uEæI.ÕÏÄãîÜ,pAO_Ép\_Î7Òéú¡ ¯Ç~Ä×¨OZ?i¢ï£å=Ñät.õÙâv/cøØîÚÙZksö;X^»EõdÀ îÝaºJ+=F½ÄÎÍHÞe:>Ë©Ù$]ÂÇö? Ùªô°æÜbÒGÝ_ÇÍëÁ¢ý >÷sA_è5Ü*êLÍvÄÃ1ÄE¹¯¨¬ëðWòØº\trT:dÛqrÙJÚÉ¥FñÏ9½Êï¶ÇËØß·«>Ù¤Aocú³Ä¾5 qS+mk^ Hv¢1Y}£ázÔÐÁº4 ÎKÍ"ðÅô*÷ëbãz:Öº=¢óQØW1\¥­Wj6äFæÖNbÿ¼ ÃõÝâx/ú-xMÒÃ!yy¨n÷:FXÌÞ6äëùqq4nN>d~ §õ©øk²$àÅR¢$­+uvÚä ×Û­_iÑð`zãêæº9"¿D¹îö5ÄQCÃ¨Ã_²lMoýÙ² Ê]
~bÍ=^èfW1Õd¸*
?ZX¸já
IIúKb¹2úF6}Êþf9.;oSûû²=H¦ÒQÂ gâ7©º*.h¨Í½U8\µN_¶P@>7U§<s½ÉM+ñs.³´£cXZ="lãTô)lÚ¾ñ0W´]!VÏlþ&JVeR)+¹¬]²¡ÝÉ)õÜvïÿ,ôZ)ØðD¾Ðüö}ßÆBlÌDí|äÐô·h¨Ú´Vl'ÜÅrQl»Å\âú9[×á¬ÉÉåBÉé.ê¹üÄ2ëúí´÷ºÊùC4w ó{Î(1"X#í9oúð.|÷2[!/´æÚOw|V!bMØ$`SDÊàóÃ*xVÐÈÑ²/8·­lOm¶0Y§ãàîR;$ÚG ®¼Øßµ¿ÏÉîvç:G{"ôZäGñãLx^nó¿¶o^Ø½ñÎÇÙH$»ñ«¸8¨úÉ6»<sÂó'µÙVEèñçXS4\615Õ/H"]ú°`}IUö)^$lÚ§mY û&ñst\KLÃ¡rÎ~¦HFyìr1ª:,AØÇÊº¶ÊXþÂ¬W"ëNEOf.=R¯UtCMO(÷+á!¾úCü¼ÚÚ§&âÐæoõKM	ã¨ü²<áî®³;ý<É«.Þ·c|Lö­=2Ï
/i6W:CjN¬úgþÞå{É¯Ä ÅoØ8´ò§ìÙÇ	¤guY¼Yb6A[dæ2ôÝeHZfðûúÙÃe¢7ÍOy:ë.s]-ì¿Å²¶Ð|Ì
jBqÔÖkÉ}7.Ú xÝûÅtØ0°lÄúíZTÉÝÖ	ã>÷¡]¶SýÖNmúRmAåçv®Äß¼5pøõY#kììo^¨åWâq·¨]x¼uµ»£M>YeØûMû ÚîF~ó,?[^Ñ-âXü_¿iM³K8î¶ëq7¹¥¹Å\l4£¯ 9O¬¾åF~Ö¡6Ø1Òh
/·ÆëCÿÌfU'LÚ.ëÉkóñnLÙyfÖÓçEð-kcÎ7N^à1a56¿mÓ%Ýdø üBcì|o,p¼]oó5ÐÌXeþMÀO/ÑÎPR£Ùs`ßþù¨ þ×i¦³¾à#£ÿ¯ÄH½(ËIìÖ¸ä/,&¼]j¾	`Åèçå0Üá9àà'¢²(MrÊËZ*cãÁKâcçªjºêú¥Ïº8~B &;é´3sÒÔ#\±oò5ÞQB·É¥H±N%êo´ §¢nM³
0Ñvñî6IÔ =j<`¾ñaabÄ}ÚÑÁDßg/VÚä;SNíÅ»+W*Ëd×Áúâm90¹­X*7¾1EË¯hÒ¿ú\íai¦æP¶~-¾Îºf&nÑS#q[3@Hð¢æ V?ì7"à¡6.¥­*x$7|È«Ìüâ¹þÈ:4ÕtL%v°öíðã5<!1Ú¶íx¥$ÛîÎ6Û;W
¡2YËf»Â[*Ãî)w`þtÞËß=cUv®LilW¸ûóUÛF¤A2NÇ`Ò8RQx_ZKôìÇÈFüç¸Á·7WæªBsÜå±¼×;mànps8qî'[GÆ§3fipvNËg5~}/pã&ñìQ/·!r©ÅÈ±BÔ£<Op
!ñ²9¸¾6Îhüb½¯|þôÕv wÛä6YhMi¿|4ÁcÖÞâÃgìJ²Üªý%l©`ÇÇ.¶°Ü@üÃØ%"³[kGYT)£¹¢Ît¢äD/u4³O¿Á>~µ:°d¢x{â¥LíÌÕ¢J-f~'ÔTCk'Ó
(6SJ×H¼a¯ãF;IH^ÚSÿnÞ
Os\åøAß:Ê{Ðø¬ÓV8­íµ	rdûrvké%1!¯£ÂCþX¹Y&ã5A&GvÊØDNñ|×[zWzÀ/\ì¡K¦@|£°ÀÅ¢Ôj®gHÛ«ÛEq±TbÐ
®þð0^vjì=á·%'ü¬:¨îµ¿QäåIÅßÃk6u{-ºþY>þ¶bv63JLÃxûT©,z6æl»"QÖ£B$áöÎÀd;P¹rÑ÷LOU(rÌ§u~»B\Î+5+í3>¢JåÉV'lù*L¼¦×Ì±Ð'^Ewwí&êÞ¨K¯lw*Yéoý/lãêÍ5c 	^íÀ_>¥Ûé\|¦C~ÃH¥Ñ¨ÑÈÊ?UÔÙÌaÜ}MÍX.³¢<'ð¢
ÛpªøÊµ¹V4ÒÜúMû¯±Þ?õÖgÑ¨(ÕP$ÀqUf¹:ÆC)ª®,JvÙMH¦?o(bà¾²èÑsëoÈö·u4ÌànÉ\`!'ÐÀ~OsEl÷0úYÌm¨£§é6SÀá%9fÂHXÓ7ÉêëBÙT?ýûØ°uþJ,/#íUý@!Æ«ÍE¯ÃúcÎÚÙ¨k«n}jD»õsXÙÕbRhP¯ë3¼÷äÄX;âS¶éfÂ$vþR soÖ^AMT_t­{;g-çÁ~.DDx	ã`ûòÖ¯»Ñ'ãæTtÓcÝü¥wEvK/ð²â$Ø¾Ñ8Å£"G÷ë?¨´ôæ·Ç08¶ÒÉy+_2ßg´Kãbs¡Â)ND·¥ge~¤p]9B/QcÅ½1Q¶$¦é"hÏ)Ù½6Àã©Ï¿"J0¼­~Xx"2Ð½P52ËéÌÄ¸°/¾×´m!U«à[á¬øöaÄõúBG2Þ; ½ì#a[Ð½w¥üDÛ~ñäÃèw¿ê%Ù{E$£ê-þ\ûÈh¾çÈàj¡&q34ZÜf¢ó«ÎÒp]4£Þ'eQó¹@$ç¤·Ôì*1â©O»°6?9%å/Ü'T!sÍE­	0ñdÂn¾mÆÁi¤`Á0±	úÂ;íü"So;	)G=÷¹Ìn¥æa*îS×cXB)K¸Maqdµ]GF+h¨LSU,fèè»®Ì½!ÞÊÚteÍÙGÂY~#/(nè	£úgéÂ[ÜôV!ëÑAk"wïïº2#*Á×á@È8Wéº);PV¤ZñÙìÈ=ú°ºZyÌéþëÂ»]ÊÿÄÓ$ Öd22+éxMÕ÷\m Æï¿%yÇÐ+Z.aûK'0­AýW¦Ê Ï¡tI]ßqÖÝéjð,ÛM=®ãCQ¹pY¦ó«ÎPK8K>Èp^;ÍpµÔ".ýD[2Ahû¼Á·óË4vBcë±UÞ¡qReù×yCPS¥ ÈÀhS}údà;q¢L¾Yd÷ðo°0ÏfZõ*¢m3îhJ½G@@¡à³@tjýÕd;hdtçRÕr:;Ð]z$]*êk0:nÛ©ä~wávô5QÊM¶é:ç=
÷èÓòÏ"ÄM³z®ã¹º1úï»ôs(
$K¡Iî¶0Ädæ#ö~ºÄy·¡±°p¤9ÊiðöÇ®ÓýÌRäE&1Õ<X|ßØ[
ÇrëÜ	ëBn 
GíØLÀ¬g¦FStñÃIÆÙCºèu/'rYJî©gäÞsâ@m§]Ï5r ¨>eÆ­/$!*Ñü"Ýþx09,¾8ìWÓ7vàçUoð¾Îþü.N¨¡3ø9ø@>$JàÎÿôL1G#übåÕüÜM·íó¥á÷ïçþí³ Íëó½K]Ö+ra÷pÖôl&{êçNá7è@IÇhÓ¶íÞÙ¤A,¿ìRÉ¹rM»tÕ²çéÍà}Zw¶Ù¡^¸e^HD6Ûð¹èîFÍÚ%³é:ñ¹*¦¦5ðëLªzÚÔÔ>&¿ñðûÀVÆÉq0¼èÃ<'@@YiåþJ£<çý±0Ü¯h	ÂyÏÒÂäV8-Ì¤%ç¿=Ý×QúóZ»£¤ÄPÝ¸±2±ð¢$gnöá'¸¤:+&daà³8a4"ïvBò}ß¼`êP¦Äa¶îRÇ:Jd*ïq+ SÐÃÑ¡T²?¹»q÷P0Âø2]	õÎeÏzÖÄàÆà©,á_Í,5±¾É3ôxÕ¥PJ¬ÊóæG*ê»u¤8£-Æ]el¿Gônü åÏãê¾Î"¸N}¿ä´Í ÿ~þMá¢8Þ²4ôµ[ªö(¸07oZÊOºzÐ¬æ3°Ê'=é `÷(Ù/-k¬Zxúà5m[«£ø0æâs8z<OôIcútDåÖþ`eEO§°ÌÄÇGWFIÄÊ C)îauzÜRËáYÃì2öx?]1#`9D/Ñ&:¥cåü]Lø'Gàg2¸ïÅ¯Óa¨ÃÌ<º~^*Uhû¦(p4®o´¾|æ
ª]°*ì~Uß°^Ç;ÑÛáÎ~¨æÖéyREérÅ#'}jMµfHì!ÜïgúpéÄøÌî	ª0p×¦ßÌ8søµÇ©²CØ©´­'ßC¹Ò© uU¼
ra[ÓÖÁMxOg ­ °3¿ÌÚ¬Âù]?Óú|m× 7Ï
yàøI·BÁY5@µ7¥:fU´T$³Ô8aèÍ?øñ¼ÛÃ	þS·e2æÌ ºïÞwò>xÛ«#á8¶Þ¤c³Oü®;¥ 6yö 56uÃÃüøãé¬RõöÖ]Ôx¡±¤rûpZÊøT+©¹T.T)ï¥¯6®ñ ÈÞzS¥Ü¨äôh½5,ý§7KâÑ¾ÌÀù'º»M.ñÞa³­§Jüh©ä?z;Tó÷´zwÑâ^ÆòWñ®Íziõ=Â>Ô!ò­;VRB¡âW~p.¥Û rMªü¬'ÙrÓúW×JoÀ{fLÔ'°q-þ(K n '7E
¥(<£,í$ââY»³§¨X´¬F]ÝqIGÌ:Y´Fu¿×§¾ÎÑ÷clÆ<õe-;¥HÈ÷h©-æ¨L!â6@FH3¨ÍÞïVé£(?eÀ"ù¬ Çô¹êSøUMÄòW`¹yálUS¥-¥_'ÔWi¹wNPã®áÊ±|¤Eq1õ×nz	:UË/yÜÞÂöYWínSÖ`\ßýd²!´\©®ÊÇ*NÀ¢ò)Ìvº¨AÃÕvêi]áÅoå,å dòµ¬ií_»-M`¤¸Àty$!¦î©ÞAì÷£µÁkK?åom¸Á&AÊoy351CãklDÔº'¥çGþ¼bÔùÑ¯õüaoÚ`u4P_Y¹âIäéc#±oQ1[}jn\úSÍ¼_fÁ14)
ú¬¸';÷²¬¡K~´Î»Y ªÑ `1ÓóI?âÕ¬òØzª»øÅÃ	d»E\E¼.MíaQ12`)ëép,9Ð²,U.'¨j«ÂfWÄYíÞæ>ß[¿$M^'¹¼AL]aê:ÏÃWÚ|=qçeîC*ä1$ö©> =ïMÓ7O÷Íù0F¶³Ø ¶çTàçÕT}¹Oa½Nõ¡³±àçãç¥^õëaz-­.È¿Sv £»däK]ÚI
¿i«ñ¥6äsÐI{E¶Ê%öùí6âÅ}îÐZ³³DAÚçË~²Ið÷×¹ò¤Þ~=æ¨boz~[¨¯ÞäÐÔVzî«(3" 8äí)~ü8Ö=ÚñÎÏöìÏm%h÷#!r n>yCPMyäoßÖWÏ;Ny9vü*ý@Í8ññT8ÑúóÜTövÞK(åZ4]ÙUco¹GU×b÷C_JG¿4DXNàÙh¡£MiÈ3jl¨yÚÃ®µ­;ÆB|Ëì®ÍÖ8jÄàU!	}{ò"%ÈoÚªÖÐè)²D6;w$¿¦}}Î8k),b´Ç§î'±»wõgSè½	xªèøÉx|×¸<qk­³cÎFÕKÙ°°ï«U¬ Ä4ßªC'BÑh§çW¶x¯-¿¸øÉ5èÙ,¶Ýû6ÚH­¡·&¿{ßÄÖØ/0e¦ê
G³ò
`$ßrû N= bY¼bdã´¿L;ßÎ?:å:­I\ôª<>äÒTÙ(¹ÂØhØ¶P,ôèMm-íô<³Ø-
mDé\zqV¬å¹r®â5²-Úa@ËÆü¯úÜçµqìvT8Íj¾ÇüÒp*'2	¶HÉåDÖðÊÕrúËãP?
r³àÖè_B£KU¶Â7µgÅ÷ æåæ~ø5°ZµPô%Ò=[G>éÇp[­^ÞÞ\ÓxÆÅÊ±-Û£âú¬L2»Â±îPÒ¡OÈ°v¹Ö%ÖÙ¬ð£{âªjDìÒÌ>êU`¢9Ïtþ»ÛÏÏåÊ¾qt­ö·
ØA»ÔézóÞTÖ°)Fí´ý:VWÍíêÐ¡,%CN=±|qYw{qõb»FÏ£ÕEËit¿\Â4YÆZ&â	16×»,ÑÚêP9óéUuØÒ"´©ìÜ;pñ_Öp\ëlÄÁ¤±¼;f6uxKåà=ÎÜ¼)&U{´%`fssÇ2(^+f¦×Iù	iy«©kÕUe´tSÌ­0§%ýUõ:õwb¢úî^å=	÷Ç©$Oø	»¢Õ¸ñ;!,Eèí¹()D¸=q4ye^ÈÍýQÉ¾_`pÅ5|ÍúkYjøÂ#'\r[§Å7W®48Eü°]ºhHËô´ÄXD¶ÚÃ^µI^x~k{}p=¸çÎEpÌU3âõß|¤ÜH&9bË^½ÞèÇ /@2XÅ	pêýlÜ%½'º¦ruýêìÅ½I]TØ(Ï»úÆæ+÷óØX4ÝSewÍ/>zºAÿE¶;_Ù{iÌCâ$³!=àvuè²ÅË ½Tz"øÆj/Ç®Ãúéµ² GP`
èÌ¤9õhG,VÂ[µ ½Àã2MOLsÆGcùd¨j¯wU¶;È8$úÚ
2hµð»î(ÃöBµº¹Òt;{-j('cx\ßÚÉ:y+s¾ÝÇÚµÂéWk6ÕoM§òm´¹/zvs+xM°`aüÍîï¬êß9ñmÛ¢óÐ^Û^ûRÜG,Ç:hpó:yE"gßù1Þ6t4ÙO \f»`Æ´$<­IóîÖÃyÓ¦t\|ûª©IsuÍäK1Uö¬Ü&¨3hU&HjiNânô^ÄÂÅÇEdã=×.gs3ËLü8v®r:áèyòÈ°±D8²#4¿?~ýZ9eÐZãcç/@©ÑwB(!_YEÕú©uúPÍ÷¼pZÒE³×j;¤7ö$.øàí°ô*ÂÑÁ";âüÃ_áí7m·Ïsz*¥BFs`OT(£¥/énAµl4ÉbÉ5(.î¿QÞ÷\ïÙýÓJçKÕlÉ¬Ú*K3]5¿lð§8Bxf½ªø8<ôÜJ}ájùOîÎvs^ÖÈRr A	4 ù¦R»>£øî>ÍiSk¶1Ä={sVp%öÐ\üÕ¹ó2èú÷R*Gt ªQàTÖãÁ¼ß	Â']}¬Dd[QBÂê¡Ü¯ÔmÉúap|NK²?GÉ`¬?¶Í.Ö@@¬"·l%\m¦¿¦÷¡l÷âGéé[ ´7¸>â|öè6±«Rÿ32£_LÝ=DpZèQAÌYã³¡·^Ô?qií rñUïÚøö¤Á0Æ¾¤g»SÂÃ5)IcÞ1TK+>ã¡*'¶nõÊ *@ßF]j1kþCô$ÏQ%ýôáU¼JÅ©Ñ"qº*ß·9Î¶PwKå¨}k'ÃøV#jRÂkqÎ®ë®êÀh­Î´èQaê3¤õæ	ÝB¨È³ýõSi·ÆôêòÌ³`£µ	ÏØ«¤h[äá«å+ðjÃ5.ÿ-BáQíµ M9Õña±nInÑ&~A?f§âwØ4ú¼ÔÜ@}1ôÒO©zHãÜäÙÈv?«úä-ï{Ù¼ïEGX#DãCððÉg#¦(áp×1{½4Px¸ùîX*xªvYIçý1Íù#|~ú= Ð'9ÿFüX9aS	¦ëÌù3xÚm1³Ã¬ÜgÂÍ>«^¢õ©UxÌ°DblVDÎ­º¼È¢9á¼ø{¥okØá
<}±{°Þr=ºèu¾ùhºÙ×)X«àAÛVé#:_JUÉ×[õÅ¹[ccn7°7^Ôg/pÇRW-WLT°GØ°àü7ka[³°|ÛÏ[óJxÝºÑ3ñ¸2ö/`ÃksSÀbÂD;ôY¸4zênËjYÜþx÷o«­c#?ð¹;ÎH^r­;s{lPåZ¾ÄvÊÒ*þtÛÈ¥õ8>mÊýz7Ð`´3IGaöä5®->ÓèÌ»!AXXê>4¾1c¤Ç[ÓÆ³ÊÎÓÙÑ´OrPÇ¢´®¯2}XXCBZôVW;$£¦¯Ú õ½zHÈ ËØ0ÀÍx}ÂE¡uîYïÔßñÿB£Â9G-I5pGZKP!bf&Ü-ëïóx¶ä^/ +<A» µ}Uór¬ß-jØä2ë»RG£·¯½Þt=é«X_Àºo±azÑåCVû{ßÙ¸>·©oUl´ÖF#z8|N«ÈIóM;MRýéÍÏaÝú(í'±è¢PÙØ³öÎñþ¶\ ÖÛú¼ªÂ¾ôfZeì,õ%Îb·4$­Í#íèZôð9{nPÐ¥enT¢vo^N-Ô2ø^>îú¼zHxA)>c¤Ç¾¯ÿ,¤ËB:d·ÖÝ¿ÞøÃÛøÑW³àÛþVþ[µ¢BL®è: õF_ÒUT±9ËÛ®ÊNÀÀ¼ÜÓé`'qíg'^ÃÙã½*kmÔO÷3MFô&$M3®í?I©I8=)ëÚõãtu±S«VÉ,¹ÑË_~ßNVñå¦Âz&ì.`¯#RK¶ Le3Ù¿³ÄÔr´5¸KÎGoÍ²{©¿)to2¬ÆWäóÙâd#G$>Ê ¼¬÷_q´¢g`ÎÐù½|Å&myÄÚ-´D3Ü°ëa³R§êc\m5ÁæÃ/çxù­!3) ¡ÅªQäànµûKHåÑpÌAêpuu{sí·áo?Ý~}0$·¹±]5póÜàgÇ3©>:<úáJ%¿¸Ð%¾Qé××ÅlQ0©ÝO 7ÌÉÙ¿-,kÇ+{=ãØ6s+b¦ÖlUy)oª<þüLûFdþ´ZÍ0Ç³ê»"ï~ðé8Ûñ¬­&Õþ×àÙ/¼# ÕQ1°ðÓOð/ÂøÅK'Óaó¹7³ÛùÚç¬¡¨ÏíT· ýj ¬u Ç:Õ êr¬ÁÜ&E¦Î*YîIÙé&@Â¬èZùÛ¥çI ïï,6¡«49ÿê¶E$µ{e/ðÚóÊºa&ÎXnj­lñ.[²âZ7hî$	W#B»u·¦@k{"él÷ÉÊX\i9Ký.$6lÏò®Cúnã-öâÇ¤Yµk*¼IKèo/É÷]|úp½Y¨{øºç°P´åÆZì±£ªÀg°TnbmYpÜ"Î8ÚÓo¥>à{_3(h°º
aevÄºÆ¹+áÐ±|ýiU¢²úðT¼Ãü|¢äò3qyÃaÝEÊÄ8Æhyö-ö3mná¤FP¶0Èe /6ßw|XN²·bÜÔÁ4Î¯ÜÏJP|õíìaþ9ñLò)	ÞËÃ1Â¤hsªáÆ`¸Õ8å¸°Ý`ñQU£"µ/¤rÁ` éÎSw ¥LÖ[>ÐéLF}Ýf~ÆSÛÌ®]Öè¸î_ås[D]7@îûH@Ïß_iÌ·x²7àda¡ä#°{¤YÇ²¨Ö&3<JEaZ4P1.³ÕÁh$H}HÑ/Ì/]_½ºÍøàüãioX$#GMà%x[ÉqO¸¢v#Ü2ããíÎÜháx*aí%s¼_ÇÝòp4ô»VöT­o%ü¥Ödt	ÁÄ- îò6¿©ad ïÝåbèP'$ÔªWú8Â8øÑ{xÍø+¶G9.Bc[9qÊ>GX A·ÉÿÒ5ÑæO?¦ïÄ¼#J¦Ê¾/zêlsSP²ÙüLÿlFáåÔÆÚpê¶>qà&s,Ú*9ÅÉ>?ÌiGÃw·QøV(0´ýp8"í"ó£t{S$!Q8BÜÿËmR9ú(md!}.¶}Ùô3IóhH)2s ´a(~jýñîâä­nÄºÏÝr¯£xI"¹û#]bà ¶AÓî@Ìv7Ûd­Ò Øº_R¦=ÏüÅânýífN^zëUìÌ,d)îaRïL^¿$H^WÛæXm¯tÕOÐIOeöÍgú¨Û?:'`2c×âç±ôÉÖË_AÊÖùgò<¼¦þ¦) ¸ÍiÉê»9&äåæ|µ[E¥:ÇQ8xtb/;Iñßº:Z>;øUXc£Øz%d0¿3`¨ZÔ,Ü{\¶PÇòB>´W"ú¦ä©3Ó<.3°«ÂÇ÷hÇéÄøëó|Aá
ÖÚ²uëNºç~ùIkÓ®¨¥4ºdyÖ"©äÉÙn·ÐrÊ*£¹U®=ôÍR¨ufÇaã¤*J.ä¦ß'çª$è½Õ\e¸pèµ»	S>ïueï!õ=f·ÃF8®¥P=^J¶Ë7#ôZþWwæ@BÏoì_#O=Êe2F¤}L¡ÒT2U´ÄÄ\æºCÏýLdj8£lÑ	ÆaÁ/O²LáJÐD~	v=Ò¢§gde+äVô×râ^z}´×àÍi!0Ä±K*$O¯Ñ¼¼fÎüQßNJ<½|,¾öúÌwi)v#lÅþ	Óû«^oÁ?Þf ªtËÏ tb=¼«ÊvÎÝj'Ê¬µ$Iëx5òZÖøÎ»¡+}l¯²<ÛÌØ¨~wbAÓ&9'BÞÕÛÁÝ§òAOðÓWR=BÀ[K*íÞXT¬×ÖB6²á¥7Ãñ!nÄHÆÊ§Ùl[g<r#»-¹¢Go¥cß	Uc¬Ýsw§OJ7y£øuß¥J{_O*[Æ_ñºÁÚ÷Mn¢£_R¢?pÌLin§8+xüxÖmX^oÅ(Tlº<p)sÓãÈÇ±à¶VõöÊ÷ÓÊÊ½ê[
ëCÅÌÔ:h%^)*åÞÅ"¤2&ë¥XJêLÿbV -÷_ÖÏN*¬5$bAºÎù¾.ðóÆtÌÓ²"·Të^À±¯ÿ- E«²Ñ¥PZ«d³ ñx¹7.¡ÔìM@FòT/}³Ðùûû1êNýÇÇä¸Acvµ[½oßMÉhllîI{ì-Tt2RÃLê7p[Øïu¶lBN$Q_hÖÒmÖÓªÇ,,¯úÚé":¢u{aA~kðúÖC2,NÖàÜÞådÌ^Õ&	QiÖ9âUÞ(ZÒ^òcø'êF4_z®èNIt/^B·å»k=,X|é7OðKt.g;w`ð^¸áhxàb7ãî6bÐ3ôÀÖ~IJÅä%UóiëºórÙ¢Q$/*F\7á9C¦ôÇÞL2µç¦Ä_%ô2i×òyå5Í^~méÓÃpYý4Ëè"RÈT¯0iI<ýzåÒ¯âmU{ [ÕÅVm¸(MìÿZjÖmä5IhJq¶lLo$Ud :ä\÷}ÌC²§ô:éá·W_)yâ3$W\y2X¿W%êê¦Ñ«ÖÁ¬FDù]Ü±9k®!>º<Z^_¯az}¥K6Æß­~z¹=Hõpßî?u»dð°0)¼4Ïm6`Aöû­X#ý{ !.ÜÅ]V»ºJ©ÝÈ_àtþ7W
endstream
endobj
88 0 obj <<
/Type /FontDescriptor
/FontName /YNKAYN+CMR10
/Flags 4
/FontBBox [-251 -250 1009 969]
/Ascent 694
/CapHeight 683
/Descent -194
/ItalicAngle 0
/StemV 69
/XHeight 431
/CharSet (/A/B/D/E/F/G/I/J/L/O/P/R/S/T/V/W/X/Y/a/b/c/colon/comma/d/e/exclam/f/ff/fi/five/four/g/h/hyphen/i/j/k/l/m/n/o/one/p/parenleft/parenright/period/q/quoteright/r/s/seven/six/slash/t/three/two/u/v/w/x/y)
/FontFile 87 0 R
>> endobj
89 0 obj <<
/Length1 1009
/Length2 3721
/Length3 0
/Length 4378      
/Filter /FlateDecode
>>
stream
xÚ­Sy<×&&{
·Bd[HY³Ë34±/e©¡ì²ïÙ÷­ìKÖ"²SïTïóô|Ïûï÷»ÿ¹¯ësë>çÜüÆâªH¼
ÇÄ!@MÏ"@$$Õ(	Ç©#H( "/T])I SS2
jxgOÚñ	Vù$¨bQ´=è!H·PX=ãíÑ(§ Á F?+"¸¡DÛ ;#ÇþiHçdÓHWç¿Bn(b
¦(xÆ@¢ÁúxJ/ÅÉÿ©Ã]1}ö§üÏ!ýOEc<ÿÇ:»P@DpÿN5Gýö¦B¢]±ÿj´½*Î$Sh"íB Iö· úÅ£pÈ Ìí°¾¹Ùu¸èï}þ Ð8§óßª?aÈLíXIJHJB(ç¯·ÿê¥³Ç#Ñ8ÊA@a @@x2R. 7@ã( åA1ÀáI2_ÀO`ü¹N, VûIýBrÒ ØøÀ&#ÊöÀ?H Ûýd(öx,öO")	ÿ úÀØ¿!"Cãþ§"ÿ(ÿt£H;#(å@úÃBþËþ>¹?µo@ þR¤Hî:ÉP>ËEøMüïR¯\Á{xKË âRPer,TÒ÷ÿäÙ»(H¿þÊeüÐ;B¡<PöcÃx{Å ÛO_dûi¤õæ.R_q¬Ô/m¨c
¢Ædvê¸\*¹¾À~l4Ïçþ^ëcø¾êï7t0ïvs>Á«çúFçGçs»K¬5/·¡Ô×ú§º²c,ÒÛÖÚRÕM>ÑMðS5Y¹5`²×á	Ó{Á%BÒüFÇã\²CeîMºyL;ù6Ðïö=úJÑñu|­+Û^}rôõÖbÿe+ÎÄ!Ø\ÏÐÈ­a,æâ~ÄUQ¾´äªêï{ù`^éBq¸A¥ÄhL£òüã¡Î÷§}Êü$&»uÝ¥$Jæ³ÜúM@ê»ò®ØÙ$®\¹úº?uît¹ÏBZr°áÖ5"v[qÂ¡æklù½éX5¯-yþQþüäänûd<ÈúþÄÄøá­ïÞ|sXy¼TÖÍp1.â½f´åÔ»l~'YrºÒÏi§­ÂÜpö¶­·òýåÑøùT/ì?¥³,:P£]ulà¿Ä8®M#û0`&ëêmñª»\¡Ëm>æÅö«ý4#æbfww©;>õ;MÛ;0äÈuÜ´gwùn_|wª(GH&-¦0òtd^æu7ûê*<2àåã©ðJoNá|rF­óÈ¥wÕsCç#"#ãßÜp-"ýçî|¥ëlqÄ;­þÝob©Ù:×6§àZìÂ÷{ÏJ?¸å¹l±È]âÝ]ì?øÊÇ×½9½53=î_úÐË+<úÃÝï÷Xî©v«1u?õiN|Ý{÷vó\[eçµ§îwÃ¥íÊ@+óqín$ºÖâ]'`s>dbÁ¢/Ã£¦4b2:&ë&gÃV³Pò^íÐ/,oü#9>ÉÏr£aúuÆÓ¨£eÅ³(¦úÚ/,PØTÆ×âa»÷¶úH­êY íýK¦xyÐèí/hba÷n8"´)ß¤`³DÉw!; ÖFI½¬} 6µ©¥ç{ëé0X®þð©;rY·SIq´R¥óuôc§aÍgÂO0	|¤ß±*bî7[b:£¦W*}Êô)àA·ACÍ@ÜN=êËÄð"44JX1>F³VVò£Z7õDùÛì¥Z@;_W½§t¥E2_³×ÊëqÆÓ« ËúÕuVÞj½ë"J	åçç_LÐág×éaºn£±
KéJ¡^¬~aÛ:dû}V)`ò`Rîì<f;^F,µYPçtôëzh:kw®´ $ÖÈ»H¿Uâ¥T ½#¼9¦¸5ìðcãôFÿÓô¢ÄÜ¨[b»£ü7ütåýi\\éµê3ZOØvå¾Ûº§nêÒu;Òvm5Ë¸¡I+£8X&OvS<ÃA·ÃC×Äó´.ôLÓ­#pO_Qº<?¦¶\°ÕâGêc.q5kòÖþ¨RÎ/â{äEyLY_ö<­z[yYv3ÿ£÷|FÉQ³¼ü·CM²£ËKv/½Î;-&Ñ+¨xßÝHk9ÃL¿ªÇVàT*Ïýfßy]Ð×¬ñÉI ./Òn=ÿHíE©¬è (»r¹¶&ìÜ)õ!%i-v_²³éT¬´l	æôÑr¾êÉÇ"´ôv\éÙg6uó-ù zRy%+b+n~-ßãÍwy¦hé:´-õ|j9sd¦ºss'Lµ^©v+)§ö>­¢B­;Å-ÚWkàZòÈ¶èØè¨u2gih!±¹1RÜo¹oçËÊÏÖX­.rÂ×'óÜw>V5½MçúÙõò)Î½àÂ8½©øï>êºõò4O!h_åYÀ²å=½,MÜÖ7ÉµZ&+ÝÉ{~ôn>BÜýûÕuu_Â`{ÏÛÉXv¹æÔ}[ëÈ¦·Rû°Ñ1tóhÎÒ£¾YG/XÜ*0ÂF¿óÕºÖÌÿÍ «öUà(Q*AFö­Ø*°æ=,VVÌ©å*Üõ¼¸s¶ç¸·gÌPýB±G¬ çõHAoôëÂÊµLôÍX¨´¾í§G>»¿eÛÆÍÍYâËìÄB³,î¼6 "YªÏ«üÖz@õc¥±¯VG|mó:à¨.)y\fÐÑ16~\KÀ4¢{N;¯z3÷=¨PÖR®y0pñQMj¾À	ß¬»×¶ùÏ5
ÝéyLo,sòAxsÏNÝWGIv1±PÁÇag	æc¶ß$ÔÒBà|]þ³á:=lÇwúÌÃè² cBF»æ«Ç^Ên3ª¸Cf¹ÕÏ9ôhß·Ê¯P¯nÈuB½SÍYo*z*NpVÜ`0)+a;Õ¼ÜLºnO^²&N²ýØÍ7bÍN6}by2ç`ÜÞXn{0ÆØ÷­ Ä;EMÍ0òå\ÇOÜj5Ò``/·bjòP3Þ:~¹Òy @Ï«fiw rÜíËj'÷PIgVèµ_È0Câ=h £kÛË<|&|J`B;È¢ßìM Ò{È)¼Iöý>±h1ì}#r°X×òn+IÂ.ÚéWO­rÚ$kT°t`¸iq?¨gü{K¾Vj¹úB·n§
Õì81°`áöîñw¡oãðÖîÙ,.
¬NL×´â©Ì¶Ú85säÉÓ°ÔzG¾)T$OîM¦îLß£ªZ<Á¼H7D>LîÎR-ü"ýÚº&XävÀ6È½*ÉÓ_XQå6lRmøIP-FNîtK¦)w¦¾ÏÙ??BÐ«[«0¡¿K&*SA¯fó&åd{F$ó³Û@cUë3²uWò'Ö^!SÓµ¥Ylâ'dû¢ÁôKlëµc©CsSMuÓ«/Ee¸ß ¤TT¶ßÎ ÝÅ_WÄ¨|Ïß°¬*ß¼$þÑáy%¹Zï¸Éùõ¬jÍ{>µPc½WRG>WÜ ïêEJsÕuéîÀòOÅÌ\Úú.¢÷(É è2¿¿Dà¸WrØ~\DvÌÏD=^¡!X(«ñþh{6n×OßìxTg,ä¹O£öLâ1*ocâhÖ­][RzX/:4
MUÅìÆ4õsHAú7ñsµ"Ç/@eUèÚýovaÝì4©Ø³ÏÊÂ|bÀzõ¹aõÐÞäoÂ5Ä:¤|¯Ó³2-¥ã\¹¥½éäÑæåE%¼?¸ïó©¼UëY¢ÃÂ¦f#8"¢ }êco_¸øPv&4³ÄèÂÙÑ!ÊáúÔÒ7Qç¼egv¿G,)Óæ×T¬B[í¦'Çñ$AÆQïcáÀºoÕIÄ9"Ãueàv[=ÛùÏr½Ç«¤@GG»^ÃtãÊ«ëÐ[_[eLZ¿(ËU$XÕÌeÓ2SO]²ì	ykNí)´§ø\ám¸¸	/ÇÇ¥Í>ÇÖ¹[ix/eD4C#Åºñú#hA"ùXüz)ÙÍvºb®ýôÊzwbÍµJÿ#ÃQe!û1>ÝWý·h)Åæ¾íüh5ÕWóçn~ú(Z®iS	â¯Ã¬KªhýqÛ&5ÎròëjàCw2G=k¸ÜÙ+ÂoÂÈnTÅ7Å¹ÍôÅQÕCao´o²4DÑy2æZìá3¬ÐxcKÇ]­W¦  Æ&¡T0ø7R\dÜÖ·qn<íîï(½¼Ý¶ Ãö9ÝWö%-×Þí?szò³=.}v©à¨Q{Ç¨&[>ÍÏ'ì]{YñúLòèsý3JçTiò*3êUãÙ««A@½"Ò<Ð¢ÒoyáïDåÎÊ¼AK§ç¬±ú[$Däö§Ó¼@ùà/=@×{dî0X=Þç¡N÷ï\à[b«Ì$Y²6'ó	ÔÍ­¶E9ß~f&.ëÂ¼Üé{1ç­íÃÞkAÄH¨Ã÷D«cq*TîúVt¬¾þæzIµð#~Îï²2ÍE"Ø7³4gKEyÆ³Ú5m¨ÃÁy,O¯,³E¡ÈþÇðõo$V²!¨ë¾Ü9#kí«IkKdmû£Ê6¥¤«}ð3O´ÙfÈ²O	 ,WFëF£ó#;·æm7U±õööb½{peèSí|/Tk6CÊMA'£uºÞ <¦/W>Ôfm|ê L=«q¶móÉÇ?tÜ}÷5Z'|#êd¼/À¸ÒÊñ"lõH½æ¶q=Ø+Ê3ÞûiÚ:WùF^|m&êQ¯ºI@öÆo63CUÒFÚ¼Þäééuw¡cIûCw|MxáZï/Ì6sù,ÛgÊ}³À­ßço$)X"Ó}qaªmµèSÿdyÉ´+¶­Jßõ¸bÆIÆr63gyÞ¦ó;çfìmhr½eP!séëX¡ûüò°ÜâcÊWáqp¡ùrK)ßÂQ[Ç¶OF7¯ià©a·Æ®"p;l±>)öH5)°ëtÍ´çëè±WPÝëúfe
endstream
endobj
90 0 obj <<
/Type /FontDescriptor
/FontName /NRWVXF+CMR12
/Flags 4
/FontBBox [-34 -251 988 750]
/Ascent 694
/CapHeight 683
/Descent -194
/ItalicAngle 0
/StemV 65
/XHeight 431
/CharSet (/C/S/T/a/b/comma/d/e/m/nine/o/p/parenleft/parenright/r/t/two/zero)
/FontFile 89 0 R
>> endobj
91 0 obj <<
/Length1 811
/Length2 1748
/Length3 0
/Length 2303      
/Filter /FlateDecode
>>
stream
xÚ­Ry<kNMhAWRyKeßÆ¾$²Fã}Ía)*R²&ÔqìNB¡R	9F(K¶:¥ãäõuÎù:ÿ~¿ççº¯ë¹ëwÝ·³ºñÌ¡jz­¨	"2(lJd@z ¨«FÌ  @¼¦V¥ Ál:%àP6QYiFAB"Â-q
ô ©3B¢@¶`D¥NË/B '(¢Bdd
øA^6Dý@û{ÌþABô)@Y`RX$#0!Úü	ü?LýÜÜI¥ÚÛ/ô/D¡²ÿ+@Ø"dÿ,u¾{³ÈfÐÏ,A¤RHFp 0ßKs
";P¤#?}«C0ùgÜ¾Y@[YÛX:©}ç7ÎHÙÁu]ÃàßXÂ<0(
Î×OÁ$LÃD:ÈF	6Cp@P`2Ä À0ZF' c?BG-S04q¹ô,öÿÔÐÔ¿¡`=ÐÈ? @3þ8 }§ÿ±1ÂP×ÔÔ±¡®ÐÖÒ=ö?:N`Æ·MdúûS DBõ?CHû¢/U.<nÛY$¢*dPsÑ®²±»~í©¾D!j~«5MuðÛBqäÈ|Øâ¶¸;Çvó·'hÓy_ÇB}Ç2Âk·¹½Ï°eï?5µîvuÏÜ4NÈ¾kðIaÊá¼WÞµLå8(}¡°¢É#ôfSf4^ÛÍ<êsc·¦ÓútZá­X~Øú$aþÓSÇcÅn©üÜan\ÈËNþê#ê©á­º·û+ÛqI)O¥Ò£MÙ¸MÐSþ´>®§X0½G~ª¯ÌÌ;:06ó4ZV¿¼å£²ýÌ~aLÝÐbàJ8-çÂ´Ü¶"âËþ<§YZAQeÿ _õBÚhÉ2ÑÉ;'¶/y+ILéÀó¸ÿør³Ù{êCGõIVNÅ7eöuå3séêx9ÉXÜ+*N¨!0áº9³r+§pWIÛ°÷8>%Ðãw;ÔôÔùÇö)ú¡s+ÅÓÑ¼=IÉáü¾ÒÙöþµÅË{wc¯w&ÇMZêØ­ø°yh¶m;ïÎ% ÙoTÜÙØÉý¼_<Ç)Xóhá'îXã:åzòk4×è¼~sRrOëLØxnÚ,©±gºêç~¶Ñf od]Ë]¼y[£ÿÆÂpKu§Ùþ «®Õ	dEl<«ë/D?,áÐ÷mÈ²jQÁ%X^Û"%VÃñîÝÃ¹¶G5À>T=ôÃ/#ò4¶pñj×¢»e^r;bÖ:$jô0«SÀu^Ñ¯úe7SÄî¶'pGYL_=b¼údlQÕN¸ÅÞ
$fdâ+;"¶ö¦/[ü*ÒÂýìùÅ'
«B×·»0î^ ³$Wß6ü8FîíwìÙÓ¨õ2ö¢¹ÍÐÂ7ÀÀÕmüÚpéÖ¦}:ÏÜ¹G±Yxé¼;Ô¢í¦¦ûÐÈ³Í0Ø?ñPhuÎ+!r8~êtíRµìthoÆ¨ØÇcnõõ'½m"¢´rHKR>ýìêßîNòë
Â:
äUÛ[b©^	f×:çÆëÀroåü»Æ÷^§»ì>¸-×£âÓp¿ë|ëàùëC1B0°Ó^rRi´ìÒ÷ì±¯]ÎØíEÝwîA.ÕµùÝø@N(z3æQ4©-<1ß .Ët«\dÖ77¸vÝPÐÂèc|Ã[G>ÉOi~®|::÷^*YëºØÞ$£ú¿Ë/¨wéK2ÙrÆÛ""e£­Å¹tHÚÒ¸JÁö.{gwÿêiû²=Oªò_÷AèçæúvéøGçõR}xîüÌ(°~õ@O&)qy·OGwçO?µ·ì^³åòñíëçW=& ãn5´ÄÌÖ´ON}º¿ugq¥%KÒ¹Óô>ÎÕ¶áÕ	%¼¬ªü­¯/¶õ·v76!*nzúÉYg*q¹ýöÏÒ6c¾ÚÖY\+ÞåÌ²¢È^f,m1éó7î©¼ßSÓGÝéSôFÅ¸YfsÞ8
½"MäÐAß£¥Zü¥9Ç5ii«=òUÎr8!ùçVÜCWöSg_ømÍ¼äÐêMÙ9Óá¦NhÍ?Y¯³.Ô>¹_Õ u+ÚÓWh_ædyÒ*+~íµÙ(êlXjñìî7¯[bÁÆ½«+ZÏMüv½Ê¤ðë1?ÇoÍäÆãçn.}'ÝqÞ¼>Û±z÷®v}kGÛîÆ¨&BKÕ+.:ÍNÿcNdKêµí­Ë³WJ'ìø%y%¿¹Mm]ku d<iò§Ò4vpÓdfTXTãÆñÕçÊôpÂAü®6Ztê«cZoHWÏßª#JÈ>¶t,3Ûà»^s!`æ¼ZRíÉ	CùNüôöFþ»bÈÊ!39ü&ÃþôGjCè5í<>Z~ éXÕD¥'·3ÏKXI&«×»XX÷æWxò$PÍ`íèU®Ô½ÝS=óvGÉoß;R»»ù5Wö_ÓÐfÝuu0ó
I­_ñù{¤=áeýÚÔ<ÓhSµã:'ó*T«Oý·ej9áÞPeu¸^HaL|ÀÝÆKl?¢v"x`^º`{Ãôï} ~¯æ¥/iF¬ÉRn.ùÅw4
endstream
endobj
92 0 obj <<
/Type /FontDescriptor
/FontName /GEKLHR+CMR17
/Flags 4
/FontBBox [-33 -250 945 749]
/Ascent 694
/CapHeight 683
/Descent -195
/ItalicAngle 0
/StemV 53
/XHeight 430
/CharSet (/a/f/l/o/t/two)
/FontFile 91 0 R
>> endobj
93 0 obj <<
/Length1 733
/Length2 1089
/Length3 0
/Length 1603      
/Filter /FlateDecode
>>
stream
xÚ­R{8YN¥4ÝÄD(VDÆ1#¤ËäË(iæñyf¾o|fÆL4[ISò°P-]¶Ê­tQ*I.qÙJjG­l)Ú¶Ýgõï>çóû½ïyÏ{Þó³2	³gpÐEDöÅx.`eåA,"Þ,ä
(..Àó#Pè®TW'¼P¡yq"`ãµhäÙ,²Dq ×`³ø eÃHF>H¡P"I @¡ ÌF£~ü.
¿¶9bá7Ha¸)`\páË âPü.wò/ÎóùA,Á¨<Ñw(K óeã¨@(AD9§F@_­BX,úX|Í@x|¿¶àD&,8!°¸,~"4ÖÎxxlcÃWû2ìÆ~s
aÁhLøè(w¬¦ü[ãÙ`°DId2'âëÛ.zÜU>åÀ>4:`aKFÀç¯h `I$Åý:Tx$ Å£I§Æhðý<=Qi²=ìi¸&ÙiäMÿ!²Å!¢±áÀsøVsa<5BlBg;ÊvÛ¿¯b{Ü§äþqm[-OÞÌ sWZj¦§vìÕâÿr; Á¶÷l¤æD¾þ¬í³¤Ï&éÕ)?62_mIÈÌkÄäo¼dù&?PöDhñ>upvUEëÐsVðÞ;e9kÜ(ü£~°8ÄÆ{ÕÓ©Ýæê¢$åu¶Ñ#ùüpEÚÙTóPÝ¼²N$Ý¬É=M©òxÎE;Õk´Z¬§)Ñ9=²nè÷Qmôhä^2®]ÀcíÊðµs2Ë(Ù}àRågÍ©å÷©3óV÷lÝç¢eVÛíÆ)årÒÖîÖ´;ÅIû-ª`©§xQïQõøXêóÇÝooo"èe´EÜ|¢<¾¬L^ÙkÔ|¹É_À(/Ô¨Y.;¥t×&)Wçn4¨ÐWÍ¾¾þp	4Y:<{bZJä×§h]t	M&|VªÒÏR)ºa¦ë¼Ü	XÛal;}nHNzØC­Yj·±Ù­KbßJ{­Ñä^=yÜ³JXÕ`§Y¾Æ·JeFÏx;äÿÁ¨EKO¦l¹<¯¢¥¸ßlT[2'ìêá&[úHÒé;]SØµÃ±SþâÒìOÄµöùµYÕ°áÈjßÍBûø=ÕYE3}'öÊÒÛÊÝidD¶So§*y¨¥%ÜóêèNéLÉzã×¦T¿eç"î¹ÿºbýéHíóÅÝÓnNwL(lÐv®-VkésºÑ¾aï¾µa:#nÉ\,NÍó
Þ¡­Ö8Fx2¬*yU)[½ý&å'¥ÒÞ¦fó+Ã¥æöÒæ×·aKÃ-EÎÎK4c~­òiö¼°7¶Äùæ^ÙãJc´õLÄ·'ÖOw6ð+XÐµæ´KBYqéFJR¦ZRs*î¥Ï3ÞÌTâQÿÛ»õ\]Åãp6céÊ¦ß¬ïeíI-$Ô¥d,>ú®èY/7¨,]yu_½aåòÖæï>ôèÑ ´Æ56û÷#Fè^à44ï¤-m±ÛÙýLåù:Á]ivåCå_NFò`K?[þÄgK;ÌúYH:ÊG×ÓÖ'Í7y$Õ5»¯y{¢®?¦ï­Ì¾ÅìÙ./Mà½üi9åúùºwÙutNÙ³ÃÞ} Mg»èñ5èW£ÖÅígÌÄ47]³n¾Ö|By"
¯=¯wÊúÈÌs"Ý½ZDfÄUOï+5Isg{û¾«a<ííªm±þfº.±1sÝÞuF¥]6ÍmV|¿tÞÎJ±öA.8¥ãíûÊð¦súÍÎÓ:^íCÍ×úÐl¬4Cj×Ã§7Î:°¥¡FTõé*Ð½Ñ²Ý
endstream
endobj
94 0 obj <<
/Type /FontDescriptor
/FontName /OUVHFK+CMR8
/Flags 4
/FontBBox [-36 -250 1070 750]
/Ascent 694
/CapHeight 683
/Descent -194
/ItalicAngle 0
/StemV 76
/XHeight 431
/CharSet (/A)
/FontFile 93 0 R
>> endobj
95 0 obj <<
/Length1 801
/Length2 1738
/Length3 0
/Length 2286      
/Filter /FlateDecode
>>
stream
xÚ­Ry<Ô[.rcÚ,Y?¤Hf%ÆÒd{,f~Ã1cÆ!dëVdHÂÛÕF!Ù,IjPÖìQ¶,ïÐíöy»ÿ¾óÏy¾Ïs¾ç9Ïù*ÊÙØª¢pó 	LWE@:¡­%  p¢¢!ÄÐ	²ê mmb¸j\^SG®£Æ/ÁÍ(*¯´ 'H#`1dÀ
Cw=¹=°`KÁ@º?@HÀÉõÞÀIÐ¤ù8( p,8ºÈØº#32hý(ã^?)æÍ5(qM*\8
äà@<fMáÞrü?LýÞÜA"Yc<×Ûo¤ô/ãI ùÿ­ xz1è °¢à@ùw©øÃ#0<gÍè"»@@Uª®ù£Lð6!ø8ëà1$op£q¿á·afeãhadªò÷¯n6nçïð_êø¹Ñ~À8GpÜõsçòÛeÆd,G sÇBCÀÐhw>¸HD 2ô@?®cL¡s Ü`<YÿTM- f¸^ú 0£_Hÿ´¸èø?HÀè¾üï×;FñTÕTTÕ¸BBí0 ¥þ!A£dúÆxq3üñnê èb!ìN
AL)¾bÝvOÙ[:õNÄ«òÈÂT$tâ#R¸ö´ÕáE
	÷§,Àpx>ÉbTP] -,ò½PÝÝÊYi¶[§±Î®<õµ»<3bFØ²C^OU¦»¾õúóå[!´nKNÅnÉ{×¹2âÁlîco»SøqÉ|nÚö^mZDS²)ìÜzqç´o"«lÉÊí=;Rµã2­xß¦ê-ÀýðýÍÄY¶c¢2«C`_ß5EvÇ+^£ÙÅ¼¤
77f÷Ó÷ãñw­ÖÅJ-Ã¤åRË¾î=ï¯d=·©8Å§Q´4V]=î§{2ÿ?»Êõ5ôÚµF9úåë|ênÝsî_DMW²«h/¸É
ÑÇv^6,AÅ±9æ¥­LHo\î¦óÛÃxõ^²æ¼ü8£SÃyò¼" ô³~¦â¶v+*ßABE¾È¡6:Þa?nWÚk;8&RNíç0¥¬§¨N[QxË0nbÈ&ÒVF- to'ñüÉÞð³poFâÍÍùº­\D£%jêøò·^8úI÷°º«L¤{VHáü(²µ^æ\ûãY?B³ÎªuéõHiØþ7õ¬éAºcÍM`!¬©Z;åmä$·$\ç¶ø£Yl®7OØifI¶	ñxöXojNÉëíwjý«+vÞX®lC£c¿Ù©¡ ÜL:ÉêOç$êiçFómjbú\³+vâU,C^.ñ¯ôQEE§,2åD9±B.9VïÒÄ#]XÆ«·óI¼Ææ´+vn1Èúüfm`Id¶»(Åt"Õáý´½`¯¨Ói®ü5ûdÌwî9±m°
epÁÙø¶¯%¹XÙ|ôJÇýðÚ7ó¬ù)S¿e+ÎóÍm4-ë#GAa¥vOµ)lyÏ3vxÌv^6túso·î¨'Î2Ó(ùúÐcË4ÖBÌB{[EW^}%)1îxÆxIUÚYEjyY\LÂýrí0Þ7f4/3<®â&ß+>Âí\tx7søáW¹Ï	ÙvÉ±^'S¿?®Çx¹ïíô^½2r4hÊ1î_UuôÀÐ]E³¹ _^Í*×Âaþ½[¨B±Ñ¡²á5Õ·ë?J¾öCgIí"ØÕÓ[wÇúMô½¸Î¸oÍ¹Êô§OoÃ?\¡÷wãu=¹3ö,ù-äl_í1½6Ü¨ù¦ÎÂ;K*~,öÎK@×SÇêIS-£êè=0¡-yû³FòzPJbñçúØ6¾fh¥L=çÃ(bûìÝ´BqÄ#/Ä,Â ù/³ÆùÕs.«tICùå+±GÏçêR¹kç¢MÜñG'Âh¶¼xm*6YÐ)]EäÑrNÖººÌØyÁ¤¨!cÏo4aÎKQ¥îú"dE¡8×ä³²âÐéeFhqQå+:©®x Ê%fdØæðÃhÝ4ñ¾ÔÞyÚ6µ¢Ó·Ûï Nªwq$jÃîqóp<­ñµ¢¦´¯ú{¦<HÞ}¿æë®U2s|TÍÝ 7OíyÔZø©hDÑÜé3!·-Ô½G>´î¬]ã¼i5£4Ð0æÑÃÀTc
³ü>KS(3´Äj!·b@ðlä4®1ªk AK·ª4áÂ3½=Q<ZÄÙ^"#F_íûaíô¬¯`Ã@9?³Gz±öMêÍ-j¾y0)ÖkrhM=ÅS#iÖÛs§»ZÈZIf*Iªß=d¢õ¾SGîÅÐiåÝK²}Æ·Ò>ØØZHË¦!Å>6ÜAÜcz= Ç¯®¨3q'ÜFw|yå <s÷¬±±äû³íöDh4ë_%M{ä®Ñ1±¾Â3vòO¤&	Vjz¥Êø?înwé2|Q±éÜ½Ûeôä¶«=+z&µ|hhôiÚ¦X;éj*l?såÒ)é)g¨Å	¨]y ¿³»)£ZÇ£­ãÅIìQ¯qá×%bõrÐ09Öë)s§\åÓÛ©(+ß
ÞG.:òA^îÐ¾ðqêö·*kèPð_Äïow
endstream
endobj
96 0 obj <<
/Type /FontDescriptor
/FontName /MPXKDH+CMSL10
/Flags 4
/FontBBox [-62 -250 1123 750]
/Ascent 694
/CapHeight 683
/Descent -194
/ItalicAngle -9
/StemV 79
/XHeight 431
/CharSet (/C/D/E/O/two)
/FontFile 95 0 R
>> endobj
97 0 obj <<
/Length1 752
/Length2 701
/Length3 0
/Length 1223      
/Filter /FlateDecode
>>
stream
xÚSUÖuLÉOJuËÏ+Ñ5Ô3´Rpö44P0Ô3àRUu.JM,ÉÌÏsI,IµR0´´4Tp,MW04U00·22°25çRUpÎ/¨,ÊLÏ(QÐpÖ)2WpÌM-ÊLNÌSðM,ÉHÍ£ZR©§à£ÒQ¬ZZT¢Çeh¨\¢Ç¥rg^Z¾9D8¥´ &UZTtÐ
@'¦äçåT*¤¤¦qéûåíJºB7Ü­4'Ç/1d<80äs3s*¡*òsJKR|óSRòÐ§BçY.ëYìª kh¢g`l
È,vË¬HM	È,IÎPHKÌ)N§æ¥ ;|`è;zD¸EjCã,WRYª`Pæ"øÀP*Ê¬P6Ð300*B+Í2×¼äüÌ¼t#S3Ä¢¢ÄJ.`
òLª2óRR+R+.Ö×ËË/jQ M­BZ~(ZôSA)$Ãé'§üj]#K]K3 Ñf
ææ¦µ(
KRóJÀ© 0~Z&0SS+R¹n^ËO¶nÉ¾­meëâ«Xõ9Xûò&ûu³3SjMç*¦,yµðÑÖ¾ÃâÙ%¼­§
mìõëû²HxÍÖ®Ë"&4î×»,^ÙÜ5÷¶ú+ÏÃa3æ´>¶Ú_ôxV§²ÎÍ/Êõ'xæ¥¼pZ¼ïû½kÜBZA´¤Ìo®`¿Ë(&^y÷ùeùO;ê§·M~wögx±[úÅ4;î¤/ßpÅ¦]¼¨øÌñàÊ%Rþø÷ì®x#Û¡Ô®úñHð²¯]uÒÕ×O°_êxÝ»ðk?'×~Y§£w/n9þH¿¿Á}¬ÌÇÆ¿¥NhûMI7¸gÌ´éÙÉÓYOB7®7lÿÿ]jiÝeÙs¶OuySU¸|·í÷PñÞZ=ïm3"ß/Ù}ûÚnQCaû+7ûÎçô;ÃÖeäárºzCÉ¡º½ïúÙÿw±]¶hQû¢UÉ¡¿%N­O»ñ7ÂâºÌlÕû¤îßy^°wO®½g¬¿ºú1®ÕÙ§µðjKo¸¹ÞûêÌ=Ëy®wHöIcq]};gò^5uiÂënÞ»ù£¿¥±¤ð+ÃwÉþ¾»?ÊYÄ>³2»ìÞÕ&tìß1V°|[RUåuqð¶7Ë#Ç­W#±¨jS`Ç¹ûE¯k¾K:¿{bí×g<æò«'vMy°y=Û¡åQÖ8Ù,Í&¸ooBùMsÞñ]?³Å®òµúÀÛkó¤\-U¼x3åaøÑ·2ª§ÌS¦<íMS{UàzvuÐ§ùý¬Vk|çÌÔ½S0YÉUÙü ÇëÊL¸7´\WPwïBsemÄÝWpû¹·ü|Aá-;ôÜTÖÏ~ì¥ø"Z1kÙµ§çæ®ÜøSrÂ[Ã÷uyvED_Ø^ é±Q
endstream
endobj
98 0 obj <<
/Type /FontDescriptor
/FontName /AITXFY+CMSY10
/Flags 4
/FontBBox [-29 -960 1116 775]
/Ascent 750
/CapHeight 683
/Descent -194
/ItalicAngle -14
/StemV 85
/XHeight 431
/CharSet (/section)
/FontFile 97 0 R
>> endobj
99 0 obj <<
/Length1 1126
/Length2 6108
/Length3 0
/Length 6807      
/Filter /FlateDecode
>>
stream
xÚ­eX]×°énPZ¤!éégféRé¥DAJ@.éVIy¹ïçyÞÛïyÿ~Çuý¸Îµ×Þë<Ö^'»¾¡À#(ê	LDAR %# $($¤HÂÉ©ä³GÃQHe{4L
 ¨ÂÜ~Ü¾Rb`) róõ;:¡ÜJ<%¹Â<à{$@Çís½=b ¢ pÚWð üµÃ` óyxÃ $  
 O`p$	ð/'¤
 þ¯0ÔËí?KÞ0Ï[) ÷ß<[I(
ð@a$@]Ôm5Ø­Ëÿ­ÿ>\ÕÐµwýëø¿;õÖí]áßg \Ý¼Ð0

ó@þwª)ì_r:0(ÜËõ¿W5Ðö8äÒDDÿ{ªÂ}`P}8âp°GxÂþÃÐÿ6¹íßß@%-m}S¾_íßúöp$ÚÈ×ú'ûoýÃ·Mòû ,n»ºM¼}þóeý_ÅTtöö¾$·CtKb  Â| 0[c  ¾Ý¸íL ÀåAò×½Þ^Ðþ¯Ð¿H |òIÿ% ýA  ì þÁ¿þÇª èø¿(* :ùº9ÁdÜÆþÜpëåòÞ!þÀ[3×ð¶·À?ºg ê¼uqû§öm®½9 ÿþý×Øþ³W ôøo%=ÿ@0 øgò­³×x+ùôÜöùo+úþÿwxQ>þ °@@XLè/0@,øÿdB¼<n}Ñÿ¡·3øvß-æLO  ÒáÎ©¥A*#eø<,éÅámuéÒ;Ò4cï`÷©#¨áåT)?´*P±EÆG_üSÔ_Èéxò3	÷ ;V68=¹Ý®ÙÏ6¦ÙVÝÞóíÍÜ?ùîÝ_©½/`üñ¯trâú(È%xpq4z-Ä:·Y;f²ù=¡ÿbWU~ÝCoqBû{±s~Ôe<]2&Ww<]öXÇÇaiéÂ6m#©~SU·AÉ.Øë=¡>¥K.^\ìÞEÅê<êO+Ï¾V"ÌÙ]ì-7ª{*hÝ{ûåXTWØ®É<A°»	²nËºîgÂÅÝü¶)ôpPê"tÌ¡d³Â:l\+|1&AÇå÷Ë+ô³Ù82òaîæMý:ß·Ü¿{R?@K¢EòÀ(YøÁ¸m«}:OU'ÍïÓ¨x'ÑE$)µ ñ¿8¦P«SPvÞxºò G,N©Ðïõ±¹G¬~?ñIcùúÙdêÄ¨6~¤ Ôÿ×<Þ.~AÞzl-ê@¯ÕrÕÐÙ]Úí6òcêÌ ûèN¨9Í§ubsaIR²*ð%N&ç0Ò£»ó÷¯#>Nº¿H+B×os5h®kd@Ûîef<7ÔÉcZÈ¯kU'x1Û·ºúÑ'gÓçÀd(ßäyÄ0	ÞNÜ|[ ¸øy/Ñ_s³ #üj&NÓãauN=
ÛXnFq§ö´«À7R£¥-û¿Hî§2ÇßYý(5FiNvdrbH~ÚLÔv"ð¸¹âjÉì¹åKµë-¼AO«õ¼ÉÛ.OòãÌZ¨Ë©Ð7.½®usÒ0j9ò!Ùâ×FÃxqî,¼ô9Û}þþ×JvBÀ,¶ÇâAðúâ×SaÊ¼ùéâªÃÛ»!y<XHÌ|#ú·±7­ípsoËÞ·9jOÑë?«¸jÈÉÅ¥[h ì`÷D#ÁWÖÙÙ\ËÔÏö3Eûe/ê"ßVsÍ×ëå0Ð=Àmøº|ûsX^0)ó¥¿×·Ñ´´¦xWMô/xð·Ã«Ðô¾aÏÇ4õè'úk	½æ¼ª"ËK» îð#v¨Nö6·W"oÑû¼ðrÑÐÉdh2÷¤éÐÚWè«|"þÓ$Êt¾ßYÍÙj¯XXùÊ5+3.¬àGæíß´«¿µkn§®«ù¯å*µË;I3¶yò¨j5G·ÁãÈrø:=ÁÐâ]oåOÉÎâ©6#ý-ÖLIíÕN%e¾ýt?>:%ìb{kÌ,ßoà2ø^¥<åIJûaÃ3]:u¯uÛZ
ÐdxÅñgÒÃ(§¹x¸[×V;%íµá®Õð	m]¬=¹)ÞÕHµÒÑ^ÌõæªâØ¡'Ù8_¤¶5§Í/CwÛûXKr\tºÏå1.wòÙ±(µM+>ÅãZ¼º@Èw+æÓ,ëÂúâ¾*è"@v%ëÂc	]â¬ÅìõZ¯Â_â2*{­¿Ëqñ¼iÑ¡½ôôÓôÜfMÍ.¶ rjp qÛÃèAr#+KS1w¬ÐûÂèZr«N§4õËãÎi5wiÍYþMP+ÐàØ´Û¾ÿYÒÄ~)At&¥o±{+v¼!»G}ãvÈººñúÅÉaTr"J¶¦Ê,¦lI%xéÍoGÂ"åKÅÑ)øÛµWW¸ûqÚáñóÁÔÁ­C&KÓcÛCáõÖz!þéºÏ}û²/«]Ç>Zà'\Ú×?ßñe½æ S/C¬Ö³;v:ù,F¥­|ÄC¹4Õ¼H-v	ENÜé¤ÆÔ½<¬ðÕýFSÖ¥þU{ìYÌgjO1òÃùz¾ìâ2.hþ÷KQ¾$~üÍ~±ìû1=Ic¬?ª"ð?¶©"®ú0XQT¯¬ô¢¿ ¯2q_è[^/ä=\)ÈFíÏ§usªÙ]5Ï@~ñoÛÚ)XÌ)>ì\ §"
êùh5ê¾/ _-=µCtî4©¿ë>Jí`QTÝÏü©óãt¼¯¢ôqË/ugF#Ç¢íÑ6·¤&¡íYìªBv*=µÈÃõÕW\æ?)®sæ.¢ZÎ.R¨>)éÙf[¨G0G¾c±N¶GürbfëXÃØAï÷¿Ð ZçY¸YgïÊ° ¡e
9_÷ÇRÖ«OÔpØzÓÕx<¯Í|ÓnC©ÓbaôT9¸?6¶õ ¹áöCä]{¦Úí±¯/ÝèÙ3<Ñ}s¿.+ùÃ±AÝTAá!­æ¹áæT}ø¤ÒJ:}Ù£átJ%Xg÷ù!mòdK¢S2#l¯ý¡}Rý÷y´
ÎSc	ªRê7P0Jtm+¦*S%7YC½;ä"5ÔÃTæpO"ÂÖ)ÀQms|;­WÒMÆ é¬MÞÅ2Ë8·¤2[.kæ<û§eÄ!×¼]a"oÂ{?.L_ÃîR"DGî¹_M¬­;`èÎtöð`ÊÈe²·L,%Æ»^ÇÙR¯ÎÎ?.
*ÜlÖn¸Ö5:ì+2ê¢:!l!G´uµÉzÖ_A9×ì<âf$"ÕæNy8m7':öÁ£BòÒ¿8­ÜÔÇ'Ï¿vÖêÍ| y*ÿü³¹Ö?GQSÌ_Â3)âÃÜ»éÞ¸ÖÕV¿þ`ø9í3X:[«¨ôÈû¼°ìÏÝ&=¾:Ïvá­0³Ëo<ÓÞRËuxÏÒ7¦ÝäC¬ç^ª6@Zc*ULÊñK«¬	_WÍ¨9dçGl¹\ò9³½7°3¡-*h«ÿRGKi8êx4ÿtà|/½¬Çszn¥½Ö#QcdX;%ùÍhõL°v¼æ¨nAîáÉ&Þ~)BYpiÓ«	Oãáí	å­Ò:g6yÿb|àBðÆiÁQã¨ëZzßN¶yøñÇ¯Ì\îtcê)êýèåòNÈßl[ãd±¶)~n/ãâ'vhyóöîzDò7ÜÎ¬ó&Èþ.þU]èÎÍ±Fx¾ü [ÆVMÎåk_ý²¸~c×ËÁê]¤jð¥Ò¨<âLN¯×-ïI·_ÓÅþª©qdqà:¿¹Á×|ÎR"fcxÄï3LX0Üó;²}ÑÔÇ]PQf®Tw¯ÕÌZW¹ PNcCîP¡£ÔÈÈ«ñ8ÚTû.ÈgÐ¸<ùà0ôë¦eå±õ\®aû:¦´EbÚ©þýríº¢«S`_AÎ@	:VPJh2áE ¦cîåg<gôMmÇ^åc©2*CúÃPööZ:	7¾YIÿâz/kWÓÃææç#ö;ièµLWxU'm|»¥l{í= Ç#
A:çòJµ	>Èpà}!^2&­KÂÑ~Þ¹¼ónf¸'Uü·f÷ë.dØ«ôzàôÉïÜcF§/u¼÷è2Ed~Þ<nvJóµDäMÐæ:~¾_]Çuë.ôsj G¥xk{À.ñéÙÅ¡åGX$Ï¶Æ¼JF~0 ¶/HÁFæ³#~]EÅùßfbÌGGä½r¼ÒáN+oó.Ù}ÙÖÕ:5¯Ë	@%VçéøéÝËïr§ m«Ùm^
?®&<XrdÚÄãT3,gFÛ§«¦ùçÞFY.ÖM0{:÷C~-îXËr{Îk_½ç$ÐÞR50lg}ÌÍì.xà=yÀEh.ãNí·ú9_@*HnÞúnóòÕôÏSÆêÛàÎ La#4p(utÓÏuÑíl&lÿa²ýú¨GuR¬5ÍJm	ÆL9¦ñ#Ãxç Z#ps:v÷
8£·*/Í·ÜØµiâ YÝÒ¬J6N¨_cúgÿuÝ·Ï	,^[;*òõ¤ÀÆÁjÎ_FZÑÆ½)2hñ62øW¡áÏEÝ»¾±ÒøGnEUÛ^¥ Ó8Ú2=¦ãÜ#ë\ÕÄ¡lúAE°ËÐ4Ü}
ðe}xxêØ*ZNýàlyEËþá=B'!×"»cA7g»û©Ô¹Äë¿
ÚBUøÎMj«Ñ¬Æs5[Ì$Dé26­8cT0uÛR|"ÓÙgv! Òê±æ Fqk@0üa¼å1ßxHüKæì¿eÙì¦Ð¬ä)ýÍDz7ÃªVt@sí'
f	µA´Ê,-ãVkElr³îËî©KáÙ¡ºÓD`;R âUHróñ{GßÍMduy ¡§ãXFSÁ0º_üñBû§uX®®Ë²Ë^°óÚ¹s_³gh¶­	º£0XU>eÒùGñAÔÌ )[+ðgÌßÈ;WFqNÄå*4'nKæíÉJ§l >¶$>ïóvªËTè}+L7XHã*3uázóiöWÁ)?qu9>á¬BZ×sJ©
è`õÅRV)Ùë¸··FÄ)ÉioPüQâØ3ßy,"<ZØ©Ë7ÂùYätñ¥©TnÄûåÊ`ºµgï.ÃÓQ4²/©)Jæ´ß6«Ù°p¨ÜKÛÚaãÕuXÏ';"I"]£lûç~Ðbã±,4J]SÄ+Ô%öÈwó×,>N n4,t®¤Ôd¨ñÑe²H{Éññl_¼j"o
_h[mXr&IªütmNÿñi'ùÎ½h5y£~kKÒ#9Æ£×rcãñ?Ü=-Jjg.®ÆûY|¥-ôô
"ý5î=æèñùãDÓÆlÛ¾Ú·ÝþÇ/Fë=úÚ1Ó¯¾êóñg 7ø#]{,\R×õÊbNºÞÍÞ¾Un/FKêzeòêH¬¹õèå?àEÓ¸6Ylh4c)ç>ºùîKópâ}¨×0Ñ|óÆë'E§ÃÐÛÍ5nn8×î|©Ý4Õ°ãËë}¡("ØÃ~à$fþdîBqî£\2ØÂn!Ýêó}¢a.a¹$i k?»ÝØíÄØD½,×LÏÔ:bmâ½³jkÐM¤öttãKX¼uþ¥ïzÂQv¨õ¾tÆ3QkQ É¢®s/ªÆ|É\§ÞÝLÎváVhûC÷,>°KÎØ!°¯#A\<ïºÈ¼Ð>?¸1é´ùZ§ÍIµýû	ù+#þ"Gò'/yT Ábbè=bN¶;cU7î«s¿sPö§ëíÚ
>3 êÙU?iù=³é]^{_£õùügK%K)JýkÐ¢Ý¼ÃÝðÀP¢@ØIèeð¢w.R¨à¼û|Zð	4ÍÔÌéÞÁmð×2£,¬°é~©ðåJùØÅùpV7Dtþ«!ÖNúèPnEMF;4Ê©r Ý%Oß/ÙøÔÿÈ£hLVºÅÒ¶woH2C, `Y%T§4 k¥	ºúP9?îó6xGÕÕ§?Òhø!$ÎÁíFç»Çüú6TÅVI3Kóú¢¨Y+e¬÷ÇÀ=ðtuç$Ö#lGû½üÁ¥ø}¸¡²tVáÕq/@]ÕþÕ7xå%eÇ/SÀÝêy-íOÍ§lea×Þ<¥þÎ58:Ãæ×eKp|`Öl®í°zwlÏrJAUK§Él[*ÑõÐµnd¶k<È/Sob%B­xÝè#à¦ÔÚZSìÄüÀÒêö¯øò8@zÐ`°öm{ÚÇ.u»)ìo9ÎÊÇë#^£÷rXÃtäy/jS\§»EöÛ¥¦»%g#hìGàâÏ´Åüdåôñî¨Ú]ë4æ¿ù4·÷d¿e`KAåURþ'$Æ¿§Òl@Gî¯@Bé#-!<Ô7\üÁ
ËÂ­;ó;U)=Ü¶:ºÎBKúûÚï|ßña´&®Ê°±$^WwÙDs¸Gã	må7}S¾6çÖX7ÜÀçMO>$ÕÚ1m°5Æ´PU?ª4gØFS>ý©yDòÍèñe­å;òÞá¦¾ËçÌªú9Ñ"ÌÚuÿæÇÙD²wø7Le3òY.löÕtz4ÙÄ;&?ÙbÛð¦"pºÞÝCDÊÓÏ«ÐV6úÕ&|öøar©bÃ±°ô^À%Ï£nÏ5ã:ûµÉEÚZ21ïj+köuî[¸Xv8Fª¼nºÒÐ"ðVêð.õÐÑ¾\éà ëÕÄil×aGuÙ¶K¼þçË@v^<*ìüjIuÐOÒòkçÊûx©×NÏú«¸3½¦&wc´ê|9£$¤$ÅK#¤æª®¾fjmÙ%U	½ñ½X ¹K
ËL^m5­»:æS-þÂ÷W»ñ5}EzN)ýB·ÚSVZñ»øÑ#ö«[.»Ï>s@F÷øÂîá¼~?@Þ	k¦³aJ¿Z&Ê]téaC¾Tb9^úÖÈßgÏ ùF6lî¯ÞâÈ¼¤PÛúÑ[ÈV*ÝV[²»»øÆ5!ôåÔoS}!U­ÅNÚá­¥° ">/­¹rj°ËZ`öÓ.ÛÁÒ AÅ%H¼­e³)Dg¯s|pQ^K:
~DË7·o¶ªôc{ª$æõZ@¬oÈÔ<%Çú,_³XÖßþ»¢ö^Å°ÍkÒÝcÛPÃ$ØÀp1=C\§J¿cÆ@Áùúø¾çé·áBølþóÕY»}à³ýFâçÖ\C®¦lyO¿Nm.§ùTcà¨Òüp¾é±§Ü§?c½×LX9¶¸i»Çùg°5³Ïp½"¹Ä_gec÷Ø¢É;	à	,J¤B³
ïTKiÔ£Ë½îlÉ2ª«H9YA_»4pQvÉaÎrQL½é Ú?ÔÒSmºZªn¼ëÒf¬tãÆAÎ#g·pmPýÜØ"Â¡Fìnc´ç4.«í»sÀW¨¶ôXé©§5ÃB9+P%ºWv,|ìzW4ñùÊ¶à0/Ì2&­ïU'×¥_Ö_IóR»nwUÞl3ÆÉ,ml(/çÄr[RjV¶ÈùsÑ«£Â¼æw}Q²æËã?R7ów>0ê}+ÒA*]È?o¨¨XXÚN»ÂÊNêÇ4HIGCY×fm7¾y¤#³ÞFàpìË©þbOÆ_Ð\jEÙ_¤]l}$Ø	+Êïl1±nX±úÐ}Ì=áBíÝAãµ*Ç#:¨ãèr§,:gÏhÆJ»ãVb£µ®ÒLt3­m*+)¥rïòiGI¬}~âòÇ`¿aÿ5;\Ny|9Vø¶×kCx¨õ"½å»=Úe¸ãÓS¢5qmºÿ%ÍKª
endstream
endobj
100 0 obj <<
/Type /FontDescriptor
/FontName /CKLPEW+CMTI10
/Flags 4
/FontBBox [-163 -250 1146 969]
/Ascent 694
/CapHeight 683
/Descent -194
/ItalicAngle -14
/StemV 68
/XHeight 431
/CharSet (/a/b/c/d/e/f/fi/g/hyphen/i/k/l/m/n/o/p/parenleft/parenright/r/s/t/u/w/x/y)
/FontFile 99 0 R
>> endobj
101 0 obj <<
/Length1 1924
/Length2 11395
/Length3 0
/Length 12482     
/Filter /FlateDecode
>>
stream
xÚ­veXJÒ5<x°`KpwwwwÜÝ5¸»»ÜÝwà.A¾¹{wo²ûþýáÇêêÓ§NU7CF¤ L+hbg³³u¦e¤cäËª¨02 éàÉÈÎv¶"Î@. #''@ÐÞÀÄ`dàbaýÁíì=-ÌÌÂT%±mÆ¶ YCgs ÃØÐ lgltö Z[þÚáP:]&tð cgÐÌÂþ/M¶¦v ö¿Ã&.öÿYr::D(ÿ%
 ibgkí0ÂÓËÙN´üÿõ¿äb.ÖÖr6ÑÿË©ÿ³nhcaíñï;{g #@ÖÎèhû¿©êÀ¿ÅÉM,\lþwUÒÙÐÚÂXÐÖÌ`ø;dá$fá4Q°p668;º ÿÚü¯sÿR@¯&)¯*$úéßMý×¢¡­³ý?¬eÿ3þÆ {-ÜÚ A Ï¾éþÏa¢¶Æv&¶f &V6¡££¡<h|@àÅ°°5ºî Áôt¶vÎ - '> S;Gø¿:ÊÆ
 ü+ô7bÐýFì záß@/úbgÐÿFL zß@/ù8e~# ½ÜoâÿqX~#òoÄ Wù@jÿ Ð`ÑþF LC'ccGcâ Kó÷³µ	ð8Ó_aÐX8Yý&É4ú@)FÆVNÖNæ²üvü# lähh´:ÿfýwøïÛð+ãßa+ óås2ÿÿ ·ÿA¬ ÆvÖ køO%,Ell~{ÁÈÀ  7ù20±³¶þS3hªèÁörp]ÊöÔæÇÚð'@~þò²sù´Çì7'hÝì¯wøg
Hëo+Y@{ØmÿÈ Å,þ &[ýAÕÿÉ*ÓèäôÇ:È«?nýonV­íï²AgÙºØýõ®ý¡ô$ÒÛýV	â´ûc##¨2ûßË 3ì¶ÿÕMÆGÿ», VØÂîwwX@®Ù[»ü.ä3ÐÄÈúCAÑ?dIÿ½$Ñ	hcñßÁúWÐõwYA$N æ³AüÏt3þÖË
*ÃÙÜø»zVP¹Învl q¸üVÐ. ×ÇÑÉØÎñOÏ@sý»ýqU@¤¨åzÿ>ãÿ¾±BBvî^´, Z&PÿØ>ÿfìârÞù_ÿ¿@ïô°©èQÝÆð+vÆÜ-SCÊ}E§+ ¨ÁÌZâäzçºãÁ­KF¥¨7ë5¿d #@º=ã:Etz+N]8Ä¥-¼¸dx¶áj\gÈzìÛß"w4Ïß±ËÏn'ifÿ:ÍW Q9Y'ëÓvmìËüÌÆ®!a­\OÎL¤æPÆºáðnc*È×2¶õÓÚ]§Úc!l^â«>Ø1td PÎrË%oh-ÇÙÃFîG XCI=Qfu_zuä|»íJÇÝjÏô¶r{]ØüóõÎá°%Ì4§ú9Ì1D¥w§\¢-²(VNUAÁL¥¢·XIüòçÀOAZE©e¨oøÒAM(ÍÁX)ÓÝ-¦1­~ÊÑÄk>¹3$-o©{<ðN!õW´æÛxØ7Ô©Ô²gö}{7ù§d{¬dO½¾ã¬Ù¿¬|O,1cYÂÙ¿v	Óc1ÔAÆnU¾z=µUqgWÈº¸¦UÀLñý.ßåúå=m[*Úöl¸bµá ØûV¬V´Å"ÔÍ*µ`E©¡5S·c®½sÌ×Ã}´	~`ì½Ã1B`×\w=æY¨JÛ	Ê"ªÐkÒä4^ÑB,-ÑBiÂè'Pðòi«:{õ¬/½Æ%Ñô×AÜè0C«g³½ìbt¨@qüöwôKíº·m§ñz½ÄL>¬X`:E¦Gn¿Ý»PoYÔc«¡ùyÒ÷dfÇsk(Åú-^QúaºnD4üj½*©yõ¿V_Ò&2DZÛX#ý±r¹¤é~èg5	Y¹¼Ö_ÉÏ¸%àí@¿êï³h:Vv?hKqÀÓÈ¤ÿÖ~ScÅWÂ&Ñ0F#.zw¨'7£_/eK&PòæÝ'I_±J'Ù?Þ§6Ýd?÷64l°¶ôùt~p4F¼ßië¹Ø¼¯qu<¸.V«ðÜJTÑ?0;ÔÉÖJ8pM¾!Tªî xzB­ëkÒ£Ï(­Ò<1[e/¿wÓ8W¯á0µT±!ñ)zäøÕ8`¥iI¡SíÐ|24£Â)ÚU*f÷Ë´Î}ß¤h19ý±ñ5Ö¢Ã. ýv¥÷;ìÞ¦ËfÎ¨ÊC^¹Ó,íÓùFY÷$R,®¸ATÂ±þ}^þ÷Ê3tþ-NÕÎ®éb)ËÔï­B4¹ÚÍCªIrñU]oªú7o/
0Á9vÏÕÉ¹¥Ã9}DÀtz®|)[­$[ù8îÅqýJ¶4ü-bQã8IÏPkfx&|"PãDà}öÌ¯FÄÏ®K¦_ØÞ?È;Ä¡ÌcÙYE*ÙÍ;ãuêö[VÐo´6à4eøs*Ë¡_W£Á¯âCóQ`«P_6ó¼éey#*ÀæÆN)oí}Õ3bxmÓ%D7°¼ÄÖ{^Ê(5idõÆX´¢Ã¾2úîä~cW1>u7jØH·3JÅ§§ï6ÈVS5õ¯^`¿áW?MPÂa.ån]ñ|z&®.Þ¸gæGRDæÆ,6*±ÝnýüÓ«Ë6fÛ¿jìúDóß¾·eíô/$½
ûCYS¶ùÑr¼¡K
k
ß`5Ügi5%õ	öv¤c	N\¿0,3@@81Æ9òj[o»Ð¨;\ÌöÍ¥ðì|M¿Çãþ6¤cÓRò¢¶8z?þÀês]9µ$sBÇ/ì®WKv<ý¾(òt¾Á7¿~ézâe-ÍÎmßJÍïüxR?W^×7í§f¶û¤l?Õ0ÜÙ(NéO3UoU7a`ÀÔôÇ³°roSÓz?Ã4{K>µø:º MÖ£f;8-ùà»ðöÃ´=[âg_Õ¥%z vP	ZwWÒ´Êí¤?Ï³¨ç®A?CìpSïÖzáËD¾#>$ÝR¾¾{¸5¢ä$u:ä&ºäØN?@åÝÑ@öaÈ7|é®³×»ÜLÓå¾²§x9yqöy¯×ÿ­©Çí/w3)¢g27èHûHëâê¢ÀáÕ±ÁuÞ|ÅFEPBJ3Y^#ùÓ%q×,ëF<4á÷ýøè©ÛNò#jXc=jäSØ2øC«B\g¶±Xðª#É7oªÉeå6¨¥»6ÊöôtxþNíRÁ2N-4ÒB3LñIÑM.ÔP´Ñ4µyÍ5dñÁJI§xª¸Ö:ò=©ê¾V^çäßé¯ªÜÆOçeê¶BG?[A34K
 ÈÞwÉÚó$^ëc¡åº6îD&AË5:ÂHcû;%leñ«Éî÷¹,ü:r*Ù¤ºM­àN)-6®P¸¥ßNÜÜzJÇ!-2EÂªapïa±Ê³zÆA¾¹õS¸½ºOÊ,$x¿KÍ¬õ1qÙòmùL{¢îY K÷ö!Ï	!bó>üésèø"½©Gû=BlÑ%Suà×è°RÕàÂÒM65.üÑ&4'Ä«#±}§Hs VüJ;@ýæÝ)¿u7mË±¹Ý¹úf*·ºµ1:b.:.ê!'WDõvv÷æå@x]hðj¢V¢ÖìÜÉùÌÀs­^icÂLHvÅ¹ïàt±SÍ.½vÁ>cU­â¶ÿ@gÄ 0ÇÄ8±ßáY»Ï7E×}<xÂI/
´wLÆX¤âãÍõkÅõä60$· ½µùãÇ@ÝÊðÆ¨o]¡µfbò²û|²à;ê ýB=ûIeßãÊ}.kÉjksdÕóÁÞj(¢k0û^å]½6 !´´d/E¿Mvp§xd\S'Ç-=CZnÙØÌ«âå^ ZÈQºW²+Ý¯ÑÄO	#ñ¤ýd²ÒcKàWÌ¯ßolõÅRb)J³!Mø¡VôtÉèÐz±8GÁ¤vÁSú\ßÖØf¯[¢öÇöïë3ôÛ=}ûÞæÚFêÊE0*Ê.)Ä:È tä:¼t²1ÍÐëdx)+¡PRZ"Ý%!ûè}éÝD?ÚzÆÇ6=Ózß±PN¨`§øi[w*$wôõUÊC£"½-é]òØ|K$Oôª3_Xªö}Z§1A©{LbmW	ã?!çv´HüÁ­¿U¾¯F8Öêñ¦ßx)vlLÔ`!ê[o¬õùbõûZª§hÚ@$wªÞ)ÉéKD½ÐW(Vº6V×%v¨èúdÑITO~Ø¨4Q`tÒ\à¼W5¶ÚÏï"pÉb°LÆPðÙ<6\º ,$\U¢qâN­wä"¬§!{°²<£*ËÌg»<ªRþ½ÈªNÙQÖÍ:P-¨ë©|³%ÜÉßhL¥{ÀSJBÃuÞN²ê}K_alkå­ÛZ¶è®éÒçPN"1õ{sªxi¾ªiF1~^»*&CBÇnÕ!âôo>Ê7¬yóRJÛh¥`ëÁÃl²H&P$³P5s/Ê*ø8Êr·ìCùXßzGÑ©»?ü?O+ÞFºT¹ýh"þØteÀS1d*ÇT#¯Â¶ËH¸
7d úC&ðºá´À¡K80.P,0¡þ$¤NÄ^c}óò0VEÖNVaçtµàËuå´áxjí$2D(ä[ù:9Åw[Þ3ÂÞÍwåüéûGwÅçÌ±Û<,¯aOI1áÁã1dÊj_Ý%¢keÚàbÚ{Ùº»ÔÔÙüñê.÷ÎcEØ£f7Íå.#¾ÈÁ!Æ Ãgi.ÆÞ ºê°Ç/LäÀ1'l&(È«3ß©á¸àFgK}4×¹$)û¨°I ÷Æ¬èÇçErRÎqöQ	ªVèSøf¢ìÜÉùå·9ç9×ÛOÊIêIQl><,Q5wÇîè«H£]«2³?L¼yú6ýÆ¸ÊÐ.¿?`¬¦Ú5ÔÕÈ¢Í«(¥-äþ
èôkÔÍÔ¥ªç^µ]Þv_É§~úVJ t¸ÁñH9ø±µN":\e]%w±ø1}:§E*;»beE÷ç§Ñ¹Ú·HÑî£b¾heÂÁFÜêgÈwñ?¿Ç ¦=Ób!ABCÁ,|3Ã¸º'_¸¸5Ý¹`SsÆ33ôg°g~lÅ©_Åz²´ÍËâ»ë{$OJh<¬*rZ[&m¿ùB9
{é g½®×mðUÊ êÇù-&eÅIoZßØOîd6ÑAOícØ½vÕ#ÏÒ8,}¢^VéÕßéö>äûbWÈÒ]°l7ñÝ0 N×ÃQ¾ÿ¸:1*Úþ#' a@^PYfó¿.ç.õÐ3á-úU{+7oÊ)í´[aF{x¡v*Ti°¼
6?¾¬^)OéQ%º¤×ÖB`e7;p¼û±xNÚM>](ÛlUÀY·×nSæ³3KÊ7µõe2ßl¼ûx=~nÈU¦Ë®kª½ToGeÈí|	ei:ö{ØÂµ)ûµ±÷+'Õçe	úêÊà5rWB"KþêÄB^åfê0;D·2Ìî+Óe¶S*MïìHvP¹$²$Ä ¼UT¿~î¦J½ËG¬$4±o ÙÀiÿÎâGª¶"«T(d&?!áäÎ
ÅÄ2l½¦¸ß
Ó¦WÁR±ó¨íÖÅg¢VÁ¼Ò3´ñDãC'2À@iî	Ïíc¿*jJS«î<>±U×´
%/Ô9ìWÈ[T÷k§Ã¹RP$íãëÂ@zgRñ	æòµm&¹6K]RN¬*y¾ä§í^hüåwMiz£Ô^Ó§é*)ÕÑÈ;BD¨+.übZJ3¸Ò:1¨Ãç"'Ýµ:zs[®ß¹ø;j
862*¯ËÍ¾­»f¦oñ ÇóëeëÍEØïËÙÇA,À©xn´PbË$xNÇö)ÈT+O½BóQy.;Ôlâuóã(xxT",>jâ~Êº\(Ì2ê(nÓ(%>ògBÖÏ¸&®q(äbz/û¡®^$7®T­éËCeü;¢³RÂlas®ùé@K/:FZÈÜ!4N©¤àps¡_Dp2FtÞ{PÆÜÆHm#á¯-OÉz¦¨ÌØë7°bè5ïHãpßÏÃ;ex8S©CfÆtÄèÅO¥-SCU2\½'E3#µOCòèöÁ&^FåéR?qÓBtKNÓ\³	pWµ|f¶Ö°	øÚÐãýyóï³>üË:2f	/uuþ*ÕLïhÌÀ1¡X©g$àN>¬áÌ^­óm}ö	«ÍCLÖ¶ð6å²[îßöZYÝ7µà´òñµaeH9Tu®Sõ«­¬ßÙÆP<V?ØÖ>Û(¨´,h:^|áQcMNæ.úÙÕ7Þ%pdÕCB[Î~§Í¤q¡`Ïþ'ï¹Ì²ýaç·]o^qn¾£é!k}ªZR¶q´wGjÕz¾³Ø8èZeÇ/^&£æò°¦¯á §¾Ù]é)N=Zy¤ßk0Iß2~¡¸|Þ Y~ÈCPtÝÜ0Óe@Ukº}-ùhØwØ,$ZûUï¸úmV»Ì?ÿ\ÕèÝJâMUå0ÑÊ½Yÿ#Ò>PHÏãÔ£ñÉÖTÒBÙ3kf¼öÔô1©úbç¬±Üo?p$Ça¸w³%ÈÙ>ÖÓµïfÊÙ%-@{ÁëIçÄ¿J<GhßÓ¯Ë¢9oa ®%Ê-«q^gýË³Iä©:ïûwC=¯r
[1·46ôGj÷ûwHÞ° &?ï§ÙÁÒåaR¾ãé®,ÄlÏØ¥Ï£¨æöÃÍõbÄVh½C7´f1¨ÁR~kN=µO|ì  ?.¤Å`ÞÉÂ¬Agïã'#Õ´{ÛÝ&ØãóãÖ]Bt­Ñ«ÈVúòýÅwoÎ`Ä¿ewþòÃËe+Ý)ÞAS:Ôw×q×Y¨Êf&ðÉüT´GÍ6ðÓo,GHf<B¡dÔqÚÜÒ ?fþçè{ù5Gv:í,#Çø´h ½ºûQ¾ÜÇ
îÄAÂe}>Æû¨äË"Æï)ßÐyõ2´wïó:ÁZZIÆJ~`ñeû¡	|±\»y¹4"YSê]>f8+½¤<ük/ÔF(kÂOÚ]Ã[ÖiÉ=öñYËxxTûHÁ¤ë£S¿8x'(Õ"	û9\ï}#Ígz"Q7Fhqî»B<E}¢	cFõÈÔ¿Úk²·ÚwæR¬^iÝ:ëh¯ ÷uÕÎÌ<ÎbS²§GÈü<\é¿åÛdÎ´äAM:ÒÖµO±÷ïy°ôØI£Åwú,¢ÏöÙâ©vm/;ª-IÓOëÈ8é6ÉÛ `d¥7lÑ!öÂà	À61*=4«1Ó2Ó½ÈÝôÎ·9CÖ(.EÜ+xQ©Ò>Ý±bP07w¬Ì§yé?<ÂÏ(æÓ}½w¯SÄúa§ÈÔ=+IëY¦U'ÿXWXlÖA8ÝF[)Gô>0ªKéÊ&Kö4I¾1s#DÄf½²Ï® èùÿÃeøIR·X0­ºg§¢£Ü)Z¸§hÏòGZ~³*ü·¶·jðé;Ë|$ÜYâxë`NêùSq1fýøHjÝoVþ
jÏß|&ôÞª>WÇüòÃ%Ìõc7øíçß$D4hñ£oEW¼1éîª¹uW²®¹®µxÊ¨×QË1ª_QÙZ+lþ
uÅÅbia$W;?¬ë¼`Ë`îéý<N#ÔFFê£.Óà)«±Öæ?·Æ!©Ó,ÓáO°¸Âa)¤>Kí
ql¾Å£cí(	¥­ÛOÕIõT²¢)öf@±Ó¥EÐnÇ×DH¾ZoÉìËU
zÏ²û)(Uã3b¨úÓê¢µ=î%ï¯«)|½UÊ§Ò8Ðº;ãõ¿õ¾C±/«ö÷OKàÔ«=ãnU¾uÀVê¶¸òÌ¶±éÒÏÄúÕoà¬y÷ ÌÏê´Íöó~¬ÒçYÂ¢mÈ.ÉAHj~=+£6ß¢zª1wËpA_Þ#ÐQ¬ÔÖÀ\Dë·ÃdNBµ¶îåßxÓoTÅboà4Y^8O»G©~¡Å±wu5e­t0ÆnÃîW¿Ç}v-Û}ò8vÍùZÒË-¦|Ìóõ`ÓÎÒË®ÙSD¾£*Iy]g/Úáîé3$Õù´÷ò§@N­äþk"ÅC­]fð]¡®yAu?Ï¥Ôù ±Ç³ö´æyßcÝÀnÏ×SÌr:"æ	IGFÖ{üeÎ/w-qWJ>Ü|0ÁºTqéB5*é >Øc TlH< ±/¤RJ
</$§ÚtU×»Óa6N/Óæ=æß|*w*;ïc5ÃÍJZ¹Ëü-å2RÖÞÈvÞFÑ.Ý'T7¦OÝ¥q!áûñ»VN¼{?¡UÊÌßÍ«	¼t§:xXkxW½GßS1Ê7£Ia]S`È¼»eÿpbô¨OW=w].«^@Txy"8ù8cÄ'm<<*&$»RÊÓ7©y_à§k\»2Æ$üeAäÇ:r±óspo}´jÔòeüì0Î¤ÝÒw¥äÜ-Án'-N~ÿö²l7F?Õ÷µÔü(ºjÃ¥G
Ô?cÊÀi"°eBóÖR@¿~Ûvµ§yµâîvÇ&\­GÚéú4­d~ÁU?íË¡Ã,lG^ÖÅ
-hh ÷ÇvyÍ³ªJ©ûuyÐÛnN·±h¨Ée4nUÙÄºeù¨¦"Ï)ºÁ(¬×l\2Ë=ä¤üX¨ÌÔ¾J¾k±aòeÞ·*/ÞiÆÙ}!ÀÌ%ü¹iáÍî²ßòÃXÌ\s(Ý:ù½¥·ÞÝgM.ìûÒÂ'0eezû¬Öë(÷©;Ê¸¶¼	WsáX¼¯2èâøùÛ¤NõPkA?TÐlä=)f¾¤à<!7cÃúª"\Í.Ê ¶ÏWrpU¯Ö§}êÉßOuþyÛóM`TXR¢óêõ)É6YºêC.=x½ß¦É©ït|X©ó`àÓ®\ì½AødºpÁ|xvMÐ¬ªi?QæÂ"÷-qMJàl$Äà¿¢`!¸ÀM:w<m!yxJiå«ð%Ï¢Âì.ULw$ªÛOÿ0
åk
å3ïëmóâØË Ä×rÉÓûrâÛÇ*¾g×¯ì©Ä/ª3è7ÕÆ+¨!èÌFIÛ~p×ÍÌÛ¡az§kÔÕv§sUg)4³:&Æ3Iì¿!ãÙÚZÓ5ß½Þ¸ÝtsÙè
ªdT
ò,Ë!=È»kù.RLGª8s¨{á5Û·äÜ$ñÌ{ßòÅ "søê«üp2K¦òï5¼­$y9TnÏeJÌûÝ?üjYLBû¦÷®´0ª,oéÛÎÀåÿ¶tý+D.^WIC¹ÕÀ-É?6ZZîb«+Ý2Ô+ÃzËÿ³ÅºY½®IuH¾tòöK½Bðñ¹ëQ:øñ;¾.¬	Aë¨$¢K»¨iï<5þáåówIæ/º9géG¤ÞiðÐ¶"¹XpÛ§}.£'C-3N9ï:¥à#ôR#;2Ü	x#îýð@?¥=8¶"%®b4Úî¿#,ÝíàÌÏ£m:Í¢ØÒZÏæ¾ÅÆ X¾¶Õ¤ÎaåErLüâ8fàüD8æÀ×ÝT\¶±nÙ¡jhð|ÕlDøUc²¥éâÀä®°Ï/ âÇW4ÛOÉÂk­,ªä!b¢{D~W_Ûm{&¸ñ°Þ[ÔqªþAê¢7%ð4s¿T=°-Ï±I¿àÇÝëAãmêðÄ(Ä`]2Ø¡^#±{óS¼N:LØÕø!ìÊX'°±}áö3°#q§§
²³í©Êî-¤Îk:êU¾7ãr¤×ÈO?lE~Ô°0Z@ãn6Mîß4|TU=J(°teÇNò>Ä@.ÚÕþÂj" jOzYÂu-YdúíØVÉú= ñ|A¹Úôé!n'a°¯ÞÓu§æH¸=NuËu\²ñòwJõÄ¢ê|OÿfVâ2%¢M´xÔ&vÎ÷SÞÐp³³rænÆÍÎuÒBÐ§¾b»®¹yÑ¹ÏæÆIêº>Ïg<bu4¶¡Tël¬ "«Ô½Q q÷w½ðEä@°ÂZ89º0ù!¿TË·¼ò×MëíTþÙ#^®[÷pK»uÜÄ6'güIÜ(Ò·Ñ5/ùÓ ßÐs0-uÄ0½×PªHÈþÊU÷@ÑÆªÃ(ðØ¿^"ÚÔÐ§ßËÌFX#îøÃ1LBÃ¶R{ø®Á¿a@Pºº´æ0ÊM4(a¤Eh¹&ÉßIðÏõú2© 3¨_Ür»÷éXZ*B#[¹^³´ºW_ü	x
Ð¨ Uuõ(sx¨$6y¹ÚY6s²iõç?Ls÷=½·Zç¾ëo
w:q¾5Â-IýF±µvÒË»Ü¶HNø£t7P(Æ2oÜáÚBïÎ¿tZóô¦~l"pë¡·6­TN/ãp5ÃBÊÒÞ5{(tGÔg|ª¨bç»Á=nó`¾~$Ãgr°7-pe³ò ´ówå¿ËÖ>ÃOÖÌ¦dbÒw,3»MKä'§RSzg«pë¥¤¾×^3É¦B6@5r ©(%q^Ü1ßê¿CÛê£5¬R%(ÄËjqJðJ¾nvYOO
f´¤I¶õ«ª"8+ÚRÜ¦ÎFKâ>R3uÅ)ÂíB¼_c© óð¾¸í´Vì|EÕ°éùÞÈfH ß&E	Æk6Kñó>XÓ³OÝ§MZ1ùáfGÃûIöàÍ¹0Öí\ã3Oú8F½¾xVy¿Zý¸äÿ´OqA,ðû®ìÝ/Ibæ­aË¥yr:¹/×ê"}0<h/wÒù±ÀÆk¶ëÈòÊ¦Ëò«BÓF¦Àeb=â©Ûìd9Ñéûê­^ª%¾Cq9L7tÙ®lêÈ<²ØA:ÊnM¾¯ôF;ÁïµÓO¢OZÅ/LÛ3M5t½î«íéËvpg¹ìbðÎIñÅDiW[Ë!Vy×+¬âIzªM«æüSë[2ëkunLPkkP¿Ï²CÌòáò&aÑ©.BÝb¿¿eßJLºE[Ý«dñÖR¸mªÚFwØtc¥W$ç	lE}kcXÐ"
'üøª7âß¸¨µüR­~Ê¶¡9#ÅwmÎ¶Wº~ùÁ0x°>Öÿ|3ûgÒ¤Mux©>ú|*oòÖò"£LMQ¯YhÄ°v$ØXªÃÃÛnÇÀªj,êÁÏ¸i7(BD¿\Ñ.Ðmâ°u*1ªï¶m*.Ã^,2e ÕÖ©}²¡Ü­*'9CG¶a(m{¤ÈôtÁë
Î/ÍUêñlæÕ¨YlÍùxúÛî«¼õûÉ+¶Iqìé×­Ø5oÄàZ l=?KT2ô905Ñ#LtÔïÔ>£§Øw¯iuDºÍyf¥ü:0ð#TÚ»ÁiÓ¼,êoW>Ûx88«®IjPÇ-S
Å«ü _Ï,ÃÍ¸´bÚ¢ÿDÏMÀ]¤{"¦R£¹Ü°¯ÿÖÚMCºpaäà­ãçxâ°TÍ9^°biX¦ðÝ,°wW_ðd9iÌ¬RêCÂKþr¯zl;H.M²!ÅbÑºQ6#¸`ô¨L#4÷td¨ñúUeúC6¥¢qhx¼íõ¦õ3íê§QVL#)açSw«¸'n4Àbôu.ùuA«_·&þ»núÑaYWJi}`fz;XØ÷'Î\ö@Ý¤ÞuhéË;#p½ÅS
ÑÕ¯âÅí1g!¢P>ÑÌL}S]´çª$»üåb÷PI<qWaßüÖ¢¶¡À»,ÄîYÛiÄWOù¬øén Ù°ôDW>åYE cHÏÛ¸÷Rô×qB>¶JÉl2®¸àÅwC¯°ÞN´è{ÚM2ÒuïßÙÛé¿-}kÏbòÙ5¡ý0gáT¦3ÁRó1äÎÛ±e3îzìÌX(ì«9Lgê¯N%Y9õëÀ½O¨qCaú"¹uc­lÎ7$ËÂkKòïEho¨Ý4ï½±f ´îV¥±sL9Ý%öÒâuï[ iMÛª®1j§ÚÔj7ûñï.WÝBÑ`²³O4£`$ö[QC%`,!9ÒD;ð's¡û2kÈÑïßÕÒ¾â=«®Þ ¶ÛvÐwßî¯õF3-©oië*ÉM<ö¾Ñ}rh¿ªí ¢Âð
}³Ô+rÍ7îÂMNûÐcøúÝuz´)Ó99$uçûMj.¹QÍQ{KìÕo®#´ô4DÁ¶
¤tÒMÌSZ_ïõH%éSöatV/ü¨Ì-ðkÐ¶=Éçñ©E·%ø¾«Ø1.»>`/B Ù>´wÛ	©AÒêµ|gn¶¶Cj³n3¸á"a2
H'1tÎõ*ßOQ²èªÈg¿ú9nb
ø|OõH;¾VLvó À°.zÜ²+TUÃ±­¾ßnhà9¨ú³Y5pûì¦[AÛnE¤!>tØYfIÕ,s¸9±½öV#,ê¼6Vê²¦ß¯$íxKêVýÞxIû
ùj%¨$Bà~ì,eá¢RÍ½ÛI×`üÑÖ9©Þ÷Ür½Q+Î¡ë<ÕpÂ·aF¤ÍFÐ£´p'¶q[®5EþrÇDÇZTÝÎþ¤Åª¸þÙ¾Aë±8y#Ä#å9M×ÄbdXnúÊ
ÚÅÕ "N°º$¨Né¼à1V¦tÕ½áÐuâùBñàÚª ÂÚtò÷»îâØ[÷üÞÕ4<øíQÎÒüR)õ¿tÀR/SbK«EÃÄ?Ã­ÿv>­MPúÈ© \GS%8ÎéS%z?ËH;j'h¤º<ÛÇþ¯£sÆeÉ»6jBy±ß¡áð.«N§àÇÐå5K!2.ÃJjGUal¹»r^îó~ÕMTïUõÁ~â-ÚÒÓ+*ÞnçXÂÍ´´Ý¢Û!æáhjPÙ­/¼DëøFÞKAá¸H=¼ÜÄD­ÄIÛhpúºã°CtFtÝZ°ðñp«vÄgu<Ë=ö«wÙÅÏ9­KÞí}}ÿz´ /zV6õ'.,×`¨¹TKa;ïí;íQ CÑÄãfüMÉ0êe ø`õ§;ã}©>^¨ë*XP2Ö"òÅÕ³	ÝåÌ(ûqðú8rX¿	Ë^§#£G8Bó	¿dÃ^ûuDÓÝÚòLvkC÷2+ô¥XÎ3\¾3W	Ç|ÏÕ×:R·BIm9g×ãìV?Lµ±³±g7{üÊ
4áxÜ#6¬BR
@MñÁ-BÍÝºæW	÷w¼v±vQ86ª	í»þ o/As¬c"óiªxðÌx×1¸-uÏV_GÐfêë[aMù~j|ûqÔèeiLðÅJpK¬ÜFõ·0ÎÇáÿQÓ @¨öû[÷ð®ÂÃ¤­ç:YÚDL´©¢ÚZp¨µ#-?%ZbÍg¦rÒX1ýÖíGDâ§E±ØLÜgÏÒcÛ´:O]yª;¡B'É°oA¹[RwT#¹¿ß¤£×DúòXuê[Îä>:íÑø­w¨7VùsÍí!]ÀJ8õ&BátÇuwb²±Ô2¨÷>ª>¢QÉ6÷ßTÐ6Þ7N~A¼gvòSy]L5âîzy26V¯÷Êè\ßàØ%py2fý|?Íú¥,èS9pVø÷©¨ÒðìÒµI|òLï§þ%Î)?;^#Â&vÃ·º_c¬k)ÚcwÁ}lÒP¬ñ&þ\½5<uIû1ZÜ_4´­îzß!`N¼6H<Bömã²AÙl¼UH7þçz¡ÅÁºc£A.q<ª¹>¤f#ú±ù¼d3\UÂØ¡èò¨µ
ßÜ¬ÙK	j»á/)	Ê	/Ð8¿½{Fé£:¦i)ê<~³£Ä{µp¶Ù° þËÞhÉfhûG%$2rú&~qylbE2
W%¤Â®$ê4}ÌìC¢2Åb4-[6nï)À%.>>Óå6ú¬VMÓÝ©ô6À÷ur`Ô1,Uz`
l²-ÏZ£
Cõ½K Ã,,&©mc)Nö9ÓõùôñÐ0ñ¬­GW£<ªS	#ßd=£ÑJÓ1àwU)³ô»&&¬÷Ui³lþÃgz?.ûà
£3'üØi¨°`é[mÄA!?Ë»CõWèÉ®µ¬pñÉ¤ßª|W(Ñ<Zë¿	¾ý¸®!Eo'\åF:5l£t.x4Ùé¯5ßúÿ Ù¶
endstream
endobj
102 0 obj <<
/Type /FontDescriptor
/FontName /VIOUBE+CMTT10
/Flags 4
/FontBBox [-4 -235 731 800]
/Ascent 611
/CapHeight 611
/Descent -222
/ItalicAngle 0
/StemV 69
/XHeight 431
/CharSet (/A/B/C/E/G/H/I/L/N/O/R/S/T/V/a/asciicircum/asciitilde/asterisk/b/backslash/bar/braceleft/braceright/bracketleft/bracketright/c/colon/comma/d/dollar/e/equal/exclam/f/four/g/greater/h/hyphen/i/k/l/less/m/n/nine/numbersign/o/one/p/parenleft/parenright/period/plus/quotedbl/r/s/semicolon/seven/six/slash/t/three/two/u/underscore/v/w/x/zero)
/FontFile 101 0 R
>> endobj
103 0 obj <<
/Length1 970
/Length2 3048
/Length3 0
/Length 3673      
/Filter /FlateDecode
>>
stream
xÚ­y<TûÇI¤!{e)51cì4ö}cfh3±k¡PBdW${"[¶,KdéÚwúNÝï½·_ß¯óÏy?ëç<ÏsùÍ$ÕPxg´6GHAssHI5¼Ñ"ÓDÑ DA¨ù¸Pi "¯(+§(+4ðÞ×D@TCì{Pó@{c` ÞD{Pj XÀÄ R~Ï  ¦hÚÛA  
$ÎhWþ®sÁ°¿Ì(Ï¿]¾hoE J)P$¢ð8l B»ÀxJ/4EÉÿ¨_kû`±ïåLéü6à¿xO"Ú0À£ÐÞ¸_C­Ð3@£0>¿záDTÃ¹bÑô_&AãFcÈ ÑÛýÃÆ¡~Õ@Û`CMËÿ]è§1#xþSõ{ôüËñxcü;i)ii%òüýæðK3-Âà(!' ¼½ ÊiPH 
í ý)ÁR8<Pf¸à½Aß÷IY
ñÝô) `ä?$wBx,eÍ[ ÒÒ õB 0ú'`P ßü	å 0æ'¤TÇþÖÿ"åÁøRÙó§åð?IPªþ | üÔBI"þÀÿÝº:Þ?HHBed9¨, ¯ òÂ>ÞÞhñÇ@Ùøßì¡íFþÁ#"ÝÒª£niå¾/¦§Vw}u×°²y¨!bì56ÿ8ùõ~I;Ó<í<ß!!®!Ø¤WûÏ0¯»IÇó¾Nóµ<Öës;KÌõÕÃËrÔFäî¢TgmY«íK9Æ¢æO}à§zcç[õ&3Rf­µz!"ÃoÊòÐ«(V6fÒ%5ùädÄ-·úËkø¶ý\ú')Ç4¨^K§cöoÔ GÒ£ë½Lí]Vá)Õ&PYE]À±#"ÎÈõò¹f÷OÂ¼JÝ6ûLNj$k3Ï"áô:\Z¿ª]b:RcFkcî®èðt*÷KØ'U¡ùÞéÅ]8¨Ó¹RÅ5øLI Y¬?¡ît2©HÛ{jï,a#!óÛj1'SÅ!Ó)HÙ¦Iqç¼¿óÔ#©²¥ºêþPÚþÂÚ5w´2ñ,$ly')X,?]j?ß#ÓÏ¸+ÍºSÖÁ­|îú0Enê5^ÔgÅr·ÖÈ3Awßt)vì²Ôxa
Nóî±ä*Ç«¼Ê´Ú7ðHÑö¯©\Öíó9òO$»óÕ¹2ç§®SÓàe¶4°«}¿Ô­_5Gñ±m*Õ¿ÉâÆ?QuÑ0h}øù¨Ó&ÃãÄ°sßÜXNÔ	\aá-q¸H®©`§UÑ4ë7¬ËÚáUpòrW©§Þp«}=ÞK.mMÆèªÒ0¸%N¬.ÞYTU@j4L
ÛWïE9:
°p|%²-az×íÊ¥:®<<óÊ¬t/ÀSôT$íR)b_-|aB¨È-¢c[;lZ$òx*â²,/y,wal@Ã:ù]þbvö¸Îf84àVÛ­-ÖÝ_Y*ÆHjV¯Nsïr¨}¥]Kåè×Ñ'óny¸ÓÎõ×ðRõÂìq¯×Åw0GÉl­xðÄZÔ?y£Uçn.½®ÚL¶}YÎÁ$"ê&j¿ÀÞ·4ÎvCÙöµ©üÎâde×'¼ì.nkÆlÖ37HG÷7ûn?·´dXïêÌ0û´ÈËXH¯³>­W­JÖ>-+{¯ûZ&]pÄEÜ÷Õ¥n1°e<Nôsãûú ñ9z{`æñ[sl8ç}AQÓ½IÏ&Ã4û»jj`ÆÜAF2æÆ>Ì6úwWèÜjcµ ¥zíÄe5OÇ'çøOVDl´lÜÝ× hViq=(L1ÂÝ(7ª3ScN_i ?´UG³½rÐ¸éÄ³O
°	Szäö^»yCûÔ5þCsO)öQi.É`G{g>ØËãóÉ©³~¶IE£uyj#íñuÙTªÏy,êúäu®qÖùº	Ï>\jD_­4nU¨V$n+×¶gu-ùçgïýÞ#®\þhû³-úøj¢xafqÚ*ÕIiÎÜ¤áGî¥y^\íÝæÞ¶Éä.I÷^Ø¸¸	ÝÇö}Ýq2=~|lin5ÇRr{}Løâ×Lí'ÇßJx­î}À÷ÓViÃj,Yï§éÖMõÇwÜZo@ðo^G¬
2aÞ
~ÇVú®OÎöèAzvÎÂ
)(|5u_&¨KßöÙÓ>¥ xFÇX~K>º]¤Bõ±ãX=*´ãW§cAôS­oeöï_pG´=¤¹«eÅ,æùô :]V/ÝP ºzc·ÌÎ´wßïÞ'NnxèC¤àóÞpÐaðÇó&NÆãð×ÓÐpú%æpQd¢ Á°:·{\Ôz	ÀmìÖ^y'YÊmãXÆ ÅÂ÷©¸Üj£òãýîvk>»0ñ×Gçô©¦»_ÛN>Óc[¿X¡Vb½ñúü¢Ü\biÌéþ-©}UÝÂÃ|ÐCRKfÄ7ç´¦`b¥«úíâ÷Jâ¬¯ä]úª¿mu*á0HÙ}«Øí),ô[ÐQC*2>Ç\æ@?%Ä4Uø6Ye)u§|åv²M<rmJ¿qÚ½pTrªEå½ðtÉºÌQ0ÂîuVÛäÕu¤9ö }ßZ/<á	
¢£+NÐLãÓw©e¼½Ô^^(Ï5Üyí¾"O\fìzÝÍ§ C
¿êÿô>XÕyVj%Í#´-cÔµÞp!ûêÇ;JöLKËÖËHjf\¶«îeR­Pývæ~ éØm³¿û]Ípù3ëAêó¡µ1V7ÒÁ;v«­PN¨XBïÂ¦@4ô¸$ÎH¹6Ï5¸,ö0¼Uß¶`Í cKs«ÒüöãòíM±G½[®>±úÆ_ÔÍÉ«CQÍX:íY'o<`Ä}Èo0
CÝy°¼P­ß¸æ¬ØE&4¸ëc¸"±þHyAÁQ¦}½s/èÅ6-N%vc{?B7]~¨ZA¶?Q[ÌF«ø(4õè]Æ:è¶lmB!eÍê4kÃî|Ayeä§¾ÌÓÝæÊd¹"³Ðj<Zèy>ù&÷ ªàËÈ,§gg¼¾Rï`Û:VJûÀÛJ»ßwyÇÚê:Ëìö¿=e{+×+ÊÁQöÇhtÿ«¨éìÒéqÿÕ¹°6ZÛW»b´y+¤òÝ§R®ÄÓ	ìp>¯VÑò~ÀjÛ3¸23ßàQ­'ÕTµ²4ûµ®ép®ä.j=÷ëÓÝÑ¤µ7ÕG5ÚîMòÚFÝïo§­\!ºx66§°ä6ÖÛ¯ëUÐXUº@0ßEßÀÁÇâp>3Ç¨øõtß ô{hZÿ¢'aÅY,:6M}º¾«)ap£¯û¥á¸,
Pæ¾&Å³BGÙ£WGçN.sEmQVY5Vüêf¹P8I?Ø[R #þa#6Pñ#¾ÿ³ßA¾.U^dN¤u)ïôê9aEQp>°ÕÏg3r¸è¢/ØLpIÏ#oNåoK÷7ú8îÒ¦Ac&êécù£¦ÊÎx°CéàmcªC[OIÙn±º\cøé<¥wV¯À²¼çôs'k>µ´)þã-éQ<£Ü3ïwÁÊÔVéú¶")-8£ § ³6gÖûBß$YvYûàw$²=eÇ:¡ñwr.>¢º%|$&7 ýÑfúyûT°ú¹WLVÁjÍ¾ÓWò]RrØT`¦Í^¿ÃpÍ¦¥?ñ÷´ÝDÛ *bSF~Ww$)¾\ç­Y³;ÙIºét°$Ào©³qúÂæxN,»ûZä1|FC¢oO
¬ÚÀÃËB8]õ,¸!1ÌPÃ_yYå8Iü^_fóCÑ³rVpã3=wÕ×²àÅsô,ç3T®Cç»ã¹$óÆqo+­i´Dé=ëõjéé/ÃE¨ºït\Xµ½k0ù>4&õÓç"¡5ÚCÚ­¾ôxw³MDJ²ÜüQäLÕdxÁ¦e©.««ëoÜË»õ\ó§v·æ20¦cå¤[ÏLÃ$ÏÇf8½¿?Ä ½èb#Í©>c7'aaÜ}µà}ÕÒÃÞ¶K©±ít´y}|xÂ¡ÍÕ»kµFþÜ]ªß\Æ8æþÞJã:Û qºÁ^>pqa3g¬Ë[ð5ï5ÃUêÔ(ëÄ{Âç$½saKPv.[{ÿ AR'e
endstream
endobj
104 0 obj <<
/Type /FontDescriptor
/FontName /GMNDGY+CMTT12
/Flags 4
/FontBBox [-1 -234 524 695]
/Ascent 611
/CapHeight 611
/Descent -222
/ItalicAngle 0
/StemV 65
/XHeight 431
/CharSet (/a/c/colon/d/e/f/h/i/l/m/o/p/period/s/slash/t)
/FontFile 103 0 R
>> endobj
41 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /JTJVAZ+CMBX10
/FontDescriptor 82 0 R
/FirstChar 49
/LastChar 117
/Widths 76 0 R
>> endobj
39 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /TUJSUI+CMBX12
/FontDescriptor 84 0 R
/FirstChar 46
/LastChar 117
/Widths 77 0 R
>> endobj
55 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /SYFPBV+CMMI10
/FontDescriptor 86 0 R
/FirstChar 60
/LastChar 62
/Widths 70 0 R
>> endobj
42 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /YNKAYN+CMR10
/FontDescriptor 88 0 R
/FirstChar 11
/LastChar 121
/Widths 75 0 R
>> endobj
37 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /NRWVXF+CMR12
/FontDescriptor 90 0 R
/FirstChar 40
/LastChar 116
/Widths 79 0 R
>> endobj
36 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /GEKLHR+CMR17
/FontDescriptor 92 0 R
/FirstChar 50
/LastChar 116
/Widths 80 0 R
>> endobj
60 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /OUVHFK+CMR8
/FontDescriptor 94 0 R
/FirstChar 65
/LastChar 65
/Widths 69 0 R
>> endobj
52 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /MPXKDH+CMSL10
/FontDescriptor 96 0 R
/FirstChar 50
/LastChar 79
/Widths 73 0 R
>> endobj
54 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /AITXFY+CMSY10
/FontDescriptor 98 0 R
/FirstChar 120
/LastChar 120
/Widths 71 0 R
>> endobj
53 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /CKLPEW+CMTI10
/FontDescriptor 100 0 R
/FirstChar 12
/LastChar 121
/Widths 72 0 R
>> endobj
43 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /VIOUBE+CMTT10
/FontDescriptor 102 0 R
/FirstChar 33
/LastChar 126
/Widths 74 0 R
>> endobj
38 0 obj <<
/Type /Font
/Subtype /Type1
/BaseFont /GMNDGY+CMTT12
/FontDescriptor 104 0 R
/FirstChar 46
/LastChar 116
/Widths 78 0 R
>> endobj
45 0 obj <<
/Type /Pages
/Count 5
/Kids [22 0 R 49 0 R 57 0 R 62 0 R 66 0 R]
>> endobj
105 0 obj <<
/Type /Outlines
/First 7 0 R
/Last 11 0 R
/Count 2
>> endobj
19 0 obj <<
/Title 20 0 R
/A 17 0 R
/Parent 11 0 R
/Prev 15 0 R
>> endobj
15 0 obj <<
/Title 16 0 R
/A 13 0 R
/Parent 11 0 R
/Next 19 0 R
>> endobj
11 0 obj <<
/Title 12 0 R
/A 9 0 R
/Parent 105 0 R
/Prev 7 0 R
/First 15 0 R
/Last 19 0 R
/Count -2
>> endobj
7 0 obj <<
/Title 8 0 R
/A 5 0 R
/Parent 105 0 R
/Next 11 0 R
>> endobj
106 0 obj <<
/Names [(Doc-Start) 35 0 R (page.1) 34 0 R (page.2) 51 0 R (page.3) 59 0 R (page.4) 64 0 R (page.5) 68 0 R]
/Limits [(Doc-Start) (page.5)]
>> endobj
107 0 obj <<
/Names [(section*.1) 40 0 R (section.1) 6 0 R (section.2) 10 0 R (subsection.2.1) 14 0 R (subsection.2.2) 18 0 R]
/Limits [(section*.1) (subsection.2.2)]
>> endobj
108 0 obj <<
/Kids [106 0 R 107 0 R]
/Limits [(Doc-Start) (subsection.2.2)]
>> endobj
109 0 obj <<
/Dests 108 0 R
>> endobj
110 0 obj <<
/Type /Catalog
/Pages 45 0 R
/Outlines 105 0 R
/Names 109 0 R
/PageMode/UseOutlines
/OpenAction 21 0 R
>> endobj
111 0 obj <<
/Author()/Title()/Subject()/Creator(LaTeX with hyperref package)/Producer(pdfTeX-1.40.9)/Keywords()
/CreationDate (D:20090909221759-04'00')
/ModDate (D:20090909221759-04'00')
/Trapped /False
/PTEX.Fullbanner (This is pdfTeX, Version 3.1415926-1.40.9-2.2 (Web2C 7.5.7) kpathsea version 3.5.7)
>> endobj
xref
0 112
0000000001 65535 f 
0000000002 00000 f 
0000000003 00000 f 
0000000004 00000 f 
0000000000 00000 f 
0000000015 00000 n 
0000004048 00000 n 
0000078786 00000 n 
0000000060 00000 n 
0000000090 00000 n 
0000004106 00000 n 
0000078676 00000 n 
0000000135 00000 n 
0000000158 00000 n 
0000009995 00000 n 
0000078602 00000 n 
0000000209 00000 n 
0000000238 00000 n 
0000010053 00000 n 
0000078528 00000 n 
0000000289 00000 n 
0000000313 00000 n 
0000001992 00000 n 
0000002182 00000 n 
0000002354 00000 n 
0000002503 00000 n 
0000002652 00000 n 
0000002807 00000 n 
0000002960 00000 n 
0000003145 00000 n 
0000003311 00000 n 
0000003683 00000 n 
0000004165 00000 n 
0000000363 00000 n 
0000003871 00000 n 
0000003930 00000 n 
0000077381 00000 n 
0000077241 00000 n 
0000078225 00000 n 
0000076820 00000 n 
0000003989 00000 n 
0000076679 00000 n 
0000077101 00000 n 
0000078083 00000 n 
0000003498 00000 n 
0000078367 00000 n 
0000006298 00000 n 
0000006453 00000 n 
0000006667 00000 n 
0000006164 00000 n 
0000004307 00000 n 
0000006608 00000 n 
0000077659 00000 n 
0000077941 00000 n 
0000077799 00000 n 
0000076961 00000 n 
0000008695 00000 n 
0000008528 00000 n 
0000006797 00000 n 
0000008636 00000 n 
0000077521 00000 n 
0000010112 00000 n 
0000009828 00000 n 
0000008813 00000 n 
0000009936 00000 n 
0000010730 00000 n 
0000010563 00000 n 
0000010218 00000 n 
0000010671 00000 n 
0000010824 00000 n 
0000010848 00000 n 
0000010882 00000 n 
0000010906 00000 n 
0000011562 00000 n 
0000011736 00000 n 
0000012130 00000 n 
0000012746 00000 n 
0000013146 00000 n 
0000013570 00000 n 
0000014014 00000 n 
0000014439 00000 n 
0000014855 00000 n 
0000019035 00000 n 
0000019283 00000 n 
0000023275 00000 n 
0000023537 00000 n 
0000025328 00000 n 
0000025559 00000 n 
0000038279 00000 n 
0000038692 00000 n 
0000043189 00000 n 
0000043468 00000 n 
0000045889 00000 n 
0000046117 00000 n 
0000047838 00000 n 
0000048054 00000 n 
0000050458 00000 n 
0000050687 00000 n 
0000052027 00000 n 
0000052253 00000 n 
0000059179 00000 n 
0000059472 00000 n 
0000072075 00000 n 
0000072626 00000 n 
0000076418 00000 n 
0000078454 00000 n 
0000078858 00000 n 
0000079020 00000 n 
0000079197 00000 n 
0000079283 00000 n 
0000079321 00000 n 
0000079447 00000 n 
trailer
<< /Size 112
/Root 110 0 R
/Info 111 0 R
/ID [<123B695B744F0D90C417CA5930BA2965> <123B695B744F0D90C417CA5930BA2965>] >>
startxref
79762
%%EOF
vimoutliner/scripts/otl2docbook.pl	[[[1
270
#!/usr/bin/perl

use strict;
use XML::Writer;
use vars qw($writer $section_has_contents $VERSION);

use constant DEBUG => 0;

$VERSION = '2.0';

sub debug {
	if ( DEBUG )
	{
		print STDERR @_;
	}
}

sub start_docbook {
	$writer = XML::Writer->new(DATA_MODE => 1,
	                           DATA_INDENT => 1);

	debug('  'x$writer->getDataIndent(), "starting new docbook\n");

	$writer->xmlDecl();

#    my $system = '/usr/share/sgml/docbook/xml-dtd-4.1/docbookx.dtd';
	my $system = 'http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd';

	$writer->doctype('article',
	                 '-//OASIS//DTD DocBook XML V4.1//EN',
	                 $system);
}

sub start_article {
	my $id = shift;

	debug('  'x$writer->getDataIndent(), "starting new article\n");

	my @attributes = (
	                  'class' => 'whitepaper',
	);

	if ( $id )
	{
		push @attributes, ( 'id' => $id );
	}

	$writer->startTag('article', @attributes);
}

sub start_section {
	my $title = shift;

	debug('  'x$writer->getDataIndent(), "starting new section\n");

	$writer->startTag('section');

	$section_has_contents = 0;

	if ( $title )
	{
		$writer->dataElement('title', $title);
	}
}

sub start_list {
	debug('  'x$writer->getDataIndent(), "starting new list\n");

	$writer->startTag('itemizedlist');
}

sub append_list_item {
	my $text = shift;

	debug('  'x$writer->getDataIndent(), "starting new listitem\n");

	$writer->startTag('listitem');

	$writer->dataElement('para', $text);

	$writer->endTag('listitem');
}

sub end_list {
	$writer->endTag('itemizedlist');

	debug('  'x$writer->getDataIndent(), "ending list\n");
}

sub append_code {
	my $code = shift;

	debug('  'x$writer->getDataIndent(), "starting new programlisting\n");

	$section_has_contents = 1;

	$writer->dataElement('programlisting', $code, role=>'C');
}

sub append_para {
	my $text = shift;

	debug('  'x$writer->getDataIndent(), "starting new para\n");

	$section_has_contents = 1;

	$writer->dataElement('para', $text);
}

sub end_section {
	if ( ! $section_has_contents )
	{
		$writer->emptyTag('para');
		$section_has_contents = 1;
	}

	$writer->endTag('section');

	debug('  'x$writer->getDataIndent(), "ending section\n");
}

sub end_article {
	$writer->endTag('article');

	debug('  'x$writer->getDataIndent(), "ending article\n");
}

sub end_docbook {
	$writer->end();

	debug('  'x$writer->getDataIndent(), "ending docbook\n");
}

####################################################

start_docbook();
start_article();

my $section_level = 0;
my $line;
my $para = '';
my $list_mode = 0;
my $code_mode = 0;
my $first_line = 1;

sub list_done {
	if ( $list_mode ) {
		end_list();
		$list_mode = 0;
	}
}

sub para_done {
	if ( $para )
	{
		chomp $para;
		if ( $code_mode )
		{
			append_code($para);
			$code_mode = 0;
		}
		elsif ( $list_mode )
		{
			append_list_item($para);
		}
		else
		{
			append_para($para);
		}
	}
	$para = '';
}

while ( defined ($line = <>) )
{
	if ( $first_line and $line =~ /^-\*-/ )
	{
		next;
	}
	$first_line = 0;

	if ( $line =~ /^\t*\* (.*)/ )
	{
		para_done();

		$para = $1;
 
		if ( ! $list_mode )
		{
			start_list();
			$list_mode = 1;
		}
 
		next;
	}

	if ( $line =~ /^\t*[^\t: ]/ )
	{
		para_done();
		list_done();
	}

	if ( $line =~ /^(\t*)([^\t\n: ].*)/ )
	{
		my $title = $2;
		my $new_section_level = length($1) + 1;

		para_done();
		list_done();

		for ( my $i = 0 ; $section_level - $new_section_level >= $i ; $i++ )
		{
			end_section();
		}

		chomp $title;
		start_section($title);

		$section_level = $new_section_level;
		next;
	}

# Code mode not supported yet
#    if ( ! $list_mode and $line =~ /^\s+/ )
#    {
#        debug("enabling code mode\n");
#        $code_mode = 1;
#    }

	 $line =~ s/^\t*(\: ?| )//;
	 if ($line =~ /^$/) {
		 para_done();
		 list_done();
	 next;
	 }
	 $para .= $line;
}
para_done();

for ( my $i = 0 ; $section_level > $i ; $i++ )
{
	end_section();
}

end_article();
end_docbook();

__END__

=head1 NAME

outline2dockbook - Generate DocBook XML from VimOutliner outline

=head1 SYNOPSIS

outline2docbook < input > output

=head1 DESCRIPTION

B<outline2docbook> reads an VimOutliner outline-mode type text file on
standard input and outputs DocBook XML on standard output.

The original version was written by Thomas R. Fullhart to convert from Emacs
outline mode.  It is available at
http://genetikayos.com/code/repos/outline2docbook/distribution/.

This program uses the B<XML::Writer> perl module, which is available
on B<CPAN>.

=cut
vimoutliner/scripts/otl2html.py	[[[1
1071
#!/usr/bin/python
# otl2html.py
# convert a tab-formatted outline from VIM to HTML
#
# Copyright 2001 Noel Henson All rights reserved
#
# ALPHA VERSION!!!
# $Revision: 1.52 $
# $Date: 2008/10/11 22:04:09 $
# $Author: noel $
# $Source: /home/noel/active/otl2html/RCS/otl2html.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program accepts text outline files and converts them
#	to HTML.  The outline levels are indicated by tabs. A line with no
#	tabs is assumed to be part of the highest outline level.
#
#	10 outline levels are supported.  These loosely correspond to the
#	HTML H1 through H9 tags.  Alphabetic, numeric and bullet formats
#	are also supported.
#
#	CSS support has been added.
#

###########################################################################
# include whatever mdules we need

import sys
from string import *
from re import *
from time import *
from os import system,popen

###########################################################################
# global variables

formatMode = "indent"
copyright = ""
level = 0
div = 0
silentdiv = 0
slides = 0
hideComments = 0
showTitle = 1
inputFile = ""
outline = []
flatoutline = []
inBodyText = 0		# 0: no, 1: text, 2: preformatted text, 3: table
styleSheet = "nnnnnn.css"
inlineStyle = 0

###########################################################################
# function definitions

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
   print
   print "Usage:"
   print "otl2html.py [options] inputfile > outputfile"
   print "Options"
   print "    -p              Presentation: slide show output for use with HtmlSlides."
   print "    -D              First-level is divisions (<div> </div>) for making"
   print "                    pretty web pages."
   print "    -s sheet        Use the specified style sheet with a link. This is the"
   print "                    default."
   print "    -S sheet        Include the specified style sheet in-line the output. For"
   print "                    encapsulated style."
   print "    -T              The first line is not the title. Treat it as outline data"
   print "    -c              comments (line with [ as the first non-whitespace"
   print "                    character. Ending with ] is optional."
   print "    -C copyright    Override the internal copyright notice with the"
   print "                    one supplied in the quoted string following this"
   print "                    flag. Single or double quotes can be used."
   print "    -v              Print version (RCS) information."
   print "    -H              Show the file syntax help."
   print "output is on STDOUT"
   print "  Note: if neither -s or -S are specified, otl2html.py will default to -s. It"
   print "      will try to use the css file 'nnnnnn.css' if it exists. If it does not"
   print "      exist, it will be created automatically."
   print

def showSyntax():
   print
   print "Syntax"
   print "Syntax is Vim Outliner's normal syntax. The following are supported:"
   print
   print "   Text"
   print "	:	Body text marker. This text will wrap in the output."
   print "	;	Preformmated text. This text will will not wrap."
   print
   print "   Tables"
   print "	||	Table header line."
   print "	|	Table and table columns. Example:"
   print "			|| Name | Age | Animal |"
   print "			| Kirby | 9 | Dog |"
   print "			| Sparky | 1 | Bird |"
   print "			| Sophia | 8 | Cat |"
   print "			This will cause an item to be left-justified."
   print "				| whatever  |"
   print "			This will cause an item to be right-justified."
   print "				|  whatever |"
   print "			This will cause an item to be centered."
   print "				|  whatever  |"
   print "			This will cause an item to be default aligned."
   print "				| whatever |"
   print
   print "   Character Styles"
   print "	**	Bold. Example: **Bold Text**"
   print "	//	Italic. Example: //Italic Text//"
   print "	+++	Highlight. Example: +++Highlight Text+++"
   print "	---	Strikeout. Example: ---Strikeout Text---"
   print " 	Insane	---+++//**Wow! This is insane!**//+++---"
   print "		Just remember to keep it all on one line."
   print "   Horizontal Rule"
   print "	----------------------------------------  (40 dashes)."
   print "   Copyright"
   print "	(c) or (C)	Converts to a standard copyright symbol."
   print
   print "   Including Images (for web pages)"
   print "	[imagename]	Examples:"
   print "			[logo.gif] [photo.jpg] [car.png]"
   print "			[http://i.a.cnn.net/cnn/.element/img/1.1/logo/logl.gif]"
   print "			or from a database:"
   print "			[http://www.lab.com/php/image.php?id=4]"
   print
   print "   Including links (for web pages)"
   print "	[link text-or-image]	Examples:"
   print "			[about.html About] [http://www.cnn.com CNN]"
   print "			or with an image:"
   print "			[http://www.ted.com [http://www.ted.com/logo.png]]"
   print "			Links starting with a '+' will be opened in a new"
   print "			window. Eg. [+about.html About]"
   print
   print "   Including external files"
   print "	!filename!	Examples:"
   print "			!file.txt!"
   print
   print "   Including external outlines (first line is parent)"
   print "	!!filename!!	Examples:"
   print "			!!menu.otl!!"
   print
   print "   Including output from executing external programs"
   print "	!!!program args!!!	Examples:"
   print "			!!!date +%Y%m%d!!!"
   print
   print "   Note:"
   print "	When using -D, the top-level headings become divisions (<div>)"
   print "	and will be created using a class of the heading name. Spaces"
   print "	are not allowed. If a top-level heading begins with '_', it"
   print "	will not be shown but the division name will be the same as"
   print "	without the '_'. Example: _Menu will have a division name of"
   print "	Menu and will not be shown."
   print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
   print
   print "RCS"
   print " $Revision: 1.52 $"
   print " $Date: 2008/10/11 22:04:09 $"
   print " $Author: noel $"
   print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
  global inputfile, debug, formatMode, slides, hideComments, copyright, styleSheet, inlineStyle, div, showTitle
  if (len(sys.argv) == 1): 
    showUsage()
    sys.exit()()
  else:
    for i in range(len(sys.argv)):
      if (i != 0):
        if   (sys.argv[i] == "-d"): debug = 1	# test for debug flag
        elif (sys.argv[i] == "-?"):		# test for help flag
	  showUsage()				# show the help
	  sys.exit()				# exit
        elif (sys.argv[i] == "-p"):		# test for the slides flag
	  slides = 1				# set the slides flag
        elif (sys.argv[i] == "-D"):		# test for the divisions flag
	  div = 1				# set the divisions flag
        elif (sys.argv[i] == "-T"):		# test for the no-title flag
	  showTitle = 0				# clear the show-title flag
        elif (sys.argv[i] == "-c"):		# test for the comments flag
	  hideComments = 1			# set the comments flag
        elif (sys.argv[i] == "-C"):		# test for the copyright flag
	  copyright = sys.argv[i+1]		# get the copyright
	  i = i + 1				# increment the pointer
        elif (sys.argv[i] == "-s"):		# test for the style sheet flag
	  styleSheet = sys.argv[i+1]		# get the style sheet name
	  formatMode = "indent"			# set the format
	  i = i + 1				# increment the pointer
        elif (sys.argv[i] == "-S"):		# test for the style sheet flag
	  styleSheet = sys.argv[i+1]		# get the style sheet name
	  formatMode = "indent"			# set the format
	  inlineStyle = 1
	  i = i + 1				# increment the pointer
        elif (sys.argv[i] == "--help"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-h"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-H"):
	  showSyntax()
	  sys.exit()
        elif (sys.argv[i] == "-v"):
	  showVersion()
	  sys.exit()
	elif (sys.argv[i][0] == "-"):
	  print "Error!  Unknown option.  Aborting"
	  sys.exit()
	else: 					# get the input file name
          inputfile = sys.argv[i]

# getLineLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  return(n+1)					# return the count + 1 (for level)

# getLineTextLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineTextLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  n = n + count(linein," ",0,x)			# count the spaces
  return(n+1)					# return the count + 1 (for level)
    
# colonStrip(line)
# stip a leading ':', if it exists
# input: line
# output: returns a string with a stipped ':'

def colonStrip(line):
	if (line[0] == ":"): return lstrip(line[1:])
        else: return line

# semicolonStrip(line)
# stip a leading ';', if it exists
# input: line
# output: returns a string with a stipped ';'

def semicolonStrip(line):
	if (line[0] == ";"): return line[1:]
        else: return line

# dashStrip(line)
# stip a leading '-', if it exists
# input: line
# output: returns a string with a stipped '-'

def dashStrip(line):
	if (line[0] == "-"): return line[1:]
        else: return line

# pipeStrip(line)
# stip a leading '|', if it exists
# input: line
# output: returns a string with a stipped '|'

def pipeStrip(line):
	if (line[0] == "|"): return line[1:]
        else: return line

# plusStrip(line)
# stip a leading '+', if it exists
# input: line
# output: returns a string with a stipped '+'

def plusStrip(line):
	if (line[0] == "+"): return line[1:]
        else: return line

# handleBodyText
# print body text lines with a class indicating level, if style sheets
# are being used. otherwise print just <p>
# input: linein - a single line that may or may not have tabs at the beginning
# output: through standard out

def handleBodyText(linein,lineLevel):
  global inBodyText
  if (inBodyText == 2): print "</pre>"
  if (inBodyText == 3): print "</table>"
  print "<p",
  if (styleSheet != ""):
    print " class=\"P" + str(lineLevel) + "\"",
    inBodyText = 1
  print ">" + colonStrip(rstrip(lstrip(linein))),

# handlePreformattedText
# print preformatted text lines with a class indicating level, if style sheets
# are being used. otherwise print just <pre>
# input: linein - a single line that may or may not have tabs at the beginning
# output: through standard out

def handlePreformattedText(linein,lineLevel):
  global inBodyText
  if (inBodyText == 1): print "</p>"
  if (inBodyText == 3): print "</table>"
  print "<pre",
  if (styleSheet != ""):
    print " class=\"PRE" + str(lineLevel) + "\"",
    inBodyText = 2
  print ">" + semicolonStrip(rstrip(lstrip(linein))),


# isAlignRight
# return flag
# input: coldata, a string

def isAlignRight(coldata):
  l = len(coldata)
  if (coldata[0:2] == "  ") and (coldata[l-2:l] != "  "): return 1
  else: return 0

# isAlignLeft
# return flag
# input: coldata, a string

def isAlignLeft(coldata):
  l = len(coldata)
  if (coldata[0:2] != "  ") and (coldata[l-2:l] == "  "): return 1
  else: return 0

# isAlignCenter
# return flag
# input: coldata, a string

def isAlignCenter(coldata):
  l = len(coldata)
  if (coldata[0:2] == "  ") and (coldata[l-2:l] == "  "): return 1
  else: return 0

# getColumnAlignment(string)
# return string
# input: coldata
# output: <td align="left"> or <td align="right"> or <td align="center"> or <td>

def getColumnAlignment(coldata):
	if isAlignCenter(coldata): return '<td align="center">'
	if isAlignRight(coldata): return '<td align="right">'
	if isAlignLeft(coldata): return '<td align="left">'
	return '<td>'

# handleTableColumns
# return the souce for a row's columns
# input: linein - a single line that may or may not have tabs at the beginning
# output: string with the columns' source

def handleTableColumns(linein,lineLevel):
  out = ""
  coldata = lstrip(rstrip(linein))
  coldata = coldata.split("|")
  for i in range(1,len(coldata)-1):
		out += getColumnAlignment(coldata[i])
		out += lstrip(rstrip(coldata[i]))+'</td>'
  return out 

# handleTableHeaders
# return the souce for a row's headers
# input: linein - a single line that may or may not have tabs at the beginning
# output: string with the columns' source

def handleTableHeaders(linein,lineLevel):
  out = ""
  coldata = lstrip(rstrip(linein))
  coldata = coldata.split("|")
  for i in range(2,len(coldata)-1):
		out += getColumnAlignment(coldata[i])
		out += lstrip(rstrip(coldata[i]))+'</td>'
  out = replace(out,'<td','<th')
  out = replace(out,'</td','</th')
  return out 

# handleTableRow
# print a table row
# input: linein - a single line that may or may not have tabs at the beginning
# output: out

def handleTableRow(linein,lineLevel):
  out = "<tr>"
  if (lineLevel == find(linein,"|| ") +1 ): 
         out += handleTableHeaders(linein,lineLevel)
  else:  out += handleTableColumns(linein,lineLevel)
  out += "</tr>"
  return out

# handleTable
# print a table, starting with a <TABLE> tag if necessary
# input: linein - a single line that may or may not have tabs at the beginning
# output: through standard out

def handleTable(linein,lineLevel):
  global inBodyText
  if (inBodyText == 1): print "</p>"
  if (inBodyText == 2): print "</pre>"
  if (inBodyText != 3): 
	  print "<table class=\"TAB" + str(lineLevel) + "\">"
	  inBodyText = 3
  print handleTableRow(linein,lineLevel), 

# linkOrImage
# if there is a link to an image or another page, process it
# input: line
# output: modified line

def linkOrImage(line):
  line = sub('\[(\S+?)\]','<img src="\\1" alt="\\1">',line)
  line = sub('\[(\S+)\s(.*?)\]','<a href="\\1">\\2</a>',line)
  line = sub('(<a href=")\+(.*)"\>','\\1\\2" target=_new>',line)
  line = replace(line,'<img src="X" alt="X">','[X]')
  line = replace(line,'<img src="_" alt="_">','[_]')
  return line

# tabs
# return a string with 'count' tabs
# input: count
# output: string of tabs

def tabs(count):
  out = ""
  if (count == 0): return ""
  for i in range (0,count-1):
    out = out + "\t"
  return out

# includeFile
# include the specified file, if it exists
# input: line and lineLevel
# output: line is replaced by the contents of the file

def includeFile(line,lineLevel):
  filename = sub('!(\S+?)!','\\1',lstrip(rstrip(line)))
  incfile = open(filename,"r")
  linein = incfile.readline()
  while linein != "":
    linein = sub('^',tabs(lineLevel),linein)
    processLine(linein)
    linein = incfile.readline()
  incfile.close()
  return

# includeOutline
# include the specified file, if it exists
# input: line and lineLevel
# output: line is replaced by the contents of the file

def includeOutline(line,lineLevel):
  filename = sub('!!(\S+?)!!','\\1',lstrip(rstrip(line)))
  incfile = open(filename,"r")
  linein = incfile.readline()
  linein = sub('^',tabs(lineLevel),linein)
  processLine(linein)
  linein = incfile.readline()
  while linein != "":
    linein = sub('^',tabs(lineLevel+1),linein)
    processLine(linein)
    linein = incfile.readline()
  incfile.close()
  return

# execProgram
# execute the specified program
# input: line
# output: program specified is replaced by program output

def execProgram(line):
  program = sub('.*!!!(.*)!!!.*','\\1',lstrip(rstrip(line)))
  child = popen(program)
  out = child.read()
  err = child.close()
  out = sub('!!!(.*)!!!',out,line)
  processLine(out)
  if err: raise RuntimeError, '%s failed w/ exit code %d' % (program, err)
  return 

# divName
# create a name for a division
# input: line
# output: division name
def divName(line):
	global silentdiv
	line = lstrip(rstrip(line))
	if (line[0] == '_'):
		silentdiv = 1
		line = line[1:]
	line = replace(line, ' ', '_')
	return'<div class="' + line + '">'

# getTitleText(line)
# extract some meaningful text to make the document title from the line
# input: line
# output: modified line
def getTitleText(line):
  out = sub('.*#(.*)#.*','\\1',line);
  out = sub('<.*>','',out);
#  if (out != ""): out = sub('\"(.*?)\"','\\1',line);
  return(out);

# stripTitleText(line)
# strip the title text if it is enclosed in double-quotes
# input: line
# output: modified line
def stripTitleText(line):
  out = sub('#\W*.*#','',line);
  return(out);

# beautifyLine(line)
# do some optional, simple beautification of the text in a line
# input: line
# output: modified line
def beautifyLine(line):
  if (lstrip(rstrip(line)) == "----------------------------------------"):
        return "<br><hr><br>"
  
  out = line
  line = ""

  while (line != out):

	  line = out
	# out = replace(out,'---','<strike>',1)
	  if (lstrip(line)[0] != ";"): out = sub('\-\-\-(.*?)\-\-\-','<strike>\\1</strike>',out)
	  out = linkOrImage(out)
	# out = replace(out,'**','<strong>',1)
	  out = sub('\*\*(.*?)\*\*','<strong>\\1</strong>',out)
	# out = replace(out,'//','<i>',1)
	  out = sub('\/\/(.*?)\/\/','<i>\\1</i>',out)
	# out = replace(out,'+++','<code>',1)
	  out = sub('\+\+\+(.*?)\+\+\+','<code>\\1</code>',out)
	  out = sub('\(c\)','&copy;',out)
	  out = sub('\(C\)','&copy;',out)
  return out

# closeLevels
# generate the number of </ul> or </ol> tags necessary to proplerly finish
# input: format - a string indicating the mode to use for formatting
#        level - an integer between 1 and 9 that show the current level
# 	          (not to be confused with the level of the current line)
# output: through standard out

def closeLevels():
  global level, formatMode
  while (level > 0):
    if (formatMode == "bullets"):
      print "</ul>"
    if (formatMode == "alpha") or (formatMode == "numeric") or \
    (formatMode == "roman") or (formatMode == "indent"):
      print "</ol>"

    level = level - 1


# processLine
# process a single line
# input: linein - a single line that may or may not have tabs at the beginning
#        format - a string indicating the mode to use for formatting
#        level - an integer between 1 and 9 that show the current level
# 	          (not to be confused with the level of the current line)
# output: through standard out

def processLine(linein):
  global level, formatMode, slides, hideComments, inBodyText, styleSheet, inlineStyle, div, silentdiv
  if (lstrip(linein) == ""): return
  linein = beautifyLine(linein)
  lineLevel = getLineLevel(linein)
  if ((hideComments == 0) or (lineLevel != (find(linein,"[")+1))):

      if (lineLevel > level): # increasing depth
       while (lineLevel > level):
    	if (formatMode == "indent" or formatMode == "simple"):
          if (inBodyText == 1):
	    print"</p>"
	    inBodyText = 0
          elif (inBodyText == 2):
  	    print"</pre>"
  	    inBodyText = 0
          elif (inBodyText == 3):
  	    print"</table>"
  	    inBodyText = 0
          if not (div == 1 and lineLevel == 1): print "<ol>"
    	else:
    	  sys.exit("Error! Unknown formatMode type")
    	level = level + 1

      elif (lineLevel < level): # decreasing depth
       while (lineLevel < level):
        if (inBodyText == 1):
	  print"</p>"
	  inBodyText = 0
        elif (inBodyText == 2):
	  print"</pre>"
	  inBodyText = 0
        elif (inBodyText == 3):
	  print"</table>"
	  inBodyText = 0
  	print "</ol>"
  	level = level - 1
	if (div == 1 and level == 1): 
		if (silentdiv == 0): print'</ol>'
		else: slientdiv = 0
		print'</div>'

      else: print # same depth
      if (div == 1 and lineLevel == 1): 
	  if (lineLevel != find(linein,"!") +1):
		  print divName(linein)
		  if (silentdiv == 0): print "<ol>"

      if (slides == 0):
          if (lineLevel == find(linein," ") +1 ) or \
	  (lineLevel == find(linein,":") +1 ): 
		  if (inBodyText != 1): handleBodyText(linein,lineLevel)
		  elif (colonStrip(rstrip(lstrip(linein))) == ""):
			  print "</p>"
			  handleBodyText(linein,lineLevel)
            	  else: print colonStrip(rstrip(lstrip(linein))),
          elif (lineLevel == find(linein,";") +1 ): 
		  if (inBodyText != 2): handlePreformattedText(linein,lineLevel)
		  elif (semicolonStrip(rstrip(lstrip(linein))) == ""):
			  print "</pre>"
			  handlePreformattedText(linein,lineLevel)
            	  else: print semicolonStrip(rstrip(lstrip(linein))),
          elif (lineLevel == find(linein,"|") +1 ): 
		  if (inBodyText != 3): handleTable(linein,lineLevel)
		  elif (pipeStrip(rstrip(lstrip(linein))) == ""):
			  print "</table>"
			  handleTtable(linein,lineLevel)
            	  else: print handleTableRow(linein,lineLevel),
          elif (lineLevel == find(linein,"!!!") +1 ):
		  execProgram(linein)
          elif (lineLevel == find(linein,"!!") +1 ):
		  includeOutline(linein,lineLevel)
          elif (lineLevel == find(linein,"!") +1 ):
		  includeFile(linein,lineLevel)
  	  else:
            if (inBodyText == 1):
	    	    print"</p>"
		    inBodyText = 0
            elif (inBodyText == 2):
	    	    print"</pre>"
		    inBodyText = 0
            elif (inBodyText == 3):
	    	    print"</table>"
		    inBodyText = 0
	    if (silentdiv == 0):
		    print "<li",
		    if (styleSheet != ""):
		      if (lineLevel == find(linein,"- ") +1 ): 
			print " class=\"LB" + str(lineLevel) + "\"",
			print ">" + lstrip(rstrip(dashStrip(lstrip(linein)))),
		      elif (lineLevel == find(linein,"+ ") +1 ): 
			print " class=\"LN" + str(lineLevel) + "\"",
			print ">" + lstrip(rstrip(plusStrip(lstrip(linein)))),
		      else:
			print " class=\"L" + str(lineLevel) + "\"",
			print ">" + rstrip(lstrip(linein)),
	    else: silentdiv = 0
      else:
          if (lineLevel == 1):
            if (linein[0] == " "):
	      if (inBodyText == 0):
		handleBodyText(linein,lineLevel)
	      else: print rstrip(lstrip(linein)),
            else:
              print "<address>"
	      print rstrip(lstrip(linein)),
	      print "</address>\n"
          else:
	    if (lineLevel == find(linein," ") +1 ) or \
	    (lineLevel == find(linein,":") +1 ): 
		    if (inBodyText == 0):
		        handleBodyText(linein,lineLevel)
	      	    else: print rstrip(lstrip(linein)),
            else:
              if (inBodyText == 1):
	    	    print"</p>"
		    inBodyText = 0
              print "<li",
	      if (styleSheet != ""):
                print " class=\"LI.L" + str(lineLevel) + "\"",
              print ">" + rstrip(lstrip(linein)),
      
# flatten
# Flatten a subsection of an outline.  The index passed is the outline section
# title.  All sublevels that are only one level deeper are indcluded in the current
# subsection.  Then there is a recursion for those items listed in the subsection.
# Exits when the next line to be processed is of the same or lower outline level.
#  (lower means shallower)
# input: idx - the index into the outline.  The indexed line is the title.
# output: adds reformatted lines to flatoutline[]

def flatten(idx):
  if (outline[idx] == ""):
    return
  if (len(outline) <= idx):
    return
  titleline = outline[idx]
  titlelevel = getLineLevel(titleline)
  if (getLineLevel(outline[idx+1]) > titlelevel):
    if (titleline[titlelevel-1] != " "):
      flatoutline.append(lstrip(titleline))
    exitflag = 0
    while (exitflag == 0):
      if (idx < len(outline)-1):
        idx = idx + 1
        currlevel = getLineLevel(outline[idx])
        if (currlevel == titlelevel + 1):
          if (currlevel == find(outline[idx]," ") +1):
            flatoutline.append("\t " + lstrip(outline[idx]))
          else:
            flatoutline.append("\t" + lstrip(outline[idx]))
        elif (currlevel <= titlelevel):
          exitflag = 1
      else:
        exitflag = 1
  level =  titlelevel
  return

def createCSS():
  global styleSheet
  output = "	/* copyright notice and filename */\n"
  output += "body { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 10pt;\n"
  output += "}\n"
  output += "	/* title at the top of the page */\n"
  output += "H1 { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 14pt;\n"
  output += "        font-weight: bold;\n"
  output += "        text-align: center;\n"
  output += "        color: black;\n"
  output += "	background-color: #ddddee;\n"
  output += "	padding-top: 20px;\n"
  output += "	padding-bottom: 20px;\n"
  output += "}\n"
  output += "H2 { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 12pt;\n"
  output += "        font-weight: bold;\n"
  output += "        text-align: left;\n"
  output += "        color: black;\n"
  output += "}\n"
  output += "H3 { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 12pt;\n"
  output += "        text-align: left;\n"
  output += "        color: black;\n"
  output += "}\n"
  output += "H4 { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 12pt;\n"
  output += "        text-align: left;\n"
  output += "        color: black;\n"
  output += "}\n"
  output += "H5 { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 10pt;\n"
  output += "        text-align: left;\n"
  output += "        color: black;\n"
  output += "}\n"
  output += "	/* outline level spacing */\n"
  output += "OL { \n"
  output += "        margin-left: 1.0em;\n"
  output += "        padding-left: 0;\n"
  output += "        padding-bottom: 8pt;\n"
  output += "}\n"
  output += "	/* global heading settings */\n"
  output += "LI { \n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        color: black;\n"
  output += "        font-weight: normal;\n"
  output += "        list-style: lower-alpha;\n"
  output += "	padding-top: 4px;\n"
  output += "}\n"
  output += "	/* level 1 heading overrides */\n"
  output += "LI.L1 { \n"
  output += "        font-size: 12pt;\n"
  output += "        font-weight: bold;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 2 heading overrides */\n"
  output += "LI.L2 { \n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: bold;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 3 heading overrides */\n"
  output += "LI.L3 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 4 heading overrides */\n"
  output += "LI.L4 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 5 heading overrides */\n"
  output += "LI.L5 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 6 heading overrides */\n"
  output += "LI.L6 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 7 heading overrides */\n"
  output += "LI.L7 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: none;\n"
  output += "}\n"
  output += "	/* level 1 bullet heading overrides */\n"
  output += "LI.LB1 { \n"
  output += "        font-size: 12pt;\n"
  output += "        font-weight: bold;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 2 bullet heading overrides */\n"
  output += "LI.LB2 { \n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: bold;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 3 bullet heading overrides */\n"
  output += "LI.LB3 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 4 bullet heading overrides */\n"
  output += "LI.LB4 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 5 bullet heading overrides */\n"
  output += "LI.LB5 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 6 bullet heading overrides */\n"
  output += "LI.LB6 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 7 bullet heading overrides */\n"
  output += "LI.LB7 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: disc;\n"
  output += "}\n"
  output += "	/* level 1 numeric heading overrides */\n"
  output += "LI.LN1 { \n"
  output += "        font-size: 12pt;\n"
  output += "        font-weight: bold;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "	/* level 2 numeric heading overrides */\n"
  output += "LI.LN2 { \n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: bold;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "	/* level 3 numeric heading overrides */\n"
  output += "LI.LN3 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "	/* level 4 numeric heading overrides */\n"
  output += "LI.LN4 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "	/* level 5 numeric heading overrides */\n"
  output += "LI.LN5 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "	/* level 6 numeric heading overrides */\n"
  output += "LI.LN6 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "	/* level 7 numeric heading overrides */\n"
  output += "LI.LN7 { \n"
  output += "        font-size: 10pt;\n"
  output += "        list-style: decimal;\n"
  output += "}\n"
  output += "       	/* body text */\n"
  output += "P {\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 9pt;\n"
  output += "        font-weight: normal;\n"
  output += "        color: darkgreen;\n"
  output += "}\n"
  output += "	/* preformatted text */\n"
  output += "PRE { \n"
  output += "        font-family: fixed,monospace;\n"
  output += "        font-size: 9pt;\n"
  output += "        font-weight: normal;\n"
  output += "        color: darkblue;\n"
  output += "}\n"
  output += "\n"
  output += "TABLE {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 12pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  output += "}\n"
  output += "\n"
  output += "TH {\n"
  output += "	border: 1px solid black;\n"
  output += "	padding: 0.5em;\n"
  output += "	background-color: #eeddee;\n"
  output += "}\n"
  output += "\n"
  output += "TD {\n"
  output += "	border: 1px solid black;\n"
  output += "	padding: 0.5em;\n"
  output += "	background-color: #ddeeee;\n"
  output += "}\n"
  output += "\n"
  output += "CODE {\n"
  output += "	background-color: yellow;\n"
  output += "}\n"
  output += "\n"
  output += "TABLE.TAB1 {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 12pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  output += "}\n"
  output += "TABLE.TAB2 {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 11pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  output += "}\n"
  output += "TABLE.TAB3 {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  output += "}\n"
  output += "TABLE.TAB4 {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  output += "}\n"
  output += "TABLE.TAB5 {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  output += "}\n"
  output += "TABLE.TAB6 {\n"
  output += "	margin-top: 1em;\n"
  output += "        font-family: helvetica,arial,sans-serif;\n"
  output += "        font-size: 10pt;\n"
  output += "        font-weight: normal;\n"
  output += "	border-collapse: collapse;\n"
  file = open(styleSheet,"w")
  file.write(output)

def printHeader(linein):
  global styleSheet, inlineStyle
  print "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">"
  print "<html><head><title>" + getTitleText(linein) + "</title></head>"
  print"<!--  $Revision: 1.52 $ -->"
  print"<!--  $Date: 2008/10/11 22:04:09 $ -->"
  print"<!--  $Author: noel $ -->"
  try:
	file = open(styleSheet,"r") 
  except IOError, e:
	createCSS()
	file = open(styleSheet,"r")
  if (styleSheet != "" and inlineStyle == 0):
    print "<link href=\"" + styleSheet + "\" rel=\"stylesheet\" type=\"text/css\">"
  if (styleSheet != "" and inlineStyle == 1):
    print "<style type=\"text/css\">"
    csslinein = file.readline()
    while csslinein != "":
      print csslinein,
      csslinein = file.readline()
    file.close()
    print "</style></head>"
  print "<body>"

def printFirstLine(linein):
  print "<div class=\"DocTitle\">"
  print "<h1>" + stripTitleText(rstrip(lstrip(linein))) +"</h1>"
  print "</div>"
  print "<div class=\"MainPage\">"

def printFooter():
  global slides, div
  print "</div>"
  if (slides == 0 and div == 0):
          print "<div class=\"Footer\">"
	  print "<hr>"
	  print copyright
	  print "<br>"
	  print inputfile + "&nbsp&nbsp " + strftime("%Y/%m/%d %H:%M",localtime(time()))
          print "</div>"
  print "</body></html>"

def main():
  global showTitle
  getArgs()
  flatouline = []
  file = open(inputfile,"r")
  if (slides == 0):
    firstLine = beautifyLine(lstrip(rstrip(file.readline())))
    printHeader(firstLine)
    if (showTitle == 1):
      printFirstLine(firstLine)
      linein = beautifyLine(lstrip(rstrip(file.readline())))
    else:
      linein = firstLine
    while linein != "":
      processLine(linein)
      linein = file.readline()
    closeLevels()
  else:
    linein = beautifyLine(lstrip(rstrip(file.readline())))
    outline.append(linein)
    linein = lstrip(rstrip(file.readline()))
    while linein != "":
      outline.append("\t" + linein)
      linein = rstrip(file.readline())
    for i in range (0,len(outline)-1):
      flatten(i)
    printHeader(flatoutline[0])
    for i in range (0,len(flatoutline)):
      processLine(flatoutline[i])
    
  printFooter()
  file.close()

main()
    
vimoutliner/scripts/otl2html_autonumbered.css	[[[1
269
	/* copyright notice and filename */
body { 
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
}
	/* title at the top of the page */
H1 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 14pt;
        font-weight: bold;
        text-align: center;
        color: black;
	background-color: #ddddee;
	padding-top: 20px;
	padding-bottom: 20px;
}
H2 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        font-weight: bold;
        text-align: left;
        color: black;
}
H3 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        text-align: left;
        color: black;
}
H4 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        text-align: left;
        color: black;
}
H5 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        text-align: left;
        color: black;
}
	/* outline level spacing */
OL { 
        padding-bottom: 8pt;
	counter-reset: section;
	margin-left: 1.0em;
	padding-left:0 ;
}
OL LI { counter-increment: section; }
OL LI:before { content: counters(section, ".") ". "; }
	/* global heading settings */
LI { 
        font-family: helvetica,arial,sans-serif;
        color: black;
        font-weight: normal;
        list-style: lower-alpha;
	padding-top: 4px;
}
	/* level 1 heading overrides */
LI.L1 { 
        font-size: 12pt;
        font-weight: bold;
        list-style: none;
}
	/* level 2 heading overrides */
LI.L2 { 
        font-size: 10pt;
        font-weight: bold;
        list-style: none;
}
	/* level 3 heading overrides */
LI.L3 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 4 heading overrides */
LI.L4 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 5 heading overrides */
LI.L5 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 6 heading overrides */
LI.L6 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 7 heading overrides */
LI.L7 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 8 heading overrides */
LI.L8 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 9 heading overrides */
LI.L9 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 10 heading overrides */
LI.L10 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 11 heading overrides */
LI.L11 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 1 bullet heading overrides */
LI.LB1 { 
        font-size: 12pt;
        font-weight: bold;
        list-style: disc;
}
	/* level 2 bullet heading overrides */
LI.LB2 { 
        font-size: 10pt;
        font-weight: bold;
        list-style: disc;
}
	/* level 3 bullet heading overrides */
LI.LB3 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 4 bullet heading overrides */
LI.LB4 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 5 bullet heading overrides */
LI.LB5 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 6 bullet heading overrides */
LI.LB6 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 7 bullet heading overrides */
LI.LB7 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 1 numeric heading overrides */
LI.LN1 { 
        font-size: 12pt;
        font-weight: bold;
        list-style: decimal;
}
	/* level 2 numeric heading overrides */
LI.LN2 { 
        font-size: 10pt;
        font-weight: bold;
        list-style: decimal;
}
	/* level 3 numeric heading overrides */
LI.LN3 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 4 numeric heading overrides */
LI.LN4 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 5 numeric heading overrides */
LI.LN5 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 6 numeric heading overrides */
LI.LN6 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 7 numeric heading overrides */
LI.LN7 { 
        font-size: 10pt;
        list-style: decimal;
}
       	/* body text */
P {
        font-family: helvetica,arial,sans-serif;
        font-size: 9pt;
        font-weight: normal;
        color: black;
}
	/* preformatted text */
PRE { 
        font-family: fixed,monospace;
        font-size: 9pt;
        font-weight: normal;
        color: darkblue;
}

TABLE {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        font-weight: normal;
	border-collapse: collapse;
}

TH {
	border: 1px solid black;
	padding: 0.5em;
	background-color: #eeddee;
}

TD {
	border: 1px solid black;
	padding: 0.5em;
	background-color: #ddeeee;
}

CODE {
	background-color: yellow;
}

TABLE.TAB1 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB2 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 11pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB3 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB4 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB5 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB6 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
vimoutliner/scripts/otl2html_nnnnnn.css	[[[1
246
	/* copyright notice and filename */
body { 
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
}
	/* title at the top of the page */
H1 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 14pt;
        font-weight: bold;
        text-align: center;
        color: black;
	background-color: #ddddee;
	padding-top: 20px;
	padding-bottom: 20px;
}
H2 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        font-weight: bold;
        text-align: left;
        color: black;
}
H3 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        text-align: left;
        color: black;
}
H4 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        text-align: left;
        color: black;
}
H5 { 
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        text-align: left;
        color: black;
}
	/* outline level spacing */
OL { 
        margin-left: 1.0em;
        padding-left: 0;
        padding-bottom: 8pt;
}
	/* global heading settings */
LI { 
        font-family: helvetica,arial,sans-serif;
        color: black;
        font-weight: normal;
        list-style: lower-alpha;
	padding-top: 4px;
}
	/* level 1 heading overrides */
LI.L1 { 
        font-size: 12pt;
        font-weight: bold;
        list-style: none;
}
	/* level 2 heading overrides */
LI.L2 { 
        font-size: 10pt;
        font-weight: bold;
        list-style: none;
}
	/* level 3 heading overrides */
LI.L3 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 4 heading overrides */
LI.L4 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 5 heading overrides */
LI.L5 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 6 heading overrides */
LI.L6 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 7 heading overrides */
LI.L7 { 
        font-size: 10pt;
        list-style: none;
}
	/* level 1 bullet heading overrides */
LI.LB1 { 
        font-size: 12pt;
        font-weight: bold;
        list-style: disc;
}
	/* level 2 bullet heading overrides */
LI.LB2 { 
        font-size: 10pt;
        font-weight: bold;
        list-style: disc;
}
	/* level 3 bullet heading overrides */
LI.LB3 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 4 bullet heading overrides */
LI.LB4 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 5 bullet heading overrides */
LI.LB5 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 6 bullet heading overrides */
LI.LB6 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 7 bullet heading overrides */
LI.LB7 { 
        font-size: 10pt;
        list-style: disc;
}
	/* level 1 numeric heading overrides */
LI.LN1 { 
        font-size: 12pt;
        font-weight: bold;
        list-style: decimal;
}
	/* level 2 numeric heading overrides */
LI.LN2 { 
        font-size: 10pt;
        font-weight: bold;
        list-style: decimal;
}
	/* level 3 numeric heading overrides */
LI.LN3 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 4 numeric heading overrides */
LI.LN4 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 5 numeric heading overrides */
LI.LN5 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 6 numeric heading overrides */
LI.LN6 { 
        font-size: 10pt;
        list-style: decimal;
}
	/* level 7 numeric heading overrides */
LI.LN7 { 
        font-size: 10pt;
        list-style: decimal;
}
       	/* body text */
P {
        font-family: helvetica,arial,sans-serif;
        font-size: 9pt;
        font-weight: normal;
        color: darkgreen;
}
	/* preformatted text */
PRE { 
        font-family: fixed,monospace;
        font-size: 9pt;
        font-weight: normal;
        color: darkblue;
}

TABLE {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        font-weight: normal;
	border-collapse: collapse;
}

TH {
	border: 1px solid black;
	padding: 0.5em;
	background-color: #eeddee;
}

TD {
	border: 1px solid black;
	padding: 0.5em;
	background-color: #ddeeee;
}

CODE {
	background-color: yellow;
}

TABLE.TAB1 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 12pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB2 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 11pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB3 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB4 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB5 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
}
TABLE.TAB6 {
	margin-top: 1em;
        font-family: helvetica,arial,sans-serif;
        font-size: 10pt;
        font-weight: normal;
	border-collapse: collapse;
vimoutliner/scripts/otl2lyx.awk	[[[1
149
#!/usr/bin/gawk -f

# Copyright (C) 2007 by Steve Litt, all rights reserved.
# Licensed under the GNU General Public License, version 2.
# otl2lyx.awk version 0.1.1 pre-alpha
# 4/23/2007
# Fixed insertion of other environments at bodytext to bodytext
#  borders.
#
# USAGE: ./otl2lyx  level-environment-table-file  outline-file
#
# level-table-structure:
# 1: Top-level-environment-name
# 2: 2nd-level-environment-name
# 3: 3rd-level-environment-name
# 4: 4th-level-environment-name
# 5: 5th-level-environment-name
# 6: 6th-level-environment-name
# bodytext: environment-name-for-normal-text
#
# Example for a book:
# 1: Chapter       
# 2: Section        
# 3: Subsection    
# 4: Subsubsection 
# 5: Paragraph     
# 6: Subparagraph  
# 7: Garbage7       
# bodytext: Standard


BEGIN{
	FS=":[ \t]*"
	OFS="\x09"
	lastinbodytext=0
}

### BLOW OFF BLANKS OUTSIDE OF BODY TEXT
$0~/^[ \t]*$/ && inbodytext==0{
	next
}

### FILL THE ENVIRONMENTS ARRAY ###
ARGIND==1{
	FS=":[ \t]*";
	sub(/[ \t]*$/,"",$2);
	environments[$1] = $2;
	next;
}

FNR==101{
	for(i in environments) print "level=" i ", string=" environments[i];
}

### FIELD SEPARATOR IS TAB ON THE OUTLINE FILE ###
{FS="\x09"; }

### INCREMENT OUTLINE ID NUMBER
{ol_id++}

### CALCULATE LEVEL ###
{
	for(i=1;i<=NF;i++)
		if($i == ""){
		 } else {
			break
		}
	this["level"] = i
	if(ol_id == ol_id_first)
		this["level"]--
}

### FIGURE TEXT ###
{
	this["text"] = ""
	for(i=1;i<=NF;i++){
		if($i != ""){
			if(this["text"] == ""){
				this["text"] = this["text"] $i
			} else {
				this["text"] = this["text"] " " $i
			}
		}
	}
	sub(/^[ \t]+/, "", this["text"]);
	sub(/[ \t]+$/, "", this["text"]);
}

### SET BODYTEXT FLAGS ###
{ inbodytext = 0; newbodytext = 0; endbodytext = 0; btblankline=0; }


this["text"] ~ /^:[ \t]+[^ \t]/{
	inbodytext = 1;
	sub(/^:[ \t]*/, "", this["text"]);
	this["text"] = this["text"] " ";
}

this["text"] == "" || this["text"] == ":"{
	this["text"] = "";
	inbodytext = lastinbodytext;
	if(inbodytext == 1){
		endbodytext = 1;
		newbodytext = 1;
		btblankline = 1;
	}
}

lastinbodytext == 1 && inbodytext == 0{
	endbodytext = 1;
}

lastinbodytext == 0 && inbodytext == 1{
	newbodytext = 1;
}

{ lastinbodytext = inbodytext; }



### QUOTE SINGLE BACKSLASHES FOR LATEX ###
{gsub(/\\/,"\r\\backslash\r", this["text"]);}

### PRINT LYX CONTENT ###

endbodytext == 1{
	print "\\end_layout"
	print ""
}
newbodytext == 1{
	print "\\begin_layout " environments["bodytext"]
}
inbodytext == 1{
	if(btblankline == 0) print this["text"]
}

inbodytext == 0{
	print "\\begin_layout " environments[this["level"]]
	print this["text"]
	print "\\end_layout"
	print ""
}

END{
	if(inbodytext == 1){
	print "\\end_layout"
	print ""
	}
}
vimoutliner/scripts/otl2ooimpress.py	[[[1
263
#!/usr/bin/python
# otl2ooimpress.py
# needs otl2ooimpress.sh to work in an automated way
#############################################################################
#
#  Tool for Vim Outliner files to Open Office Impress files.
#  Copyright (C) 2003 by Noel Henson, all rights reserved.
#
#       This tool is free software; you can redistribute it and/or
#       modify it under the terms of the GNU Library General Public
#       License as published by the Free Software Foundation; either
#       version 2 of the License, or (at your option) any later version.
#
#       This library is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#       Lesser General Public License for more details.
#
#       You should have received a copy of the GNU Library General Public
#       License along with this library; if not, write to:
#
#       Free Software Foundation, Inc.
#       59 Temple Place, Suite 330
#       Boston, MA 02111-1307  USA
#
#############################################################################
# ALPHA VERSION!!!
# $Revision: 1.3 $
# $Date: 2003/12/01 20:22:18 $
# $Author: noel $
# $Source: /home/noel/apps/otl2ooimpress/RCS/otl2ooimpress.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program accepts VO outline files and converts them
#	to the zipped XML files required by Open Office Impress.
#
#	10 outline levels are supported.  These loosely correspond to the
#	HTML H1 through H9 tags.
#


###########################################################################
# include whatever mdules we need

import sys
from string import *
from time import *

###########################################################################
# global variables

level = 0
inputFile = ""
outline = []
flatoutline = []
pageNumber = 0
inPage = 0
debug = 0

###########################################################################
# function definitions

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
   print
   print "Usage:"
   print "otl2ooimpress.py [options] inputfile > outputfile"
   print "Options"
   print "    -v              Print version (RCS) information."
   print "output is on STDOUT"
   print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
   print
   print "RCS"
   print " $Revision: 1.3 $"
   print " $Date: 2003/12/01 20:22:18 $"
   print " $Author: noel $"
   print " $Source: /home/noel/apps/otl2ooimpress/RCS/otl2ooimpress.py,v $"
   print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
  global inputfile, debug
  if (len(sys.argv) == 1): 
    showUsage()
    sys.exit()()
  else:
    for i in range(len(sys.argv)):
      if (i != 0):
        if   (sys.argv[i] == "-d"): debug = 1	# test for debug flag
        elif (sys.argv[i] == "-?"):		# test for help flag
	  showUsage()				# show the help
	  sys.exit()				# exit
        elif (sys.argv[i] == "--help"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-h"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-v"):
	  showVersion()
	  sys.exit()
	elif (sys.argv[i][0] == "-"):
	  print "Error!  Unknown option.  Aborting"
	  sys.exit()
	else: 					# get the input file name
          inputfile = sys.argv[i]

# getLineLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  return(n+1)					# return the count + 1 (for level)

# getLineTextLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineTextLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  n = n + count(linein," ",0,x)			# count the spaces
  return(n+1)					# return the count + 1 (for level)
    
# colonStrip(line)
# stip a leading ':', if it exists
# input: line
# output: returns a string with a stipped ':'

def colonStrip(line):
	if (line[0] == ":"): return lstrip(line[1:])
        else: return line

# processLine
# process a single line
# input: linein - a single line that may or may not have tabs at the beginning
#        level - an integer between 1 and 9 that show the current level
# 	          (not to be confused with the level of the current line)
# output: through standard out

def processLine(linein):
  global inPage, pageNumber
  if (lstrip(linein) == ""): 
	print 
  	return
  if (getLineLevel(linein) == 1):
	  if (inPage==1): 
		  print '</draw:text-box></draw:page>'
		  inPage = 0
	  pageNumber += 1
	  outstring = '<draw:page draw:name="'
	  outstring += 'page'
	  outstring += str(pageNumber)
	  outstring += '" draw:style-name="dp1" draw:id="1" draw:master-page-name="Default" presentation:presentation-page-layout-name="AL1T0">'
	  print outstring 
	  outstring  = '<draw:text-box presentation:style-name="pr1" draw:layer="layout" svg:width="23.911cm" svg:height="3.508cm" svg:x="2.057cm" svg:y="1.0cm" presentation:class="title">'
	  print outstring 
	  outstring = '<text:p text:style-name="P1">'
	  outstring += lstrip(linein)
	  outstring += "</text:p></draw:text-box>"
	  print outstring 
	  outstring = '<draw:text-box presentation:style-name="pr1" draw:layer="layout" svg:width="23.911cm" svg:height="3.508cm" svg:x="2.057cm" svg:y="5.38cm" presentation:class="subtitle">'
	  print outstring 
	  inPage = 1
  else:
	  outstring = '<text:p text:style-name="P1">'
	  outstring += lstrip(linein)
	  outstring += '</text:p>'
	  print outstring 
      
# flatten
# Flatten a subsection of an outline.  The index passed is the outline section
# title.  All sublevels that are only one level deeper are indcluded in the current
# subsection.  Then there is a recursion for those items listed in the subsection.
# Exits when the next line to be processed is of the same or lower outline level.
#  (lower means shallower)
# input: idx - the index into the outline.  The indexed line is the title.
# output: adds reformatted lines to flatoutline[]

def flatten(idx):
  if (outline[idx] == ""):
    return
  if (len(outline) <= idx):
    return
  titleline = outline[idx]
  titlelevel = getLineLevel(titleline)
  if (getLineLevel(outline[idx+1]) > titlelevel):
    if (titleline[titlelevel-1] != " "):
      flatoutline.append(lstrip(titleline))
    exitflag = 0
    while (exitflag == 0):
      if (idx < len(outline)-1):
        idx = idx + 1
        currlevel = getLineLevel(outline[idx])
        if (currlevel == titlelevel + 1):
          if (currlevel == find(outline[idx]," ") +1):
            flatoutline.append("\t " + lstrip(outline[idx]))
          else:
            flatoutline.append("\t" + lstrip(outline[idx]))
        elif (currlevel <= titlelevel):
          exitflag = 1
      else:
        exitflag = 1
  level =  titlelevel
  return

def printHeader(linein):
  print'<?xml version="1.0" encoding="UTF-8"?>'
  print'<!DOCTYPE office:document-content PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "office.dtd">'
  print'<office:document-content xmlns:office="http://openoffice.org/2000/office" xmlns:style="http://openoffice.org/2000/style" xmlns:text="http://openoffice.org/2000/text" xmlns:table="http://openoffice.org/2000/table" xmlns:draw="http://openoffice.org/2000/drawing" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:number="http://openoffice.org/2000/datastyle" xmlns:presentation="http://openoffice.org/2000/presentation" xmlns:svg="http://www.w3.org/2000/svg" xmlns:chart="http://openoffice.org/2000/chart" xmlns:dr3d="http://openoffice.org/2000/dr3d" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="http://openoffice.org/2000/form" xmlns:script="http://openoffice.org/2000/script" office:class="presentation" office:version="1.0">'
  print'<office:script/>'
  print'<office:body>'

def printFooter():
  print '</draw:text-box></draw:page>'
  print'</office:body>'

def main():
  getArgs()
  flatouline = []
  file = open(inputfile,"r")
  linein = lstrip(rstrip(file.readline()))
  outline.append(linein)
  linein = lstrip(rstrip(file.readline()))
  while linein != "":
    outline.append("\t" + linein)
    linein = rstrip(file.readline())
  for i in range (0,len(outline)-1):
    flatten(i)

  printHeader(flatoutline[0])
  for i in range (0,len(flatoutline)):
    processLine(flatoutline[i])
  printFooter()

  file.close()

main()
    
vimoutliner/scripts/otl2ooimpress.sh	[[[1
37
#!/bin/bash
# otl2ooimpress.sh
# needs otl2ooimpress.py to work at all
#############################################################################
#
#  Tool for Vim Outliner files to Open Office Impress files.
#  Copyright (C) 2003 by Noel Henson, all rights reserved.
#
#       This tool is free software; you can redistribute it and/or
#       modify it under the terms of the GNU Library General Public
#       License as published by the Free Software Foundation; either
#       version 2 of the License, or (at your option) any later version.
#
#       This library is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#       Lesser General Public License for more details.
#
#       You should have received a copy of the GNU Library General Public
#       License along with this library; if not, write to:
#
#       Free Software Foundation, Inc.
#       59 Temple Place, Suite 330
#       Boston, MA 02111-1307  USA
#
#############################################################################

# Path to otl2ooimpress.py
MYPATH=$HOME/bin
# Path to rm
RMPATH=/bin
# Path to zip
ZIPPATH=/usr/bin

$MYPATH/otl2ooimpress.py $1 > content.xml
$ZIPPATH/zip $1.sxi content.xml
$RMPATH/rm content.xml
vimoutliner/scripts/otl2table.py	[[[1
222
#!/usr/bin/python
# otl2table.py
# convert a tab-formatted outline from VIM to tab-delimited table
#
# Copyright (c) 2004 Noel Henson All rights reserved
#
# ALPHA VERSION!!!
# $Revision: 1.2 $
# $Date: 2005/09/25 14:24:28 $
# $Author: noel $
# $Source: /home/noel/active/otl2table/RCS/otl2table.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program accepts text outline files and converts them
#	the tab-delimited text tables.
#	This:
#		Test
#			Dog
#				Barks
#				Howls
#			Cat
#				Meows
#				Yowls
#	Becomes this:
#		Test	Dog	Barks
#		Test	Dog	Howls
#		Test	Cat	Meows
#		Test	Cat	Yowls
#
#	This will make searching for groups of data and report generation easier.
#


###########################################################################
# include whatever mdules we need

import sys
from string import *
#from time import *

###########################################################################
# global variables

level = 0
inputFile = ""
formatMode = "tab"
noTrailing = 0
columns = []

###########################################################################
# function definitions

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
   print
   print "Usage:"
   print "otl2table.py [options] inputfile > outputfile"
   print "Options"
   print "    -n              Don't include trailing columns."
   print "    -t type        Specify field separator type."
   print "                   Types:"
   print "                      tab - separate fields with tabs (default)"
   print "                      csv - separate fields with ,"
   print "                      qcsv - separate fields with \",\""
   print "                      bullets - uses HTML tags <ul> and <li>"
   print "    -v              Print version (RCS) information."
   print "output is on STDOUT"
   print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
   print
   print "RCS"
   print " $Revision: 1.2 $"
   print " $Date: 2005/09/25 14:24:28 $"
   print " $Author: noel $"
   print " $Source: /home/noel/active/otl2table/RCS/otl2table.py,v $"
   print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
  global inputfile, debug, noTrailing, formatMode
  if (len(sys.argv) == 1): 
    showUsage()
    sys.exit()()
  else:
    for i in range(len(sys.argv)):
      if (i != 0):
        if   (sys.argv[i] == "-d"): debug = 1		# test for debug flag
        if   (sys.argv[i] == "-n"): noTrailing = 1	# test for noTrailing flag
        elif (sys.argv[i] == "-?"):			# test for help flag
	  showUsage()					# show the help
	  sys.exit()					# exit
        elif (sys.argv[i] == "--help"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-h"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-v"):
	  showVersion()
	  sys.exit()
        elif (sys.argv[i] == "-t"):		# test for the type flag
	  formatMode = sys.argv[i+1]		# get the type
	  i = i + 1				# increment the pointer
	elif (sys.argv[i][0] == "-"):
	  print "Error!  Unknown option.  Aborting"
	  sys.exit()
	else: 					# get the input file name
          inputfile = sys.argv[i]

# getLineLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  return(n+1)					# return the count + 1 (for level)

# getLineTextLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineTextLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  n = n + count(linein," ",0,x)			# count the spaces
  return(n+1)					# return the count + 1 (for level)
    
# closeLevels
# print the assembled line
# input: columns - an array of 10 lines (for 10 levels)
#        level - an integer between 1 and 9 that show the current level
# 	          (not to be confused with the level of the current line)
# 	 noTrailing - don't print trailing, empty columns
# output: through standard out

def closeLevels():
  global level,columns,noTrailing,formatMode
  if noTrailing == 1 :
	  colcount = level
  else:
	   colcount = 10
  if formatMode == "tab":
	  for i in range(1,colcount+1):
		  print columns[i] + "\t",
	  print
  elif formatMode == "csv":
	  output = ""
	  for i in range(1,colcount):
		  output = output + columns[i] + ","
	  output = output + columns[colcount]
	  print output
  elif formatMode == "qcsv":
	  output = "\""
	  for i in range(1,colcount):
		  output = output + columns[i] + "\",\""
	  output = output + columns[colcount] + "\""
	  print output
  for i in range(level+1,10):
	  columns[i] = ""


# processLine
# process a single line
# input: linein - a single line that may or may not have tabs at the beginning
#        format - a string indicating the mode to use for formatting
#        level - an integer between 1 and 9 that show the current level
# 	          (not to be confused with the level of the current line)
# output: through standard out

def processLine(linein):
  global level, noTrailing, columns
  if (lstrip(linein) == ""): return
  lineLevel = getLineLevel(linein)
  if (lineLevel > level):
	  columns[lineLevel] = lstrip(rstrip(linein))
	  level = lineLevel
  elif (lineLevel == level):
	  closeLevels()
	  columns[lineLevel] = lstrip(rstrip(linein))
  else:
	  closeLevels()
	  level = lineLevel
	  columns[lineLevel] = lstrip(rstrip(linein))
	  
      
def main():
  global columns
  getArgs()
  file = open(inputfile,"r")
  for i in range(11):
	  columns.append("")
  linein = lstrip(rstrip(file.readline()))
  while linein != "":
    processLine(linein)
    linein = file.readline()
  closeLevels()
  file.close()

main()
    
vimoutliner/scripts/otl2tags.py	[[[1
756
#!/usr/bin/python
# otl2tags.py
# Convert an OTL file to any tags-based file using config user-
# definable configuration files. HTML, OPML, XML, LATEX and
# many, many others should be easily supportables.
#
# Copyright (c) 2005-2010 Noel Henson All rights reserved
#
# $Revision: 1.15 $
# $Date: 2010/02/12 05:31:17 $
# $Author: noel $
# $Source: /home/noel/active/otl2tags/RCS/otl2tags.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program accepts text outline files in Vim Outliners .otl format
#	and converts them to a tags-based equivalent

###########################################################################
# Change Log
#
#	$Log: otl2tags.py,v $
#	Revision 1.15  2010/02/12 05:31:17  noel
#	Added test for empty  escapes setting.
#
#	Revision 1.14  2010/01/31 06:37:41  noel
#	Added character escapes.
#	Added single-URL embedding.
#	TODO:
#	Add image handling
#	Add multiple URLs per line (if not using url-attr)
#
#	Revision 1.13  2010/01/28 07:20:02  noel
#	Started adding support for embedded objects like links and images.
#
#	Revision 1.12  2010/01/27 20:10:10  noel
#	Removed a debug print.
#
#	Revision 1.11  2010/01/26 21:04:45  noel
#	Fixed a few bugs concering blocks.
#	Added support for the other objects including tables.
#
#	Revision 1.10  2010/01/26 07:07:37  noel
#	Major restructuring and refactoring.
#	Not quite ready yet; only a few objects implemented.
#
#	Revision 1.9  2010/01/23 23:17:59  noel
#	Minor edits before major refactoring.
#
#	Revision 1.8  2009/02/25 20:19:11  noel
#	Added error message prints to stderr.
#	Added more debug info.
#
#	Revision 1.7  2008/09/07 14:36:57  noel
#	Fixed a bug that caused either exports to GraphViz to work and FreeMind
#	to fail and vice-versa. Had to do with pushing the initial node number i
#	the parent stack.
#	To this end and new flag was added: first-is-node. When 'true' the program
#	properly indents the file to show the first line of the file is the 0th
#	node even if it shares the same indent level as the rest of the top-most
#	nodes.
#
#	Revision 1.6  2008/09/05 21:46:33  noel
#	Added an initial parent line number pop for the title line to
#	fix a bug in generating graphviz files.
#
#	Revision 1.5  2008/09/05 18:50:48  noel
#	Fixed recursion.
#	Modified the config file to support nexted and unnested nodes.
#
#	Revision 1.4  2008/09/04 20:08:28  noel
#	Minor bug fixes and added two more variables for replacement.
#
#	Revision 1.3  2005/10/18 16:01:15  noel
#	First completely working version.
#
#	Revision 1.2  2005/10/18 10:32:28  noel
#	Works except for leaving levels and some other minutia.
#
#	Revision 1.1  2005/10/04 13:08:21  noel
#	Initial revision
#

###########################################################################
# include whatever mdules we need

import sys
from string import *
from ConfigParser import *
from re import *

###########################################################################
# global variables

config = ConfigParser()	# configuration
linecount = 0		# outline size in lines
parents = []		# parent stack, (linenum,enum) enum is an order numer
v = {}			# variable dictionary for substitution
outline = []		# line tuples (value,indent)
output = []		# output outline
escapeDict = {}		# dictionary of character escape codes

###########################################################################
# arugment, help and debug functions

# usage
# print debug statements
# input: string
# output: string printed to standard out

def dprint(*vals):
	global debug
	if debug != 0: 
		print >> sys.stderr, vals

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
	 print
	 print "Usage:"
	 print "otl2table.py [options] inputfile"
	 print "Options"
	 print "    -c             config-file"
	 print "    -d             debug"
	 print "    --help         show help"
	 print "    -v             Print version (RCS) information."
	 print "output filenames are based on the input file name and the config file"
	 print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
	 print
	 print "RCS"
	 print " $Revision: 1.15 $"
	 print " $Date: 2010/02/12 05:31:17 $"
	 print " $Author: noel $"
	 print " $Source: /home/noel/active/otl2tags/RCS/otl2tags.py,v $"
	 print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
	global inputfile, debug, noTrailing, formatMode, config
	if (len(sys.argv) == 1): 
	  showUsage()
	  sys.exit()()
	else:
	  for i in range(len(sys.argv)):
	    if (i != 0):
	      if (sys.argv[i] == "-c"):	                	# test for the type flag
	         config.read(sys.argv[i+1])      		# read the config
	         i = i + 1			        	# increment the pointer
	      elif (sys.argv[i] == "-d"):
	         debug = 1
	      elif (sys.argv[i] == "-?"):			# test for help flag
	         showUsage()					# show the help
	         sys.exit()					# exit
	      elif (sys.argv[i] == "--help"):
	         showUsage()
	         sys.exit()
	      elif (sys.argv[i] == "-h"):
	         showUsage()
	         sys.exit()
	      elif (sys.argv[i] == "-v"):
	         showVersion()
	         sys.exit()
	      elif (sys.argv[i][0] == "-"):
	         print "Error!  Unknown option.  Aborting"
	         sys.exit()
	      else: 					       # get the input file name
	        inputfile = sys.argv[i]

# printConfig
# Debugging routine to print the parsed configuration file
# input: none
# output: configuration data printed to console

def printConfig():
  global config
  print >> sys.stderr, "Config ---------------------------------------------"
  list = config.sections()
  for i in range(len(list)):
	  print >> sys.stderr
	  print >> sys.stderr, list[i]
	  for x in config.options(list[i]):
	    if (x !="name") and (x !="__name__"):
	      print >> sys.stderr, x,":", config.get(list[i],x)
  print >> sys.stderr, "----------------------------------------------------"
  print >> sys.stderr  

###########################################################################
# low-level outline processing functions

# indentLevel
# get the level of the line specified by linenum
# input: line
# output: returns the level number, 1 is the lowest

def indentLevel(line):
	strstart = line.lstrip()		# find the start of text in line
	x = find(line,strstart)			# find the text index in the line
	n = count(line,"\t",0,x)			# count the tabs
	n = n + count(line," ",0,x)			# count the spaces
	return(n+1)					# return the count + 1 (for level)

# stripMarker
# return a line without its marker and leading and trailing whitespace
# input: line, marker
# output: stripped line

def stripMarker(line,marker):
	return strip(lstrip(line,marker))

# getLineType
# return the type of the line specified by linenum
# input: line
# output: returns text, usertext, table, preftext, etc.

def getLineType(line):
	if (line[0] == ':'): return 'text'
	elif (line[0] == ';'): return 'preftext'
	elif (line[0] == '>'): return 'usertext'
	elif (line[0] == '<'): return 'userpreftext'
	elif (line[0] == '|'): return 'table'
	elif (line[0] == '-'): return 'bulletheading'
	elif (line[0] == '+'): return 'numberheading'
#	elif (line[0] == '['): return 'checkboxheading'
	elif (line[0] == ''): return 'blank'
	else: return 'heading'

# getChildren
# return a list of line numbers for children of the passed line number
# input: linenum
# output: a (possibly) empty list of children

def getChildren(linenum):
	global outline, linecount

	children = []
	mylevel = outline[linenum][1]
	childlevel = mylevel + 1
	linenum = linenum + 1
	while (linenum < linecount) and (outline[linenum][1] > mylevel):
		if (outline[linenum][1] == childlevel):
			children.append(linenum)
		linenum = linenum + 1
	return children

# subTags
# substitute variables in output expressions
# input: section - section from config
# input: type - object type (to look up in config)
# input:  - substitution item (by name) from config array
# output: string - the substitution expression with variables inserted

def subTags(section,type):
	global config, v, parents

	varlist = v.keys()
	pattern = config.get(section,type)
	if len(parents) > 0:
		v["%p"] = str(parents[len(parents)-1])

	for var in varlist:
		x = ""
		x = var
		y = ""
		y = v.get(var)
		pattern = sub(x,y,pattern)
	return pattern

#getBlock
#return a list of lines that match a mark (like : or ;)
#input: line number
#output: list of stripped lines

def getBlock(linenum,marker):
	global outline, linecount

	lines = []
	line = outline[linenum][0]
	while line[0] == marker:
		lines.append(stripMarker(line,marker))
		linenum = linenum + 1
		if linenum == linecount: break	
		line = outline[linenum][0]
	return lines

#getUnstrippedBlock
#return a list of lines that match a mark (like : or ;)
#input: line number
#output: list of stripped lines

def getUnstrippedBlock(linenum,marker):
	global outline, linecount

	lines = []
	line = outline[linenum][0]
	while line[0] == marker:
		lines.append(line)
		linenum = linenum + 1
		if linenum == linecount: break	
		line = outline[linenum][0]
	return lines

###########################################################################
# embedded object processing functions

# buildEscapes
# construct the dictionary for escaping special characters
# intput: config:escapes
# output: filled escapes dictionary

def buildEscapes():
	escapes = config.get("Document","escapes")
	if len(escapes):
		list = escapes.split(" ")
		for pair in list:
			key,value = pair.split(",")
			escapeDict[key]=value

# charEscape
# escape special characters
# input: line
# output: modified line
def charEscape(line):
	return "".join(escapeDict.get(c,c) for c in line)

# getURL
# if there is a url, [url text], return the extracted link, url and value
# input: line
# output: link,url,text

def getURL(line):
	tags = []
	for tag in line.split("]"):
		tags.append(tag.split("["))
	
	for tag in tags: 
		if len(tag) > 1 and search(" ",tag[1]):
			link = tag[1]

			url,text = link.split(" ",1)
			link = "["+tag[1]+"]"
			return link,url,text


#		return link.group(0),url,text
#	else:
#		return None,None,None
	return None,None,None

def handleURL(line):
	link,url,text = getURL(line)
	if link == None: return replace(line,"[url]","")


	v["%u"] = url
	v["%v"] = text

	text = subTags("URLs","url")
	line = replace(line,link,text)

	url = subTags("URLs","url-attr")
	line = replace(line,"[url]",url)

	return line

###########################################################################
# outline header processing functions

# all outline object processors accept and output the following:
# input: linenum, enum
# output: print the output for each object

def handleHeading(linenum,enum):
	global outline, parents

	line = outline[linenum][0]

# url handling
# extract url data from line
# replace url object in line
# subTags line
# replace url attribute marker

	v["%%"] = line
	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	children = getChildren(linenum)
	if enum == 1:
		output.append(subTags("Headings","before-headings"))
	if children:
		output.append(subTags("Headings","branch-heading"))
		parents.append([linenum,enum])
		handleObjects(children)
		parents.pop()
		output.append(subTags("Headings","after-headings"))
	else:
		output.append(subTags("Headings","leaf-heading"))

def handleBulleted(linenum,enum):
	global outline, parents

	v["%%"] = outline[linenum][0]
	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	children = getChildren(linenum)
	if enum == 1:
		output.append(subTags("Headings","before-bulleted-headings"))
	if children:
		output.append(subTags("Headings","bulleted-branch-heading"))
		parents.append([linenum,enum])
		handleObjects(children)
		parents.pop()
		output.append(subTags("Headings","after-bulleted-headings"))
	else:
		output.append(subTags("Headings","bulleted-leaf-heading"))

def handleNumbered(linenum,enum):
	global outline, parents

	v["%%"] = outline[linenum][0]
	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	children = getChildren(linenum)
	if enum == 1:
		output.append(subTags("Headings","before-numbered-headings"))
	if children:
		output.append(subTags("Headings","numbered-branch-heading"))
		parents.append([linenum,enum])
		handleObjects(children)
		parents.pop()
		output.append(subTags("Headings","after-numbered-headings"))
	else:
		output.append(subTags("Headings","numbered-leaf-heading"))

###########################################################################
# outline text block processing functions

# all outline object processors accept and output the following:
# input: linenum, enum
# output: print the output for each object

def handleText(linenum,enum):
	global outline, parents

	if enum != 1: return # only execute for first call

	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	list = getBlock(linenum,':')
	output.append(subTags("Text","before"))
	lines = ""
	for line in list:
		if line == "":
			lines = lines + config.get("Text","paragraph-sep")
		else:
			lines = lines + line + config.get("Text","line-sep")
	v["%%"] = lines
	output.append(subTags("Text","text"))
	output.append(subTags("Text","after"))

def handleUserText(linenum,enum):
	global outline, parents

	if enum != 1: return # only execute for first call

	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	list = getBlock(linenum,'>')
	output.append(subTags("UserText","before"))
	lines = ""
	for line in list:
		if line == "":
			lines = lines + config.get("UserText","paragraph-sep")
		else:
			lines = lines + line + config.get("UserText","line-sep")
	v["%%"] = strip(lines) # remove a possible extra separator
	output.append(subTags("UserText","text"))
	output.append(subTags("UserText","after"))

def handlePrefText(linenum,enum):
	global outline, parents

	if enum != 1: return # only execute for first call

	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	list = getBlock(linenum,';')
	output.append(subTags("PrefText","before"))
	lines = ""
	for line in list:
		if line == "":
			lines = lines + config.get("PrefText","paragraph-sep")
		else:
			lines = lines + line + config.get("PrefText","line-sep")
	v["%%"] = strip(lines) # remove a possible extra separator
	output.append(subTags("PrefText","text"))
	output.append(subTags("PrefText","after"))

def handleUserPrefText(linenum,enum):
	global outline, parents

	if enum != 1: return # only execute for first call

	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	list = getBlock(linenum,'<')
	output.append(subTags("UserPrefText","before"))
	lines = ""
	for line in list:
		if line == "":
			lines = lines + config.get("UserPrefText","paragraph-sep")
		else:
			lines = lines + line + config.get("UserPrefText","line-sep")
	v["%%"] = strip(lines) # remove a possible extra separator
	output.append(subTags("UserPrefText","text"))
	output.append(subTags("UserPrefText","after"))

###########################################################################
# outline table processing functions

# isAlignRight
# return flag
# input: col, a string

def isAlignRight(col):
  l = len(col)
  if (col[0:2] == "  ") and (col[l-2:l] != "  "): return 1
  else: return 0

# isAlignLeft
# return flag
# input: col, a string

def isAlignLeft(col):
  l = len(col)
  if (col[0:2] != "  ") and (col[l-2:l] == "  "): return 1
  else: return 0

# isAlignCenter
# return flag
# input: col, a string

def isAlignCenter(col):
  l = len(col)
  if (col[0:2] == "  ") and (col[l-2:l] == "  "): return 1
  else: return 0

# handleHeaderRow
# process a non-header table row
# input: row
# output: print the output for each object

def handleHeaderRow(row):
	global outline, parents

	row = lstrip(rstrip(row,"|"),"|")
	columns = row.split("|")
	output.append(subTags("Tables","before-table-header"))
	for col in columns:
		v["%%"] = strip(col)
		if isAlignCenter: output.append(subTags("Tables","table-header-column-center"))
		elif isAlignCenter: output.append(subTags("Tables","table-header-column-center"))
		elif isAlignCenter: output.append(subTags("Tables","table-header-column-center"))
		else: output.append(subTags("Tables","table-header-column"))
	output.append(subTags("Tables","after-table-header"))

# handleRow
# process a non-header table row
# input: row
# output: print the output for each object

def handleRow(row):
	global outline, parents

	if row[0:2] == "||":
		handleHeaderRow(row)
		return
	row = lstrip(rstrip(row,"|"),"|")
	columns = row.split("|")
	output.append(subTags("Tables","before-table-row"))
	for col in columns:
		v["%%"] = strip(col)
		if isAlignCenter: output.append(subTags("Tables","table-column-center"))
		elif isAlignLeft: output.append(subTags("Tables","table-column-left"))
		elif isAlignRight: output.append(subTags("Tables","table-column-right"))
		else: output.append(subTags("Tables","table-column"))
	output.append(subTags("Tables","after-table-row"))

# handleTable
# process a table
# input: linenum, enum
# output: print the output for each object

def handleTable(linenum,enum):
	global outline, parents

	if enum != 1: return # only execute for first call

	v["%l"] = str(outline[linenum][1])
	v["%n"] = str(linenum)
	v["%c"] = str(enum)
	list = getUnstrippedBlock(linenum,'|')
	output.append(subTags("Tables","before"))
	for row in list:
		handleRow(row)
	output.append(subTags("Tables","after"))

###########################################################################
# outline wrapper processing functions

# addPreamble
# create the 'header' for the output document
# input: globals
# output: standard out

def addPreamble():
	global outline, v

	v["%%"] = ""
	output.append(subTags("Document","preamble"))

# addPostamble
# create the 'header' for the output document
# input: globals
# output: standard out

def addPostamble():
	global outline, v

	v["%%"] = ""
	output.append(subTags("Document","postamble"))


###########################################################################
# outline tree fuctions

# handleObject
# take an object and invoke the appropriate fuction to precess it
# input: linenum, enum (enum is the child order number of a parent)
# output: print the output of a object

def handleObject(linenum,enum):
	global outline, linecount

	obj = getLineType(outline[linenum][0])
	if   obj == 'heading': handleHeading(linenum,enum)
	elif obj == 'bulled': handleBulleted(linenum,enum)
	elif obj == 'numbered': handleNumbered(linenum,enum)
	elif obj == 'text': handleText(linenum,enum)
	elif obj == 'usertext': handleUserText(linenum,enum)
	elif obj == 'preftext': handlePrefText(linenum,enum)
	elif obj == 'userpreftext': handleUserPrefText(linenum,enum)
	elif obj == 'table': handleTable(linenum,enum)
	else:
		print
		print "Error: unknown line type @ ",linenum
		sys.exit(1)

# handleObjects
# take an object list and invoke the appropriate fuctions to precess it
# input: linenum
# output: print the output of a object

def handleObjects(objs):

	for i in range(len(objs)):
		handleObject(objs[i],i+1)

###########################################################################
# file functions

# readFile
# read the selected file into lines[]
# input: filename to be loaded
# output: a loaded-up lines[]

def readFile(inputfile):
	global outline, linecount, config
	lasttype = ""
	file = open(inputfile,"r")
	linein = file.readline()

	while linein != "":
		indent = indentLevel(linein)
		line = strip(linein)
		line = charEscape(line)
		outline.append([line,indent])
		linein = file.readline()

	file.close

	outline[0][1] = 0	# set the first line to level 0

	linecount = len(outline)

###########################################################################
# Main Program Loop

def main():
	global outline, inputfile, linecount

	# get the arguments
	getArgs()

	# constuct the escapes dictionary
	buildEscapes()

	# read the input file
	readFile(inputfile)
	
	# get the title
	v["%t"] = strip(outline[0][0])

	# construct the initial data
	# parsing headings, text and tables
	# but not parsing links or images
	addPreamble()
	if config.get("Document","first-is-node") == "true":
		objs=[0]
	else:
		objs=getChildren(0)
	handleObjects(objs)
	addPostamble()

	# handle embeded objects
	# parsing and constructing links, images and other embedded objects
	for i in range(len(output)):	
		output[i]=handleURL(output[i])

	# output the final data
	for line in output:
		if line.strip()!="": print line.strip()

main()
vimoutliner/scripts/otl2tags_freemind.conf	[[[1
96
# FreeMind configuration file
# Variables:
#    %% - data
#    %l - outline level
#    %t - document title (the first line of the document)
#    %n - line number (document title is 0)
#    %N - line number of first line of block (for text blocks)
#    %p - parent line number
#    %c - my child number, a heading's order number under it's parent
#    %u - URL link field: http://www.a.com in [http://www.a.com link to me]
#    %v - URL text field: 'link to me'  in [http://www.a.com link to me]
#
# Special Markers
#    [url] - a marker for an optional url/link attribute: url-attr
#
# Flags
#    first-is-node 
#        true for output to programs like FreeMind and GraphViz
#        where the first line of the file is the top-most node

[Document]

escapes: &,&amp; ",&quot; ',&apos; >,&gt; <,&lt;
first-is-node: true
preamble: <map version="0.8.0">
postamble: </map>

[Headings]

before-headings: 
branch-heading: <node [url] TEXT="%%">
leaf-heading: <node [url] TEXT="%%"/>
after-headings: </node>

before-bulleted-headings:
bulleted-branch-heading: <node [url] TEXT="*%%">
bulleted-leaf-heading: <node [url] TEXT="*%%"/>
after-bulleted-headings: </node>

before-numbered-headings:
numbered-branch-heading: <node [url] TEXT="%c %%">
numbered-leaf-heading: <node [url] TEXT="%c %%"/>
after-numbered-headings: </node>

[Text]

paragraph-sep: &#xa;
line-sep: &#xa;
before:
text: <node TEXT="%%"/>
after:

[PrefText]

paragraph-sep: \n
line-sep: \n
before: <node TEXT="<html><body><pre>
text: %%
after: </pre></body></html>"></node>

[UserPrefText]

user-pref-paragraph-sep:
before-user-preftext:
user-preftext:
after-user-preftext:

[UserText]

user-paragraph-sep:
before-user-text:
user-text:
after-user-text:

[Tables]

before: <node TEXT="<html><body><table>

before-table-header: <th>
table-header-column-left: <td>%%</td>
table-header-column-center: <td>%%</td>
table-header-column-right: <td>%%</td>
after-table-header: </th>

before-table-row: <tr>
table-column-left: <td>%%</td>
table-column-center: <td>%%</td>
table-column-right: <td>%%</td>
after-table-row: </tr>

after: </table></body></html>"/>

[URLs]

url: %v
url-attr: LINK="%u"
vimoutliner/scripts/otl2tags_graphviz.conf	[[[1
104
# otl2html - medium complexity
# Variables:
#    %% - data
#    %l - outline level
#    %t - document title (the first line of the document)
#    %n - line number (document title is 0)
#    %N - line number of first line of block (for text blocks)
#    %p - parent line number
#    %c - my child number, a heading's order number under it's parent
#
#    first-is-node = true for output to programs like FreeMind and GraphViz
#    where the first line of the file is the top-most node.

[Document]

escapes: 
first-is-node: true
preamble: digraph V {
	node [shape=box style=rounded]
	# comment out rankdir to use top-to-bottom placement
	rankdir=LR
	node0 [label="%t"]
postamble: }

[Headings]

before-headings: 
branch-heading: node%n [label="%%"]
	node%p -> node%n
leaf-heading: node%n [label="%%"]
	node%p -> node%n
after-headings: 

before-bulleted-headings:
bulleted-branch-heading: node%n [label="*%%"]
	node%p -> node%n
bulleted-leaf-heading: node%n [label="*%%"]
	node%p -> node%n
after-bulleted-headings: 

before-numbered-headings:
numbered-branch-heading: node%n [label="%c %%"]
	node%p -> node%n
numbered-leaf-heading: node%n [label="%c %%"]
	node%p -> node%n
after-numbered-headings:

[Text]

paragraph-sep:
line-sep:
before: node%n [label="
text: %%
after: "]
	node%p -> node%N

[PrefText]

pref-paragraph-sep: 
before:
preftext: node%n [label="%%"]
after:
	node%p -> node%N

[UserPrefText]

user-pref-paragraph-sep: 
before-user-preftext:
user-preftext: node%n [label="%%"]
after-user-preftext: 
	node%p -> node%N

[UserText]

user-paragraph-sep: 
before-user-text:
user-text node%n: [label="%%"]
after-user-text:
	node%p -> node%N

[Tables]

before:

before-table-header:
table-header-column:
table-header-column-left:
table-header-column-center:
table-header-column-right:
after-table-header:

before-table-row:
table-column:
table-column-left:
table-column-center:
table-column-right:
after-table-row:

after:

[URLs]

url: %v
url-attr:
vimoutliner/scripts/otl_handler/Apache/OTL.pm	[[[1
324
#
# VimOutliner (OTL) XHTML pretty printer for mod_perl2/apache2.
#
# Copyright (c) 2006-2009, Mahlon E. Smith <mahlon@martini.nu>
# All rights reserved.
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Mahlon E. Smith nor the names of his
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

package Apache::OTL;
use strict;
use warnings;
use Apache2::Const qw/ DECLINED OK /;
use Apache2::Request;
use Apache2::RequestRec;
use Apache2::RequestUtil;
use Apache2::RequestIO;
use Apache2::Log;
use Time::HiRes 'gettimeofday';

sub handler
{
    my $VERSION = '0.6';
    my $ID      = '$Id$';
    my $r       = shift;
    my $t0      = Time::HiRes::gettimeofday;
    my (
        $file,          # the absolute file path
        $title,         # the file's title
        $uri,           # the file uri
        $data,          # file contents
        @blocks,        # todo groupings
        $mtime,         # last modification time of otl file
        $get,           # get arguments (sorting, etc)
        %opt,           # options from otl file
    );

    # sanity checks
    return DECLINED unless $r->method eq 'GET';

    ( $file, $uri ) = ( $r->filename, $r->uri );
    return DECLINED unless -e $file;
    $mtime = localtime( (stat(_))[9] );

    my $req = Apache2::Request->new($r);
    $get = $req->param || {};

    my %re = (
        title       => qr/(?:.+)?\/(.+).otl$/i,
        percent     => qr/(\[.\]) (\d+)%/,
        todo        => qr/(\[_\]) /,
        done        => qr/(\[X\]) /,
        user        => qr/^(?:\t+)?\<(.+)/,
        user_wrap   => qr/^(?:\t+)?\>(.+)/,
        body_wrap   => qr/^(?:\t+)?:(.+)/,
        body        => qr/^(?:\t+)?;(.+)/,
        time        => qr/(\d{2}:\d{2}:\d{2})/,
        date        => qr/(\d{2,4}-\d{2}-\d{2})/,
        subitem     => qr/^\t(?!\t)/,
        remove_tabs => qr/^(?:\t+)?(.+)/,
        linetext    => qr/^(?:\[.\] (?:\d+%)?)? (.+)/,

        comma_sep   => qr/(?:\s+)?\,(?:\s+)?/,
        hideline    => qr/(?:\t+)?\#/,
    );

    # snag file
    open OTL, $file
        or ( $r->log_error("Unable to read $file: $!") && return DECLINED );
    do {
        local $/ = undef;
        $data = <OTL>;  # shlorp
    };
    close OTL;

    # just spit out the plain otl if requested.
    if ( $get->{'show'} && $get->{show} eq 'source' ) {
        $r->content_type('text/plain');
        $r->print( $data );
        return OK;
    }           

    # divide each outline into groups
    # skip blocks that start with a comment '#'
    @blocks = grep { $_ !~ /^\#/ } split /\n\n+/, $data;

    # get optional settings and otl title
    {
        my $settings = shift @blocks;
        if ($settings =~ $re{user}) {
            %opt = map { split /=/ } split /\s?:/, $1;
        }
        
        # if the first group wasn't a comment,
        # we probably just aren't using a settings
        # line.  push the group back into place.
        else {
            unshift @blocks, $settings;
        }
    }

    # Now that we have tried to detect settings,
    # remove any level 0 blocks that are user data.
    @blocks = grep { $_ !~ /^[\<\>]/ } @blocks;

    # GET args override settings
    $opt{$_} = $get->{$_} foreach keys %$get;

    # set title (fallback to file uri)
    $title =
        $opt{title}
      ? $opt{title}
      : $1 if $uri =~ $re{title};

    # start html output
    $r->content_type('text/html');
    $r->print(<<EHTML);
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <!--
        generated by otl_handler $VERSION
        Mahlon E. Smith <mahlon\@martini.nu>
        http://projects.martini.nu/apache-otl/

        Get VimOutliner at: http://www.vimoutliner.org/
    -->
    <head>
        <title>$title</title>
EHTML

    # optional styles
    if ( $opt{style} ) {
        foreach ( split /$re{'comma_sep'}/, $opt{style} ) {
            my $media = $_ =~ /print/ ? 'print' : 'screen';
            print qq{\t<link href="$_" rel="stylesheet" media="$media" type="text/css" />\n};
        }
    }

    # optional javascript
    if ( $opt{js} ) {
        $r->print( "\t<script type=\"text/javascript\" src=\"$_\"></script>\n" )
            foreach split /$re{'comma_sep'}/, $opt{js};
        $r->print( ' ' x 4, "</head>\n" );
        $r->print( ' ' x 4, "<body>\n" );
    } else {
        $r->print(<<EHTML);
    </head>
    <body>
EHTML
    }

    # title, last modification times
    $r->print("<div class=\"header\">$opt{title}</div>\n") if $opt{title};
    $r->print("<div class=\"last_mod\">Last modified: $mtime</div>\n") if $opt{last_mod};
    if ($opt{legend}) {
        $r->print(<<EHTML);
<div class="legend">
<span class="done">Item completed</span><br />
<span class="todo">Item is incomplete</span><br />
</div>
EHTML
    }

    # sorter
    if ($opt{sort}) {
        my %sorts = (
            alpha   => 'alphabetical',
            percent => 'percentages',
        );
        $r->print("<div class=\"sort\">Sort: \n");
        foreach (sort keys %sorts) {
            if ($opt{sorttype} eq $_ && $opt{sortrev}) {
                $r->print("<a href=\"$uri?sorttype=$_\">$sorts{$_}</a>&nbsp;");
            } elsif ($opt{sorttype} eq $_ && ! $opt{sortrev}) {
                $r->print("<a href=\"$uri?sorttype=$_&sortrev=1\">$sorts{$_}</a>&nbsp;");
            } else {
                $r->print("<a href=\"$uri?sorttype=$_\">$sorts{$_}</a>&nbsp;");
            }
        }
        $r->print("</div>\n");
    }

    foreach my $block ( sort { sorter(\%opt, \%re) } @blocks ) {
        # separate outline items
        my @lines;
        foreach my $line ( split /\n/, $block ) {
            push @lines, $line unless $line =~ $re{hideline} ||
                $line =~ $re{user} || $line =~ $re{user_wrap};
        }

        my $data  = [];

        # build structure and get item counts
        my ( $subs, $comments, $subsubs ) = ( 0, 0, 0 );
        foreach ( @lines ) {
            if (/$re{body_wrap}/) {
                $comments++;
            }
            elsif (/$re{subitem}/) {
                $subs++;
            }

            my $level = 0;
            $level = $1 =~ tr/\t/\t/ if /^(\t+)/;
            $level++;

            s#$re{remove_tabs}#$1# unless $opt{'debug'};
            push @$data, [ $level, $_ ];
        }
        $subsubs = ( scalar @lines - 1 ) - $subs - $comments;

        # begin parsing structure
        $r->print("<div class=\"outline\">\n");
        $r->print("<ul>\n") unless $opt{'debug'};
        my $i = 0;
        foreach ( @$data ) {
            my ( $level, $line ) = @$_;

            if ( $opt{'debug'} ) {
                my $in = "&nbsp;" x $level x 4;
                $r->print( "$level:$in $line<br />\n" );
                next;
            }

            my $next_level = $data->[ $i+1 ] ? $data->[ $i+1 ]->[0] : 0;
            my $in = "\t" x $level;

            $line =~ s#$re{'time'}#<span class="time">$1</span>#g;
            $line =~ s#$re{date}#<span class="date">$1</span>#g;
            $line =~ s#$re{percent}#$1 <span class="percent">$2%</span>#;

            # append counts
            if ( $i == 0 && $opt{counts} && $line !~ $re{comment} ) {
                my $itmstr  = $subs == 1    ? 'item'    : 'items';
                my $sitmstr = $subsubs == 1 ? 'subitem' : 'subitems';
                $line .= " <span class=\"counts\">$subs $itmstr, $subsubs $sitmstr</span>";
            }

            my $li_class = '>';
            $li_class = ' class="todo">'        if $line =~ s#$re{todo}##;
            $li_class = ' class="done">'        if $line =~ s#$re{done}##;
            $li_class = ' class="comment_pre">' if $line =~ s#$re{body}#$1#;
            $li_class = ' class="comment">'     if $line =~ s#$re{body_wrap}#$1#;

            if ( $next_level == $level || $next_level == 0 ) {
                $r->print( "$in<li" . $li_class . "$line</li>\n" );
            }

            elsif ( $next_level < $level ) {
                $r->print( "$in<li" . $li_class . "$line</li>\n" );
                for (my $x = $level - 1; $x >= $next_level; $x--) {
                    my $in = "\t" x $x;
                    $r->print( "$in</ul>\n$in</li>\n" );
                }
            }

            else {
                # implicit: $next_level > $level AND $next_level != 0
                $r->print("$in<li" . $li_class . "$line\n$in<ul>\n");
            }

            $i++;
        }

        unless ( $opt{'debug'} ) {
            for (my $x = $data->[ scalar @$data - 1]->[0] - 1; $x > 0; $x--) {
                my $in = "\t" x $x;
                $r->print( "$in</ul>\n$in</li>\n" );
            }
            $r->print( "</ul>\n" );
        }
        $r->print( "</div>\n\n" );
    }

    my $t1 = Time::HiRes::gettimeofday;
    my $td = sprintf("%0.3f", $t1 - $t0);
    $r->print("    <div class=\"timer\">OTL parsed in $td secs</div>\n") if $opt{timer};
    $r->print(<<EHTML);
    </body>
</html>
EHTML

    return OK;
}

sub sorter
{
    my ($opt, $re) = @_;
    return 0 unless $opt->{sorttype};
    my ($sa, $sb);
    if ($opt->{sorttype} eq 'percent') {
        $sa = $2 if $a =~ $re->{percent};
        $sb = $2 if $b =~ $re->{percent};
        return $opt->{sortrev} ? $sb <=> $sa : $sa <=> $sb;
    }
    else {
        $sa = $1 if $a =~ $re->{linetext};
        $sb = $1 if $b =~ $re->{linetext};
        return $opt->{sortrev} ? $sb cmp $sa : $sa cmp $sb;
    }
}

1;

vimoutliner/scripts/otl_handler/devel-mode	[[[1
5
PerlModule Apache2::Reload
PerlInitHandler Apache2::Reload
PerlSetVar ReloadAll Off
PerlSetVar ReloadModules "Apache::OTL"
PerlSetVar ReloadConstantRedefineWarnings Off
vimoutliner/scripts/otl_handler/javascript/jquery.js	[[[1
12
/*
 * jQuery 1.0.2 - New Wave Javascript
 *
 * Copyright (c) 2006 John Resig (jquery.com)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * $Date: 2006-10-09 20:23:18 -0400 (Mon, 09 Oct 2006) $
 * $Rev: 1b5eb968d2c4 $
 */

eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('l(1Y 1O.6=="P"){1O.P=1O.P;6=q(a,c){l(a&&1Y a=="q"&&6.C.1T)v 6(15).1T(a);a=a||6.1k||15;l(a.2J)v 6(6.1X(a,[]));l(c&&c.2J)v 6(c).2j(a);l(1O==7)v 1f 6(a,c);u m=/^[^<]*(<.+>)[^>]*$/.36(a);l(m)a=6.31([m[1]]);7.1o(a.N==2y||a.D&&!a.1S&&a[0]!=P&&a[0].1S?6.1X(a,[]):6.2j(a,c));u C=1d[1d.D-1];l(C&&1Y C=="q")7.U(C)};l(1Y $!="P")6.3W$=$;u $=6;6.C=6.89={2J:"1.0.2",4u:q(){v 7.D},1o:q(26){l(26&&26.N==2y){7.D=0;[].1l.17(7,26);v 7}F v 26==P?6.1X(7,[]):7[26]},U:q(C,1h){v 6.U(7,C,1h)},8b:q(16){u 2c=-1;7.U(q(i){l(7==16)2c=i});v 2c},1r:q(1P,W,B){v 1P.N!=1N||W!=P?7.U(q(){l(W==P)H(u I 1q 1P)6.1r(B?7.1a:7,I,1P[I]);F 6.1r(B?7.1a:7,1P,W)}):6[B||"1r"](7[0],1P)},1g:q(1P,W){v 7.1r(1P,W,"20")},2V:q(e){e=e||7;u t="";H(u j=0;j<e.D;j++){u r=e[j].2e;H(u i=0;i<r.D;i++)l(r[i].1S!=8)t+=r[i].1S!=1?r[i].5a:6.C.2V([r[i]])}v t},8c:q(){u a=6.31(1d);v 7.U(q(){u b=a[0].3D(V);7.1n.2B(b,7);2d(b.1M)b=b.1M;b.44(7)})},5h:q(){v 7.2K(1d,V,1,q(a){7.44(a)})},5j:q(){v 7.2K(1d,V,-1,q(a){7.2B(a,7.1M)})},5k:q(){v 7.2K(1d,14,1,q(a){7.1n.2B(a,7)})},5l:q(){v 7.2K(1d,14,-1,q(a){7.1n.2B(a,7.8g)})},7x:q(){v 7.1o(7.3d.5X())},2j:q(t){v 7.28(6.2t(7,q(a){v 6.2j(t,a)}),1d)},3G:q(4g){v 7.28(6.2t(7,q(a){v a.3D(4g!=P?4g:V)}),1d)},19:q(t){v 7.28(t.N==2y&&6.2t(7,q(a){H(u i=0;i<t.D;i++)l(6.19(t[i],[a]).r.D)v a})||t.N==5Y&&(t?7.1o():[])||1Y t=="q"&&6.2E(7,t)||6.19(t,7).r,1d)},2s:q(t){v 7.28(t.N==1N?6.19(t,7,14).r:6.2E(7,q(a){v a!=t}),1d)},1Z:q(t){v 7.28(6.1X(7,t.N==1N?6.2j(t):t.N==2y?t:[t]),1d)},4o:q(2r){v 2r?6.19(2r,7).r.D>0:14},2K:q(1h,1p,2N,C){u 3G=7.4u()>1;u a=6.31(1h);v 7.U(q(){u 16=7;l(1p&&7.2x.2h()=="60"&&a[0].2x.2h()!="61"){u 25=7.4R("25");l(!25.D){16=15.4E("25");7.44(16)}F 16=25[0]}H(u i=(2N<0?a.D-1:0);i!=(2N<0?2N:a.D);i+=2N){C.17(16,[3G?a[i].3D(V):a[i]])}})},28:q(a,1h){u C=1h&&1h[1h.D-1];u 2i=1h&&1h[1h.D-2];l(C&&C.N!=1v)C=Q;l(2i&&2i.N!=1v)2i=Q;l(!C){l(!7.3d)7.3d=[];7.3d.1l(7.1o());7.1o(a)}F{u 1U=7.1o();7.1o(a);l(2i&&a.D||!2i)7.U(2i||C).1o(1U);F 7.1o(1U).U(C)}v 7}};6.1L=6.C.1L=q(16,I){l(!I){I=16;16=7}H(u i 1q I)16[i]=I[i];v 16};6.1L({5C:q(){6.63=V;6.U(6.2l.5u,q(i,n){6.C[i]=q(a){u K=6.2t(7,n);l(a&&a.N==1N)K=6.19(a,K).r;v 7.28(K,1d)}});6.U(6.2l.2q,q(i,n){6.C[i]=q(){u a=1d;v 7.U(q(){H(u j=0;j<a.D;j++)6(a[j])[n](7)})}});6.U(6.2l.U,q(i,n){6.C[i]=q(){v 7.U(n,1d)}});6.U(6.2l.19,q(i,n){6.C[n]=q(26,C){v 7.19(":"+n+"("+26+")",C)}});6.U(6.2l.1r,q(i,n){n=n||i;6.C[i]=q(h){v h==P?7.D?7[0][n]:Q:7.1r(n,h)}});6.U(6.2l.1g,q(i,n){6.C[n]=q(h){v h==P?(7.D?6.1g(7[0],n):Q):7.1g(n,h)}})},U:q(16,C,1h){l(16.D==P)H(u i 1q 16)C.17(16[i],1h||[i,16[i]]);F H(u i=0;i<16.D;i++)C.17(16[i],1h||[i,16[i]]);v 16},1e:{1Z:q(o,c){l(6.1e.3l(o,c))v;o.1e+=(o.1e?" ":"")+c},22:q(o,c){l(!c){o.1e=""}F{u 2H=o.1e.3y(" ");H(u i=0;i<2H.D;i++){l(2H[i]==c){2H.67(i,1);4Y}}o.1e=2H.5U(\' \')}},3l:q(e,a){l(e.1e!=P)e=e.1e;v 1f 3T("(^|\\\\s)"+a+"(\\\\s|$)").23(e)}},3L:q(e,o,f){H(u i 1q o){e.1a["1U"+i]=e.1a[i];e.1a[i]=o[i]}f.17(e,[]);H(u i 1q o)e.1a[i]=e.1a["1U"+i]},1g:q(e,p){l(p=="1z"||p=="27"){u 1U={},3E,3z,d=["6o","6p","69","6a"];H(u i 1q d){1U["66"+d[i]]=0;1U["6c"+d[i]+"6d"]=0}6.3L(e,1U,q(){l(6.1g(e,"1t")!="21"){3E=e.6e;3z=e.6f}F{e=6(e.3D(V)).1g({4e:"1V",2S:"8h",1t:"2Q",6g:"0",5m:"0"}).4w(e.1n)[0];u 2X=6.1g(e.1n,"2S");l(2X==""||2X=="3K")e.1n.1a.2S="8f";3E=e.8e;3z=e.8d;l(2X==""||2X=="3K")e.1n.1a.2S="3K";e.1n.3g(e)}});v p=="1z"?3E:3z}v 6.20(e,p)},20:q(E,I,4A){u K;l(I==\'1j\'&&6.18.1y)v 6.1r(E.1a,\'1j\');l(!4A&&E.1a[I]){K=E.1a[I]}F l(E.3t){u 4C=I.1A(/\\-(\\w)/g,q(m,c){v c.2h()});K=E.3t[I]||E.3t[4C]}F l(15.3A&&15.3A.4s){I=I.1A(/([A-Z])/g,"-$1").41();u 1m=15.3A.4s(E,Q);l(1m)K=1m.5Q(I);F l(I==\'1t\')K=\'21\';F 6.3L(E,{1t:\'2Q\'},q(){K=15.3A.4s(7,Q).5Q(I)})}v K},31:q(a){u r=[];H(u i=0;i<a.D;i++){l(a[i].N==1N){a[i]=6.2I(a[i]);u 1p="";l(!a[i].1c("<4j")||!a[i].1c("<25")){1p="4j";a[i]="<1p>"+a[i]+"</1p>"}F l(!a[i].1c("<3v")){1p="3v";a[i]="<1p>"+a[i]+"</1p>"}F l(!a[i].1c("<3M")||!a[i].1c("<6r")){1p="3M";a[i]="<1p><25><3v>"+a[i]+"</3v></25></1p>"}u 1F=15.4E("1F");1F.2u=a[i];l(1p){1F=1F.1M;l(1p!="4j")1F=1F.1M;l(1p=="3M")1F=1F.1M}H(u j=0;j<1F.2e.D;j++)r.1l(1F.2e[j])}F l(a[i].2J||a[i].D&&!a[i].1S)H(u k=0;k<a[i].D;k++)r.1l(a[i][k]);F l(a[i]!==Q)r.1l(a[i].1S?a[i]:15.6t(a[i].6u()))}v r},2r:{"":"m[2]== \'*\'||a.2x.2h()==m[2].2h()","#":"a.3a(\'3w\')&&a.3a(\'3w\')==m[2]",":":{5p:"i<m[3]-0",5q:"i>m[3]-0",4J:"m[3]-0==i",5o:"m[3]-0==i",2f:"i==0",1R:"i==r.D-1",52:"i%2==0",53:"i%2","4J-32":"6.1x(a,m[3]).1m","2f-32":"6.1x(a,0).1m","1R-32":"6.1x(a,0).1R","6v-32":"6.1x(a).D==1",5v:"a.2e.D",5A:"!a.2e.D",5r:"(a.7L||a.2u).1c(m[3])>=0",6w:"a.B!=\'1V\'&&6.1g(a,\'1t\')!=\'21\'&&6.1g(a,\'4e\')!=\'1V\'",1V:"a.B==\'1V\'||6.1g(a,\'1t\')==\'21\'||6.1g(a,\'4e\')==\'1V\'",7I:"!a.2R",2R:"a.2R",34:"a.34",4f:"a.4f || 6.1r(a, \'4f\')",2V:"a.B==\'2V\'",5G:"a.B==\'5G\'",5H:"a.B==\'5H\'",4l:"a.B==\'4l\'",4L:"a.B==\'4L\'",4n:"a.B==\'4n\'",5I:"a.B==\'5I\'",4m:"a.B==\'4m\'",48:"a.B==\'48\'",5B:"a.2x.41().4U(/5B|5O|6C|48/)"},".":"6.1e.3l(a,m[2])","@":{"=":"z==m[4]","!=":"z!=m[4]","^=":"z && !z.1c(m[4])","$=":"z && z.2U(z.D - m[4].D,m[4].D)==m[4]","*=":"z && z.1c(m[4])>=0","":"z"},"[":"6.2j(m[2],a).D"},3j:["\\\\.\\\\.|/\\\\.\\\\.","a.1n",">|/","6.1x(a.1M)","\\\\+","6.1x(a).3p","~",q(a){u r=[];u s=6.1x(a);l(s.n>0)H(u i=s.n;i<s.D;i++)r.1l(s[i]);v r}],2j:q(t,1k){l(1k&&1k.1S==P)1k=Q;1k=1k||6.1k||15;l(t.N!=1N)v[t];l(!t.1c("//")){1k=1k.4O;t=t.2U(2,t.D)}F l(!t.1c("/")){1k=1k.4O;t=t.2U(1,t.D);l(t.1c("/")>=1)t=t.2U(t.1c("/"),t.D)}u K=[1k];u 1J=[];u 1R=Q;2d(t.D>0&&1R!=t){u r=[];1R=t;t=6.2I(t).1A(/^\\/\\//i,"");u 3k=14;H(u i=0;i<6.3j.D;i+=2){l(3k)51;u 2o=1f 3T("^("+6.3j[i]+")");u m=2o.36(t);l(m){r=K=6.2t(K,6.3j[i+1]);t=6.2I(t.1A(2o,""));3k=V}}l(!3k){l(!t.1c(",")||!t.1c("|")){l(K[0]==1k)K.3O();1J=6.1X(1J,K);r=K=[1k];t=" "+t.2U(1,t.D)}F{u 3P=/^([#.]?)([a-4X-9\\\\*3W-]*)/i;u m=3P.36(t);l(m[1]=="#"){u 4q=15.5z(m[2]);r=K=4q?[4q]:[];t=t.1A(3P,"")}F{l(!m[2]||m[1]==".")m[2]="*";H(u i=0;i<K.D;i++)r=6.1X(r,m[2]=="*"?6.3Q(K[i]):K[i].4R(m[2]))}}}l(t){u 1B=6.19(t,r);K=r=1B.r;t=6.2I(1B.t)}}l(K&&K[0]==1k)K.3O();1J=6.1X(1J,K);v 1J},3Q:q(o,r){r=r||[];u s=o.2e;H(u i=0;i<s.D;i++)l(s[i].1S==1){r.1l(s[i]);6.3Q(s[i],r)}v r},1r:q(E,1b,W){u 29={"H":"6G","6H":"1e","5n":"6I",2u:"2u",1e:"1e",W:"W",2R:"2R",34:"34"};l(1b=="1j"&&6.18.1y&&W!=P){E[\'6K\']=1;l(W==1)v E["19"]=E["19"].1A(/35\\([^\\)]*\\)/5g,"");F v E["19"]=E["19"].1A(/35\\([^\\)]*\\)/5g,"")+"35(1j="+W*5w+")"}F l(1b=="1j"&&6.18.1y){v E["19"]?3Z(E["19"].4U(/35\\(1j=(.*)\\)/)[1])/5w:1}l(1b=="1j"&&6.18.2W&&W==1)W=0.6M;l(29[1b]){l(W!=P)E[29[1b]]=W;v E[29[1b]]}F l(W==P&&6.18.1y&&E.2x&&E.2x.2h()==\'6N\'&&(1b==\'7b\'||1b==\'6P\')){v E.6Q(1b).5a}F l(E.3a!=P){l(W!=P)E.6T(1b,W);v E.3a(1b,2)}F{1b=1b.1A(/-([a-z])/6U,q(z,b){v b.2h()});l(W!=P)E[1b]=W;v E[1b]}},4V:["\\\\[ *(@)S *([!*$^=]*) *(\'?\\"?)(.*?)\\\\4 *\\\\]","(\\\\[)\\s*(.*?)\\s*\\\\]","(:)S\\\\(\\"?\'?([^\\\\)]*?)\\"?\'?\\\\)","([:.#]*)S"],19:q(t,r,2s){u g=2s!==14?6.2E:q(a,f){v 6.2E(a,f,V)};2d(t&&/^[a-z[({<*:.#]/i.23(t)){u p=6.4V;H(u i=0;i<p.D;i++){u 2o=1f 3T("^"+p[i].1A("S","([a-z*3W-][a-4X-6X-]*)"),"i");u m=2o.36(t);l(m){l(!i)m=["",m[1],m[3],m[2],m[5]];t=t.1A(2o,"");4Y}}l(m[1]==":"&&m[2]=="2s")r=6.19(m[3],r,14).r;F{u f=6.2r[m[1]];l(f.N!=1N)f=6.2r[m[1]][m[2]];37("f = q(a,i){"+(m[1]=="@"?"z=6.1r(a,m[3]);":"")+"v "+f+"}");r=g(r,f)}}v{r:r,t:t}},2I:q(t){v t.1A(/^\\s+|\\s+$/g,"")},3i:q(E){u 3U=[];u 1m=E.1n;2d(1m&&1m!=15){3U.1l(1m);1m=1m.1n}v 3U},1x:q(E,2c,2s){u Y=[];l(E){u 2g=E.1n.2e;H(u i=0;i<2g.D;i++){l(2s===V&&2g[i]==E)51;l(2g[i].1S==1)Y.1l(2g[i]);l(2g[i]==E)Y.n=Y.D-1}}v 6.1L(Y,{1R:Y.n==Y.D-1,1m:2c=="52"&&Y.n%2==0||2c=="53"&&Y.n%2||Y[2c]==E,45:Y[Y.n-1],3p:Y[Y.n+1]})},1X:q(2f,33){u 1D=[];H(u k=0;k<2f.D;k++)1D[k]=2f[k];H(u i=0;i<33.D;i++){u 3N=V;H(u j=0;j<2f.D;j++)l(33[i]==2f[j])3N=14;l(3N)1D.1l(33[i])}v 1D},2E:q(Y,C,3X){l(C.N==1N)C=1f 1v("a","i","v "+C);u 1D=[];H(u i=0;i<Y.D;i++)l(!3X&&C(Y[i],i)||3X&&!C(Y[i],i))1D.1l(Y[i]);v 1D},2t:q(Y,C){l(C.N==1N)C=1f 1v("a","v "+C);u 1D=[];H(u i=0;i<Y.D;i++){u 1B=C(Y[i],i);l(1B!==Q&&1B!=P){l(1B.N!=2y)1B=[1B];1D=6.1X(1D,1B)}}v 1D},L:{1Z:q(T,B,24){l(6.18.1y&&T.3R!=P)T=1O;l(!24.2n)24.2n=7.2n++;l(!T.1H)T.1H={};u 2L=T.1H[B];l(!2L){2L=T.1H[B]={};l(T["2D"+B])2L[0]=T["2D"+B]}2L[24.2n]=24;T["2D"+B]=7.5b;l(!7.1i[B])7.1i[B]=[];7.1i[B].1l(T)},2n:1,1i:{},22:q(T,B,24){l(T.1H)l(B&&T.1H[B])l(24)58 T.1H[B][24.2n];F H(u i 1q T.1H[B])58 T.1H[B][i];F H(u j 1q T.1H)7.22(T,j)},1Q:q(B,J,T){J=J||[];l(!T){u g=7.1i[B];l(g)H(u i=0;i<g.D;i++)7.1Q(B,J,g[i])}F l(T["2D"+B]){J.5c(7.29({B:B,76:T}));T["2D"+B].17(T,J)}},5b:q(L){l(1Y 6=="P")v;L=L||6.L.29(1O.L);l(!L)v;u 3c=V;u c=7.1H[L.B];u 1h=[].77.4i(1d,1);1h.5c(L);H(u j 1q c){l(c[j].17(7,1h)===14){L.4c();L.5d();3c=14}}v 3c},29:q(L){l(L){L.4c=q(){7.3c=14};L.5d=q(){7.79=V}}v L}}});1f q(){u b=5J.5K.41();6.18={3e:/5e/.23(b),2G:/2G/.23(b),1y:/1y/.23(b)&&!/2G/.23(b),2W:/2W/.23(b)&&!/(7a|5e)/.23(b)};6.7d=!6.18.1y||15.7e=="7f"};6.2l={2q:{4w:"5h",7h:"5j",2B:"5k",7i:"5l"},1g:"27,1z,7j,5m,2S,5n,39,7k,7l".3y(","),19:["5o","5p","5q","5r"],1r:{1B:"W",5y:"2u",3w:Q,7n:Q,1b:Q,7o:Q,3m:Q,7p:Q},5u:{5v:"a.1n",7r:6.3i,3i:6.3i,3p:"6.1x(a).3p",45:"6.1x(a).45",2g:"6.1x(a, Q, V)",7s:"6.1x(a.1M)"},U:{7t:q(1P){7.7u(1P)},1C:q(){7.1a.1t=7.2v?7.2v:"";l(6.1g(7,"1t")=="21")7.1a.1t="2Q"},1s:q(){7.2v=7.2v||6.1g(7,"1t");l(7.2v=="21")7.2v="2Q";7.1a.1t="21"},4a:q(){6(7)[6(7).4o(":1V")?"1C":"1s"].17(6(7),1d)},7w:q(c){6.1e.1Z(7,c)},7y:q(c){6.1e.22(7,c)},7z:q(c){6.1e[6.1e.3l(7,c)?"22":"1Z"](7,c)},22:q(a){l(!a||6.19(a,[7]).r)7.1n.3g(7)},5A:q(){2d(7.1M)7.3g(7.1M)},3B:q(B,C){l(C.N==1N)C=1f 1v("e",(!C.1c(".")?"6(7)":"v ")+C);6.L.1Z(7,B,C)},5R:q(B,C){6.L.22(7,B,C)},1Q:q(B,J){6.L.1Q(B,J,7)}}};6.5C();6.C.1L({5E:6.C.4a,4a:q(a,b){v a&&b&&a.N==1v&&b.N==1v?7.5L(q(e){7.1R=7.1R==a?b:a;e.4c();v 7.1R.17(7,[e])||14}):7.5E.17(7,1d)},7B:q(f,g){q 4h(e){u p=(e.B=="3u"?e.7C:e.7D)||e.7E;2d(p&&p!=7)3x{p=p.1n}3h(e){p=7};l(p==7)v 14;v(e.B=="3u"?f:g).17(7,[e])}v 7.3u(4h).5N(4h)},1T:q(f){l(6.3s)f.17(15);F{6.2z.1l(f)}v 7}});6.1L({3s:14,2z:[],1T:q(){l(!6.3s){6.3s=V;l(6.2z){H(u i=0;i<6.2z.D;i++)6.2z[i].17(15);6.2z=Q}l(6.18.2W||6.18.2G)15.7H("5T",6.1T,14)}}});1f q(){u e=("7J,7M,2T,7N,7O,3J,5L,7P,"+"7Q,7S,7T,3u,5N,7V,4m,5O,"+"4n,7Y,7Z,80,2k").3y(",");H(u i=0;i<e.D;i++)1f q(){u o=e[i];6.C[o]=q(f){v f?7.3B(o,f):7.1Q(o)};6.C["81"+o]=q(f){v 7.5R(o,f)};6.C["83"+o]=q(f){v 7.U(q(){u 5S=0;6.L.1Z(7,o,q(e){l(5S++)v;v f.17(7,[e])})})}};l(6.18.2W||6.18.2G){15.86("5T",6.1T,14)}F l(6.18.1y){15.87("<88"+"8a 3w=5V 8i=V "+"3m=//:><\\/2b>");u 2b=15.5z("5V");2b.2A=q(){l(7.2Y!="1I")v;7.1n.3g(7);6.1T()};2b=Q}F l(6.18.3e){6.4r=3R(q(){l(15.2Y=="62"||15.2Y=="1I"){56(6.4r);6.4r=Q;6.1T()}},10)}6.L.1Z(1O,"2T",6.1T)};l(6.18.1y)6(1O).3J(q(){u L=6.L,1i=L.1i;H(u B 1q 1i){u 3H=1i[B],i=3H.D;l(i>0)68 l(B!=\'3J\')L.22(3H[i-1],B);2d(--i)}});6.C.1L({4z:6.C.1C,1C:q(11,G){v 11?7.1W({1z:"1C",27:"1C",1j:"1C"},11,G):7.4z()},5W:6.C.1s,1s:q(11,G){v 11?7.1W({1z:"1s",27:"1s",1j:"1s"},11,G):7.5W()},6h:q(11,G){v 7.1W({1z:"1C"},11,G)},6j:q(11,G){v 7.1W({1z:"1s"},11,G)},6k:q(11,G){v 7.U(q(){u 4B=6(7).4o(":1V")?"1C":"1s";6(7).1W({1z:4B},11,G)})},84:q(11,G){v 7.1W({1j:"1C"},11,G)},6n:q(11,G){v 7.1W({1j:"1s"},11,G)},6q:q(11,2q,G){v 7.1W({1j:2q},11,G)},1W:q(I,11,G){v 7.1w(q(){7.2P=I;H(u p 1q I){u e=1f 6.2O(7,6.11(11,G),p);l(I[p].N==4M)e.2M(e.1m(),I[p]);F e[I[p]](I)}})},1w:q(B,C){l(!C){C=B;B="2O"}v 7.U(q(){l(!7.1w)7.1w={};l(!7.1w[B])7.1w[B]=[];7.1w[B].1l(C);l(7.1w[B].D==1)C.17(7)})}});6.1L({5i:q(e,p){l(e.4K)v;l(p=="1z"&&e.4D!=3f(6.20(e,p)))v;l(p=="27"&&e.4F!=3f(6.20(e,p)))v;u a=e.1a[p];u o=6.20(e,p,1);l(p=="1z"&&e.4D!=o||p=="27"&&e.4F!=o)v;e.1a[p]=e.3t?"":"4I";u n=6.20(e,p,1);l(o!=n&&n!="4I"){e.1a[p]=a;e.4K=V}},11:q(s,o){o=o||{};l(o.N==1v)o={1I:o};u 4N={6x:6z,6A:4H};o.2F=(s&&s.N==4M?s:4N[s])||4S;o.3o=o.1I;o.1I=q(){6.4P(7,"2O");l(o.3o&&o.3o.N==1v)o.3o.17(7)};v o},1w:{},4P:q(E,B){B=B||"2O";l(E.1w&&E.1w[B]){E.1w[B].3O();u f=E.1w[B][0];l(f)f.17(E)}},2O:q(E,2m,I){u z=7;z.o={2F:2m.2F||4S,1I:2m.1I,2p:2m.2p};z.R=E;u y=z.R.1a;z.a=q(){l(2m.2p)2m.2p.17(E,[z.2a]);l(I=="1j")6.1r(y,"1j",z.2a);F l(3f(z.2a))y[I]=3f(z.2a)+"5f";y.1t="2Q"};z.57=q(){v 3Z(6.1g(z.R,I))};z.1m=q(){u r=3Z(6.20(z.R,I));v r&&r>-6R?r:z.57()};z.2M=q(4t,2q){z.42=(1f 54()).55();z.2a=4t;z.a();z.3Y=3R(q(){z.2p(4t,2q)},13)};z.1C=q(p){l(!z.R.1G)z.R.1G={};z.R.1G[I]=7.1m();l(I=="1j")z.2M(z.R.1G[I],1);F z.2M(0,z.R.1G[I]);l(I!="1j")y[I]="6Z"};z.1s=q(){l(!z.R.1G)z.R.1G={};z.R.1G[I]=7.1m();z.o.1s=V;z.2M(z.R.1G[I],0)};l(!z.R.71)z.R.59=6.1g(z.R,"39");y.39="1V";z.2p=q(47,46){u t=(1f 54()).55();l(t>z.o.2F+z.42){56(z.3Y);z.3Y=Q;z.2a=46;z.a();z.R.2P[I]=V;u 1J=V;H(u i 1q z.R.2P)l(z.R.2P[i]!==V)1J=14;l(1J){y.39=z.R.59;l(z.o.1s)y.1t=\'21\';l(z.o.1s){H(u p 1q z.R.2P){l(p=="1j"&&6.18.1y)6.1r(y,p,z.R.1G[p]);F y[p]=z.R.1G[p]+"5f";l(p==\'1z\'||p==\'27\')6.5i(z.R,p)}}}l(1J&&z.o.1I&&z.o.1I.N==1v)z.o.1I.17(z.R)}F{u p=(t-7.42)/z.o.2F;z.2a=((-5t.7m(p*5t.7q)/2)+0.5)*(46-47)+47;z.a()}}}});6.C.1L({7v:q(M,1K,G){7.2T(M,1K,G,1)},2T:q(M,1K,G,1E){l(M.N==1v)v 7.3B("2T",M);G=G||q(){};u B="4d";l(1K){l(1K.N==1v){G=1K;1K=Q}F{1K=6.2C(1K);B="4x"}}u 3q=7;6.3C(B,M,1K,q(3r,12){l(12=="2w"||!1E&&12=="5s"){3q.5y(3r.2Z).U(G,[3r.2Z,12]);6("2b",3q).U(q(){l(7.3m)6.4v(7.3m);F 37.4i(1O,7.2V||7.7A||7.2u||"")})}F G.17(3q,[3r.2Z,12])},1E);v 7},7F:q(){v 6.2C(7)}});l(6.18.1y&&1Y 3b=="P")3b=q(){v 1f 7K(5J.5K.1c("7R 5")>=0?"7U.5P":"7W.5P")};1f q(){u e="4G,5M,5F,5D,5x".3y(",");H(u i=0;i<e.D;i++)1f q(){u o=e[i];6.C[o]=q(f){v 7.3B(o,f)}}};6.1L({1o:q(M,J,G,B,1E){l(J.N==1v){B=G;G=J;J=Q}l(J)M+=((M.1c("?")>-1)?"&":"?")+6.2C(J);6.3C("4d",M,Q,q(r,12){l(G)G(6.3n(r,B),12)},1E)},5Z:q(M,J,G,B){6.1o(M,J,G,B,1)},4v:q(M,G){6.1o(M,G,"2b")},64:q(M,J,G){l(G)6.1o(M,J,G,"3S");F{6.1o(M,J,"3S")}},6b:q(M,J,G,B){6.3C("4x",M,6.2C(J),q(r,12){l(G)G(6.3n(r,B),12)})},1u:0,6i:q(1u){6.1u=1u},38:{},3C:q(B,M,J,K,1E){l(!M){K=B.1I;u 2w=B.2w;u 2k=B.2k;u 49=B.49;u 1i=1Y B.1i=="85"?B.1i:V;u 1u=1Y B.1u=="6s"?B.1u:6.1u;u 1E=B.1E||14;J=B.J;M=B.M;B=B.B}l(1i&&!6.3I++)6.L.1Q("4G");u 4p=14;u O=1f 3b();O.6y(B||"4d",M,V);l(J)O.30("6D-6E","6F/x-6J-6L-6O");l(1E)O.30("6S-40-6V",6.38[M]||"6W, 6Y 70 72 3V:3V:3V 73");O.30("X-74-75","3b");l(O.78)O.30("7c","7g");u 2A=q(43){l(O&&(O.2Y==4||43=="1u")){4p=V;u 12=6.4y(O)&&43!="1u"?1E&&6.4Q(O,M)?"5s":"2w":"2k";l(12!="2k"){u 3F;3x{3F=O.4b("4T-40")}3h(e){}l(1E&&3F)6.38[M]=3F;l(2w)2w(6.3n(O,49),12);l(1i)6.L.1Q("5x")}F{l(2k)2k(O,12);l(1i)6.L.1Q("5D")}l(1i)6.L.1Q("5F");l(1i&&!--6.3I)6.L.1Q("5M");l(K)K(O,12);O.2A=q(){};O=Q}};O.2A=2A;l(1u>0)7X(q(){l(O){O.82();l(!4p)2A("1u");O=Q}},1u);O.65(J)},3I:0,4y:q(r){3x{v!r.12&&6l.6m=="4l:"||(r.12>=4H&&r.12<6B)||r.12==4W||6.18.3e&&r.12==P}3h(e){}v 14},4Q:q(O,M){3x{u 50=O.4b("4T-40");v O.12==4W||50==6.38[M]||6.18.3e&&O.12==P}3h(e){}v 14},3n:q(r,B){u 4k=r.4b("7G-B");u J=!B&&4k&&4k.1c("O")>=0;J=B=="O"||J?r.8j:r.2Z;l(B=="2b")37.4i(1O,J);l(B=="3S")37("J = "+J);v J},2C:q(a){u s=[];l(a.N==2y||a.2J){H(u i=0;i<a.D;i++)s.1l(a[i].1b+"="+4Z(a[i].W))}F{H(u j 1q a)s.1l(j+"="+4Z(a[j]))}v s.5U("&")}})}',62,516,'||||||jQuery|this||||||||||||||if|||||function||||var|return||||||type|fn|length|elem|else|callback|for|prop|data|ret|event|url|constructor|xml|undefined|null|el||element|each|true|value||elems|||speed|status||false|document|obj|apply|browser|filter|style|name|indexOf|arguments|className|new|css|args|global|opacity|context|push|cur|parentNode|get|table|in|attr|hide|display|timeout|Function|queue|sibling|msie|height|replace|val|show|result|ifModified|div|orig|events|complete|done|params|extend|firstChild|String|window|key|trigger|last|nodeType|ready|old|hidden|animate|merge|typeof|add|curCSS|none|remove|test|handler|tbody|num|width|pushStack|fix|now|script|pos|while|childNodes|first|siblings|toUpperCase|fn2|find|error|macros|options|guid|re|step|to|expr|not|map|innerHTML|oldblock|success|nodeName|Array|readyList|onreadystatechange|insertBefore|param|on|grep|duration|opera|classes|trim|jquery|domManip|handlers|custom|dir|fx|curAnim|block|disabled|position|load|substr|text|mozilla|parPos|readyState|responseText|setRequestHeader|clean|child|second|checked|alpha|exec|eval|lastModified|overflow|getAttribute|XMLHttpRequest|returnValue|stack|safari|parseInt|removeChild|catch|parents|token|foundToken|has|src|httpData|oldComplete|next|self|res|isReady|currentStyle|mouseover|tr|id|try|split|oWidth|defaultView|bind|ajax|cloneNode|oHeight|modRes|clone|els|active|unload|static|swap|td|noCollision|shift|re2|getAll|setInterval|json|RegExp|matched|00|_|inv|timer|parseFloat|Modified|toLowerCase|startTime|istimeout|appendChild|prev|lastNum|firstNum|button|dataType|toggle|getResponseHeader|preventDefault|GET|visibility|selected|deep|handleHover|call|thead|ct|file|reset|submit|is|requestDone|oid|safariTimer|getComputedStyle|from|size|getScript|appendTo|POST|httpSuccess|_show|force|state|newProp|scrollHeight|createElement|scrollWidth|ajaxStart|200|auto|nth|notAuto|password|Number|ss|documentElement|dequeue|httpNotModified|getElementsByTagName|400|Last|match|parse|304|z0|break|encodeURIComponent|xmlRes|continue|even|odd|Date|getTime|clearInterval|max|delete|oldOverflow|nodeValue|handle|unshift|stopPropagation|webkit|px|gi|append|setAuto|prepend|before|after|left|float|eq|lt|gt|contains|notmodified|Math|axis|parent|100|ajaxSuccess|html|getElementById|empty|input|init|ajaxError|_toggle|ajaxComplete|radio|checkbox|image|navigator|userAgent|click|ajaxStop|mouseout|select|XMLHTTP|getPropertyValue|unbind|count|DOMContentLoaded|join|__ie_init|_hide|pop|Boolean|getIfModified|TABLE|THEAD|loaded|initDone|getJSON|send|padding|splice|do|Right|Left|post|border|Width|offsetHeight|offsetWidth|right|slideDown|ajaxTimeout|slideUp|slideToggle|location|protocol|fadeOut|Top|Bottom|fadeTo|th|number|createTextNode|toString|only|visible|slow|open|600|fast|300|textarea|Content|Type|application|htmlFor|class|cssFloat|www|zoom|form|9999|FORM|urlencoded|method|getAttributeNode|10000|If|setAttribute|ig|Since|Thu|9_|01|1px|Jan|oldOverlay|1970|GMT|Requested|With|target|slice|overrideMimeType|cancelBubble|compatible|action|Connection|boxModel|compatMode|CSS1Compat|close|prependTo|insertAfter|top|color|background|cos|title|href|rel|PI|ancestors|children|removeAttr|removeAttribute|loadIfModified|addClass|end|removeClass|toggleClass|textContent|hover|fromElement|toElement|relatedTarget|serialize|content|removeEventListener|enabled|blur|ActiveXObject|innerText|focus|resize|scroll|dblclick|mousedown|MSIE|mouseup|mousemove|Microsoft|change|Msxml2|setTimeout|keydown|keypress|keyup|un|abort|one|fadeIn|boolean|addEventListener|write|scr|prototype|ipt|index|wrap|clientWidth|clientHeight|relative|nextSibling|absolute|defer|responseXML'.split('|'),0,{}))
vimoutliner/scripts/otl_handler/javascript/theme2.js	[[[1
38
$(document).ready(function(){

    // slide everything open on new page
    $(".outline:hidden").slideToggle("slow", function(){
        $(".percent:hidden").fadeIn("slow");
    });

    // re-activate links (the event is stomped on by the li event)
    $(".outline a").click(function(){ window.location.href = this });

    // highlight clicked items
    $("li").not("[ul]").click(function(){ $(this).toggleClass("selected") });

    // add line numbers
    var line_counter = 0;
    $("li").each(function(){
        var str = '<span class="linenum">' + ++line_counter + ':</span>';
        $(this).prepend(str);
    });

    // attach folds
    $(".outline ul li").toggle(

        // hide
        function(){
            if ( $(this).children("ul").size() == 0 ) return;
            $(this).children("ul").slideUp("slow");
            $(this).find(".linenum").addClass("linenum-folded");
        },

        // show
        function(){
            $(this).children("ul").slideDown("slow");
            $(this).find(".linenum").removeClass("linenum-folded");
        }
    );

});
vimoutliner/scripts/otl_handler/javascript/theme3.js	[[[1
22
$(document).ready(function(){

    // append content div
    $("body").prepend("<div id=\"content\">test</div>");
    $("#content").hide();

    // FIXME  - document.width + document.height
    $(".outline").click(function(){
        $("#content").html( $(this).html() );
        $("body").background("#7b7c8c");
        $("#content").show();
    });

    $("#content").click(function(){
        $(this).hide();
        $("body").background("#acadc3");
    });

    // re-activate links (the event is stomped on by the li event)
    $(".outline a").click(function(){ window.location.href = this; return false; });

});
vimoutliner/scripts/otl_handler/README	[[[1
155

                                                       WHAT IS THIS?
---------------------------------------------------------------------

Vimoutliner already comes with some otl to HTML converters that work
quite well.  I maintain a few different otl files, that are displayed
on a internal intranet - the step of converting to HTML on every little
change before upload was becoming mildly irritating, and countering my
near legendary laziness.

This mod_perl handler teaches apache how to pretty print otl natively.

Now, I can just edit the otl files directly - skip the conversion step
altogether, and let Apache make some delicious looking outlines.


                                                        INSTALLATION
---------------------------------------------------------------------

First of all, prerequisites!

    - apache2
    - mod_perl2
    - libapreq2 (Apache2::Request)

Add the following lines in your httpd.conf, or in a
separate otl.conf in the apache Includes directory:

    -------------------------
    PerlSwitches -I/path/to/perl/libraries
    PerlModule Apache::OTL

    <FilesMatch ".*\.otl">
        SetHandler perl-script
        PerlResponseHandler Apache::OTL
    </FilesMatch>
    -------------------------

Doublecheck that your apreq2 module is setup to load, as well.

That's it.  Apache will now pretty-print all your otl files.


                                                            SETTINGS
---------------------------------------------------------------------

Settings for the otl_handler are stored on the first line of the otl
files themselves, prefixed by the 'user no wrap' character, '<'. See
the sample.otl for an example settings line.  All settings are entirely
optional.

title
    Type: string
    Default: filename

    The title of the OTL.  Used as a header, and the html title.
    If this is not set, the html title is derived from the filename.


style
    Type: string
    Default: none

    A path to css style(s).
    Comma separated values load different files in order.
    Media type defaults to 'screen', if the css name contains the
    string 'print' anywhere, the media type is changed to print.

    :style=/css/otl_style.css,/css/print_style.css

js
    Type: string
    Default: none

    Use javascript?  If set, loads an external javascript library.
    Comma separated values load diff files in order.


last_mod
    Type: boolean
    Default: 0

    Show modification time of the otl file?

    
legend
    Type: boolean
    Default: 0

    Display small legend for todo and done items?


sort
    Type: boolean
    Default: 0

    Show sort links?


sorttype
    Type: string
    Default: none

    Default sorting method.  Valid values are
        percent
        alpha


sortrev
    Type: boolean
    Default: 0

    Should we default to reverse sorting?


counts
    Type: boolean
    Default: 0

    Count and display sub items?


timer
    Type: boolean
    Default: 0

    Display how long the parser took to generate the html?



                                                      INCLUDED FILES
---------------------------------------------------------------------

/Apache/OTL.pm
    The mod_perl content handler.

/javascript/*
    Example (but functional!) javascript.  Create line numbers,
    various eye candies, and clickable folds.

    This requires the 'jquery.js' library, also included.

/sample.otl
    An example vimoutliner file, with optional settings.

/styles/*
    "Theme" examples for customizing OTL display.


                                                    ACKNOWLEDGEMENTS
---------------------------------------------------------------------

Thanks to Nathan Dabney <nathan.dabney@gmail.com> and
Michael Granger <ged@faeriemud.org> for their help and advice!

vimoutliner/scripts/otl_handler/sample.otl	[[[1
39
<:title=Sample OTL list :counts=1 :timer=1 :style=styles/theme1.css :legend=1 :last_mod=1

: Theme examples:
: <a href="sample.otl">basic</a> <a href="sample.otl?counts=0&amp;style=styles/theme2.css&amp;legend=0&amp;js=/javascript/jquery.js,/javascript/theme2.js">advanced</a> <a href="sample.otl?counts=0&amp;style=styles/theme3.css&amp;legend=0&amp;timer=0&amp;js=/javascript/jquery.js,/javascript/theme3.js&amp;sort=1">advanced2</a>

[_] 29% Things to get for party
	[_] 25% Food
		[_] Chips
		[_] Dips
		[X] Honey roasted peanuts
		[_] Sausage
	[_] 33% Party favors
		[_] Hats
		[_] Whistles
		[X] Beer bong

[_] 19% House projects
	[_] 25% Paint
		[_] 50% Buy supplies
			[_] Paint
			[X] Brushes
			[X] Trays 2006-09-14
			[_] Overalls
		[_] 0% Rooms done
			[_] Bathroom
			[_] Bedroom
				: Red?
	[_] 13% Upgrade electrical
		[_] 2 circuits to computer room
		[_] 40% Get equipment
			[X] Romex wire
			[_] Entry feed wire
				: How much of this do I really need? I should probably go out to the street and measure stuff.
				: Make sure the inspector has access to examine stuff on side of house.
			[_] Service meter
			[X] Grounding rods
			[_] Breakers
		[_] Learn about electricity
			[_] Don't die
vimoutliner/scripts/otl_handler/styles/theme1.css	[[[1
88

body
{
    width: 600px;
    font-size: 0.9em;
    font-family: sans;
}

ul
{
    list-style-type: none;
    line-height: 1.5em;
    padding-left: 20px;
}

.date
{
    font-size: 0.6em;
}

.outline
{
    margin-bottom: 30px;
}

.percent
{
    color: blue;
}

.comment, .counts
{
    font-size: 0.7em;
    line-height: 1em;
    padding-top: 2px;
    margin-bottom: 5px;
    font-family: sans;
}

.comment_pre
{  
    font-style: normal;
    font-family: courier;
    white-space: pre;
}

.counts
{
    margin-left: 10px;
}

.counts:before { content: "("; }
.counts:after  { content: ")"; }

.todo
{
    padding-left: 4px;
}

.done
{
    background-color: #f4f4f4;
    color: #777;
    padding-left: 4px;
}

.done:before
{
    font-size: 1.5em;
    color: green;
    content: "\2611  ";
}

.todo:before
{
    font-size: 1.5em;
    color: #777;
    content: "\2610  ";
}

.legend .todo, .legend .done { border: 0 }
.legend
{
    margin-bottom: 30px;
    margin-top: 20px;
}


vimoutliner/scripts/otl_handler/styles/theme2.css	[[[1
152

body
{
    background-color: #444;
    font: 11px/1.8em sans-serif;
    margin: 0;
    padding-bottom: 50px;
    color: #ccc;
}

a, a:visited
{
    text-decoration: none;
    color: #7f9ab5;
}

.header
{
    background-color: #aaa;
    padding: 3px 0 3px 120px;
    margin-top: 50px;
    color: #3a5f85;
    border-top: 5px solid #333;
    font-size: 20px;
    font-weight: bold;
}

.last_mod
{
    padding-left: 120px;
    background-color: #333;
    border-bottom: 1px solid #000;
    font-size: 0.85em;
    color: #999;
}

.percent
{
    display: none;
    color: #7f9ab5;
    font-weight: bold;
    position: absolute;
    left: 115px;
}

.linenum
{
    color: #7f9ab5;
    position: absolute;
    left: 0;
    font-size: 9px;
    font-weight: normal;
    font-style: normal;
    width: 60px;
    text-align: right;
}

.linenum-folded
{
    color: #666;
}

.timer
{
    color: #666;
    position: absolute;
    top: 5px;
    right: 10px;
}

.outline
{
    width: 400px;
    margin: 20px 0 0 150px;
    display: none;
    cursor: pointer;
}

.outline ul
{
    margin: 0;
    padding: 0 10px 0 5px;
    list-style-type: none;
}

.outline ul li
{
    padding: 0 0 0 10px;
    display: block;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
}

.outline ul li:hover
{
    color: #fff;
}

.outline ul li ul li
{
    border-left: 1px solid #666;
    color: #ccc;
    font-size: 11px;
    font-weight: normal;
}

.outline ul li ul li:hover
{
    border-left: 1px solid #aaa;
}

.done
{
    color: #777 !important;
    font-style: italic;
}

.done:after
{
    font-size: 0.9em;
    content: " (done)";
}

.comment
{
    padding-right: 2px !important;
    font-style: italic;
    border-top: 1px solid #666;
    border-bottom: 1px solid #666;
    border-right: 1px solid #666;
}

.comment_pre
{  
    font-style: normal;
    font-family: courier;
    white-space: pre;
}

.comment:hover
{
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
    border-right: 1px solid #aaa;
}

.selected
{
    background-color: #3d3d3d;
}

vimoutliner/scripts/otl_handler/styles/theme3.css	[[[1
109

body
{
    background-color: #acadc3;
    font: 12px Verdana, sans-serif;
    color: #000;
    text-align: center;
}

a, a:visited
{
    text-decoration: none;
    color: blue;
}

.header
{
    margin-top: 40px;
    font-size: 2em;
    font-weight: bold;
}

.header:after  { content: " ----|" }
.header:before { content: "|---- " }

.last_mod { font-size: .85em; }
.percent { font-weight: bold; }

.sort
{
    margin-bottom: 30px;
    font-size: .85em;
}

.outline
{
    cursor: pointer;
    float: left;
    padding: 20px;
    border: 1px solid #8082a9;
    margin-left: 10px;
    background-color: #ccc;
}

.outline:hover
{
    border: 1px solid #000;
}

.outline ul, #content ul
{
    padding: 0;
    margin: 0;
    list-style-type: none;
}

.outline ul li ul li { display: none; }

#content ul li ul { padding-left: 20px; }

#content ul li
{
    font-weight: bold;
    font-size: 1.5em;
    text-align: center;
    color: #3a3d85;
}

#content ul li ul li
{
    font-weight: normal;
    text-align: left;
    font-size: 10px;
    color: #000;
}

#content .done { color: #777; }
.comment { font-style: italic; }

#content ul li .percent { color: #ff7e00; }
#content ul li ul li .percent { color: #000; }

#content .comment
{
    font-style: italic;
    border-left: 1px solid #999;
    padding-left: 5px;
    margin-bottom: 3px;
}

#content .comment_pre
{  
    font-style: normal;
    font-family: courier;
    white-space: pre;
}

#content
{
    position: absolute;
    left: 15%;
    width: 60%;
    height: 80%;
    cursor: pointer;
    background-color: #fff;
    border: 2px solid #3a3d85;
    padding: 10px;
}

vimoutliner/scripts/otlgrep.py	[[[1
228
#!/usr/bin/python
# otlgrep.py
# grep an outline for a regex and return the branch with all the leaves.
#
# Copyright 2005 Noel Henson All rights reserved
#
# $Revision: 1.4 $
# $Date: 2006/02/19 18:10:46 $
# $Author: noel $
# $Source: /home/noel/active/otlgrep/RCS/otlgrep.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program searches an outline file for a branch that contains
#	a line matching the regex argument. The parent headings (branches) 
#	and the children (sub-branches and leaves) of the matching headings
#	are returned.
#
#	Examples
#	
#	Using this outline:
#
#	Pets
#	Indoor
#		Cats
#			Sophia
#			Hillary
#		Rats
#			Finley
#			Oliver
#		Dogs
#			Kirby
#	Outdoor
#		Dogs
#			Kirby
#			Hoover
#		Goats
#			Primrose
#			Joey
#
#	a grep for Sophia returns:
#
#	Indoor
#		Cats
#			Sophia
#
#	a grep for Dogs returns:
#
#	Indoor
#		Dogs
#			Kirby
#			Hoover
#	Outdoor
#		Dogs
#			Kirby
#			Hoover
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

###########################################################################
# include whatever mdules we need

import sys
from string import *
from re import *

###########################################################################
# global variables

debug = 0
ignorecase = 0
pattern = ""
inputfiles = [] 

###########################################################################
# function definitions# usage
#
# print debug statements
# input: string
# output: string printed to standard out

def dprint(*vals):
	global debug
	if debug != 0: print vals

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
   print
   print "Usage:"
   print "otlgrep.py [options] pattern [file...] "
   print "Options"
   print "    -i            Ignore case"
   print "    --version     Print version (RCS) information."
   print "    --help        Show help."
   print "[file...] is zero or more files to search. Wildcards are supported."
   print "          if no file is specified, input is expected on stdin."
   print "output is on STDOUT"
   print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
   print
   print "RCS"
   print " $Revision: 1.4 $"
   print " $Date: 2006/02/19 18:10:46 $"
   print " $Author: noel $"
   print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
  global debug, pattern, inputfiles, ignorecase
  if (len(sys.argv) == 1): 
    showUsage()
    sys.exit()()
  else:
    for i in range(len(sys.argv)):
      if (i != 0):
        if   (sys.argv[i] == "-d"): debug = 1	# test for debug flag
        elif (sys.argv[i] == "-i"): ignorecase = 1	# test for debug flag
        elif (sys.argv[i] == "-?"):		# test for help flag
	  showUsage()				# show the help
	  sys.exit()				# exit
        elif (sys.argv[i] == "--help"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "--version"):
	  showVersion()
	  sys.exit()
	elif (sys.argv[i][0] == "-"):
	  print "Error!  Unknown option.  Aborting"
	  sys.exit()
	else: 					# get the input file name
	  if (pattern == ""): pattern = sys.argv[i]
	  else: inputfiles.append(sys.argv[i])

# getLineLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  return(n)					# return the count + 1 (for level)

# processFile
# split an outline file
# input: file - the filehandle of the file we are splitting
# output: output files

def processFile(file):

  global debug, pattern, ignorecase

  parents = []
  parentprinted = []
  for i in range(10):
	  parents.append("")
	  parentprinted.append(0)

  matchlevel = 0
  line = file.readline()			# read the outline title
  						# and discard it
  line = file.readline()			# read the first parent heading
  while (line !=""):
	  level = getLineLevel(line)
	  parents[level] = line
	  parentprinted[level] = 0
	  if (ignorecase == 1): linesearch = search(pattern,lstrip(rstrip(line)),I)
	  else: linesearch = search(pattern,lstrip(rstrip(line)))
	  if (linesearch != None):
		  matchlevel = level
		  for i in range(level):	# print my ancestors
			  if (parentprinted[i] == 0):
				  print parents[i][:-1]
				  parentprinted[i] = 1
		  print parents[level][:-1]	# print myself
		  line = file.readline()
		  while (line != "") and (getLineLevel(line) > matchlevel):
			  print line[:-1]
			  line = file.readline()
	  else:
		  line = file.readline()

	
# main
# split an outline
# input: args and input file
# output: output files

def main():
  global inputfiles, debug
  getArgs()
  if (len(inputfiles) == 0):
		  processFile(sys.stdin)  
  else:
	  for i in range(len(inputfiles)):
		  file = open(inputfiles[i],"r")
		  processFile(file)  
		  file.close()

main()
vimoutliner/scripts/otlhead.sh	[[[1
12
#!/bin/bash
if [ "$#" -lt 1 ] ; then
	echo " Usage: otlhead level < file"
	echo "        Keep the number of levels specified, remove the rest."
	echo "        Great for generating summaries."
	echo "        level   - the number of levels to include"
	echo "        file    - an otl file"
	echo "        input   - standard in"
	echo "        output  - standard out"
	exit 0
fi
sed "/^\(\t\)\{$1\}.*$/ { D }" 
vimoutliner/scripts/otlreorder.py	[[[1
295
#!/usr/bin/python
# otlreorder.py
# Grep and reorder an outline for a regex and return the branch 
# with all the leaves.
#
# Copyright 2006 Noel Henson All rights reserved
#
# $Revision: 1.7 $
# $Date: 2008/09/17 21:34:25 $
# $Author: noel $
# $Source: /home/noel/active/otlreorder/RCS/otlreorder.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program searches an outline file for a branch that contains
#	a line matching the regex argument. The parent headings (branches) 
#	and the children (sub-branches and leaves) of the matching headings
#	are returned with the outline focused on the search term.
#
#	Examples
#	
#	Using this outline:
#
#	Pets
#	Indoor
#		Cats
#			Sophia
#			Hillary
#		Rats
#			Finley
#			Oliver
#		Dogs
#			Kirby
#	Outdoor
#		Dogs
#			Kirby
#			Hoover
#		Goats
#			Primrose
#			Joey
#
#	a reorder for Sophia returns:
#
#	Sophia
#		Indoor
#			Cats
#
#	a reorder for Dogs returns:
#
#	Dogs
#		Indoor
#			Kirby
#			Hoover
#		Outdoor
#			Kirby
#			Hoover
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

###########################################################################
# include whatever mdules we need

import sys
from string import *
from re import *

###########################################################################
# global variables

debug = 0
ignorecase = 0
pattern = ""
patterns = []
completePatterns = []
inputfile = ""
lines = []

###########################################################################
# function definitions# usage
#
# print debug statements
# input: string
# output: string printed to standard out

def dprint(*vals):
	global debug
	if debug != 0: print vals

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
   print
   print "Usage:"
   print "otlreorder.py [options] pattern [pattern...] [file]"
   print "Options"
   print "    -             use STDIN instead of file"
   print "    -i            Ignore case"
   print "    --version     Print version (RCS) information."
   print "    --help        Show help."
   print "[file...] is zero or more files to search. Wildcards are supported."
   print "          if no file is specified, input is expected on stdin."
   print "output is on STDOUT"
   print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
   print
   print "RCS"
   print " $Revision: 1.7 $"
   print " $Date: 2008/09/17 21:34:25 $"
   print " $Author: noel $"
   print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
  global debug, pattern, inputfile, ignorecase
  usestdin = 0
  if (len(sys.argv) == 1): 
    showUsage()
    sys.exit()()
  else:
    for i in range(len(sys.argv)):
      if (i != 0):
        if   (sys.argv[i] == "-d"): debug = 1	# test for debug flag
        elif (sys.argv[i] == "-"): usestdin = 1	# test for debug flag
        elif (sys.argv[i] == "-i"): ignorecase = 1	# test for debug flag
        elif (sys.argv[i] == "-?"):		# test for help flag
	  showUsage()				# show the help
	  sys.exit()				# exit
        elif (sys.argv[i] == "--help"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "--version"):
	  showVersion()
	  sys.exit()
	elif (sys.argv[i][0] == "-"):
	  print "Error!  Unknown option.  Aborting"
	  sys.exit()
	else: 					# get the input file name
	  patterns.append(sys.argv[i])
    if (usestdin == 0):
	    inputfile = patterns.pop()

# getLineLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  return(n+1)					# return the count + 1 (for level)

# processFile
# split an outline file
# input: file - the filehandle of the file we are splitting
# output: output files

def processFile(pattern):

  global lines, debug, ignorecase

  parents = []
  parentprinted = []

  parents.append("pattern")
  parentprinted.append(0)

  for i in range(10):
	  parents.append("")
	  parentprinted.append(0)

  matchlevel = 0

  i = 1
  while (i < len(lines)):
  	  line = lines[i]
	  level = getLineLevel(line)
	  line = "\t"+line
	  parents[level] = line
	  parentprinted[level] = 0
#	  if (ignorecase == 1): linesearch = search(pattern,lstrip(rstrip(line)),I)
#	  else: linesearch = search(pattern,lstrip(rstrip(line)))
#	  if (linesearch != None):
	  if (pattern == lstrip(rstrip(line))):
		  if parents[0] != lstrip(line):
			  parents[0] = lstrip(line)
			  parentprinted[0] = 0
		  matchlevel = level
		  # print my ancestors
		  for j in range(level):	
			  if (parentprinted[j] == 0):
				  print parents[j][:-1]
				  parentprinted[j] = 1
		  # print my decendents
		  i = i + 1
		  if i >= len(lines): return
		  line = lines[i]
		  level = getLineLevel(line)
		  while (i < len(lines)) and (getLineLevel(line) > matchlevel):
			  if (i < len(lines)):
				  line = lines[i]
				  level = getLineLevel(line)
				  if (level > matchlevel):
					  print line[:-1]
				  else: i = i - 1
			  i = i + 1
		  i = i - 1
	  i = i + 1
	
# getCompletePattern
# search lines for pattern matches to generate a specific list of patterns to search for
# input: pattern and lines
# output: patterns updated with specific, complete patterns

def getCompletePattern(pattern):
  global completePatterns, lines, debug, ignorecase
  for i in range(len(lines)):
  	  line = lines[i]
	  if (ignorecase == 1): linepattern = search(pattern,lstrip(rstrip(line)),I)
	  else: linepattern = search(pattern,lstrip(rstrip(line)))
	  if (linepattern != None):
		  completePatterns.append(lstrip(rstrip(line)))
		  if debug != 0: print lstrip(rstrip(line))

# getCompletePatterns
# search lines for pattern matches to generate a specific list of patterns to search for
# input: pattern and lines
# output: patterns updated with specific, complete patterns

def getCompletePatterns():
  global completePatterns, patterns, debug
  for i in range(len(patterns)):
	  getCompletePattern(patterns[i])
  if (debug!=0):
	  print "patterns:"
	  for i in range(len(patterns)): print patterns[i]
  # perform the equivalent of the sort | uniq
  completePatterns.sort()
  unionPatterns = set(completePatterns)
  unionPatterns.union(unionPatterns)
  completePatterns = list(unionPatterns)
  if (debug!=0):
	  print "complete patterns:"
	  for i in range(len(completePatterns)): print completePatterns[i]

# main
# split an outline
# input: args and input file
# output: output files

def main():
  global lines, inputfile, completePatterns, patterns, debug
  getArgs()
  if (len(inputfile) == 0):
	  line = sys.stdin.readline()
	  while (line != ""):
		  lines.append(line)
		  line = sys.stdin.readline()
  else:
	  file = open(inputfile,"r")
	  line = file.readline()
	  while (line != ""):
		  lines.append(line)
		  line = file.readline()
	  file.close()
  getCompletePatterns()
  for i in range(len(completePatterns)):
	  processFile(completePatterns[i])  
main()
vimoutliner/scripts/otlsplit.py	[[[1
216
#!/usr/bin/python
# otlslit.py
# split an outline into several files.
#
# Copyright 2005 Noel Henson All rights reserved
#
# $Revision: 1.9 $
# $Date: 2006/02/19 14:39:06 $
# $Author: noel $
# $Source: /home/noel/active/otlsplit/RCS/otlsplit.py,v $
# $Locker:  $

###########################################################################
# Basic function
#
#	This program accepts text outline files and splits them into
#	several smaller files. The output file names are produced from the
#	heading names of the parents.
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

###########################################################################
# include whatever mdules we need

import sys
from string import *
from re import *

###########################################################################
# global variables

debug = 0
subdir = ""
level = 1
title = 0
inputfile = ""

###########################################################################
# function definitions# usage
#
# print debug statements
# input: string
# output: string printed to standard out

def dprint(*vals):
	global debug
	if debug != 0: print vals

# usage
# print the simplest form of help
# input: none
# output: simple command usage is printed on the console
 
def showUsage():
   print
   print "Usage:"
   print "otlsplit.py [options] inputfile"
   print "Options"
   print "    -l level  The number of levels to split down to. The default is 1"
   print "    -D dir    Specifiy a target directory for the output files"
   print "    -t        Include a title line (the parerent heading) in split files"
   print "    -v        Print version (RCS) information."
   print "    -h        Show help."
   print "output is on STDOUT"
   print

# version
# print the RCS version information
# input: none
# output: RSC version information is printed on the console
 
def showVersion():
   print
   print "RCS"
   print " $Revision: 1.9 $"
   print " $Date: 2006/02/19 14:39:06 $"
   print " $Author: noel $"
   print

# getArgs
# Check for input arguments and set the necessary switches
# input: none
# output: possible console output for help, switch variables may be set

def getArgs():
  global debug, level, inputfile, title, subdir
  if (len(sys.argv) == 1): 
    showUsage()
    sys.exit()()
  else:
    for i in range(len(sys.argv)):
      if (i != 0):
        if   (sys.argv[i] == "-d"): debug = 1	# test for debug flag
        elif (sys.argv[i] == "-?"):		# test for help flag
	  showUsage()				# show the help
	  sys.exit()				# exit
        elif (sys.argv[i] == "-l"):		# test for the level flag
	  level = int(sys.argv[i+1])		# get the level
	  i = i + 1				# increment the pointer
        elif (sys.argv[i] == "-D"):		# test for the subdir flag
	  subdir = sys.argv[i+1]		# get the subdir
	  i = i + 1				# increment the pointer
  	elif   (sys.argv[i] == "-t"): title = 1	# test for title flag
        elif (sys.argv[i] == "--help"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-h"):
	  showUsage()
	  sys.exit()
        elif (sys.argv[i] == "-v"):
	  showVersion()
	  sys.exit()
	elif (sys.argv[i][0] == "-"):
	  print "Error!  Unknown option.  Aborting"
	  sys.exit()
	else: 					# get the input file name
          inputfile = sys.argv[i]

# getLineLevel
# get the level of the current line (count the number of tabs)
# input: linein - a single line that may or may not have tabs at the beginning
# output: returns a number 1 is the lowest

def getLineLevel(linein):
  strstart = lstrip(linein)			# find the start of text in line
  x = find(linein,strstart)			# find the text index in the line
  n = count(linein,"\t",0,x)			# count the tabs
  return(n)					# return the count + 1 (for level)

# convertSensitiveChars
# get the level of the current line (count the number of tabs)
# input: line - a single line that may or may not have tabs at the beginning
# output: returns a string

def convertSensitiveChars(line):
  line = lstrip(rstrip(line))
  line = sub('\W','_',line)
  return(line)			

# makeFileName
# make a file name from the string array provided
# input: line - a single line that may or may not have tabs at the beginning
# output: returns a string

def makeFileName(nameParts):

  global debug, level, subdir

  filename = ""
  for i in range(level):
	  filename = filename + lstrip(rstrip(convertSensitiveChars(nameParts[i]))) + "-"
  filename = filename[:-1]+ ".otl"
  if subdir != "": filename = subdir + "/" + filename
  return(lower(filename))			

# processFile
# split an outline file
# input: file - the filehandle of the file we are splitting
# output: output files

def processFile(file):

  global debug, level, title

  nameparts = []
  for i in range(10):
	  nameparts.append("")

  outOpen = 0

  line = file.readline()			# read the outline title
  						# and discard it
  line = file.readline()			# read the first parent heading
  dprint(level)
  while (line !=""):
	  linelevel = getLineLevel(line)
	  if (linelevel < level):
		if outOpen == 1: 
			ofile.close()
			outOpen = 0
	  	nameparts[linelevel] = line
		dprint(level,linelevel,line)
	  else:
		  if outOpen == 0: 
			  ofile = open(makeFileName(nameparts),"w")
			  outOpen = 1
			  if title == 1:
				  dprint("title:",title)
				  ofile.write(nameparts[level-1])
		  ofile.write(line[level:])
	  line = file.readline()
	
# main
# split an outline
# input: args and input file
# output: output files

def main():
  global inputfile, debug
  getArgs()
  file = open(inputfile,"r")
  processFile(file)  
  file.close()

main()
vimoutliner/scripts/otltail.sh	[[[1
15
#!/bin/bash
if [ "$#" -lt 1 ] ; then
	echo " Usage: otltail level < file"
	echo "	      Remove the specified number of parent headings."
	echo "	      This is a way to promote children. It is"
	echo "	      useful for converting a single outline into a"
	echo "	      number of pages for a web site or chapters for"
	echo "	      a book."
	echo "	      level   - the number of levels to include"
	echo "	      file    - an otl file"
	echo "	      input   - standard in"
	echo "	      output  - standard out"
	exit 0
fi
sed "/^\(\t\)\{$1\}.*$/! { D }" | sed "s/^\(\t\)\{$1\}//" 
vimoutliner/scripts/outline_calendar/2005.otl	[[[1
1472
January 2005
	2005_01_01 Sat
		To do
		Diary
		Timesheet
	2005_01_02 Sun
		To do
		Diary
		Timesheet
	2005_01_03 Mon
		To do
		Diary
		Timesheet
	2005_01_04 Tue
		To do
		Diary
		Timesheet
	2005_01_05 Wed
		To do
		Diary
		Timesheet
	2005_01_06 Thu
		To do
		Diary
		Timesheet
	2005_01_07 Fri
		To do
		Diary
		Timesheet
	2005_01_08 Sat
		To do
		Diary
		Timesheet
	2005_01_09 Sun
		To do
		Diary
		Timesheet
	2005_01_10 Mon
		To do
		Diary
		Timesheet
	2005_01_11 Tue
		To do
		Diary
		Timesheet
	2005_01_12 Wed
		To do
		Diary
		Timesheet
	2005_01_13 Thu
		To do
		Diary
		Timesheet
	2005_01_14 Fri
		To do
		Diary
		Timesheet
	2005_01_15 Sat
		To do
		Diary
		Timesheet
	2005_01_16 Sun
		To do
		Diary
		Timesheet
	2005_01_17 Mon
		To do
		Diary
		Timesheet
	2005_01_18 Tue
		To do
		Diary
		Timesheet
	2005_01_19 Wed
		To do
		Diary
		Timesheet
	2005_01_20 Thu
		To do
		Diary
		Timesheet
	2005_01_21 Fri
		To do
		Diary
		Timesheet
	2005_01_22 Sat
		To do
		Diary
		Timesheet
	2005_01_23 Sun
		To do
		Diary
		Timesheet
	2005_01_24 Mon
		To do
		Diary
		Timesheet
	2005_01_25 Tue
		To do
		Diary
		Timesheet
	2005_01_26 Wed
		To do
		Diary
		Timesheet
	2005_01_27 Thu
		To do
		Diary
		Timesheet
	2005_01_28 Fri
		To do
		Diary
		Timesheet
	2005_01_29 Sat
		To do
		Diary
		Timesheet
	2005_01_30 Sun
		To do
		Diary
		Timesheet
	2005_01_31 Mon
		To do
		Diary
		Timesheet
February 2005
	2005_02_01 Tue
		To do
		Diary
		Timesheet
	2005_02_02 Wed
		To do
		Diary
		Timesheet
	2005_02_03 Thu
		To do
		Diary
		Timesheet
	2005_02_04 Fri
		To do
		Diary
		Timesheet
	2005_02_05 Sat
		To do
		Diary
		Timesheet
	2005_02_06 Sun
		To do
		Diary
		Timesheet
	2005_02_07 Mon
		To do
		Diary
		Timesheet
	2005_02_08 Tue
		To do
		Diary
		Timesheet
	2005_02_09 Wed
		To do
		Diary
		Timesheet
	2005_02_10 Thu
		To do
		Diary
		Timesheet
	2005_02_11 Fri
		To do
		Diary
		Timesheet
	2005_02_12 Sat
		To do
		Diary
		Timesheet
	2005_02_13 Sun
		To do
		Diary
		Timesheet
	2005_02_14 Mon
		To do
		Diary
		Timesheet
	2005_02_15 Tue
		To do
		Diary
		Timesheet
	2005_02_16 Wed
		To do
		Diary
		Timesheet
	2005_02_17 Thu
		To do
		Diary
		Timesheet
	2005_02_18 Fri
		To do
		Diary
		Timesheet
	2005_02_19 Sat
		To do
		Diary
		Timesheet
	2005_02_20 Sun
		To do
		Diary
		Timesheet
	2005_02_21 Mon
		To do
		Diary
		Timesheet
	2005_02_22 Tue
		To do
		Diary
		Timesheet
	2005_02_23 Wed
		To do
		Diary
		Timesheet
	2005_02_24 Thu
		To do
		Diary
		Timesheet
	2005_02_25 Fri
		To do
		Diary
		Timesheet
	2005_02_26 Sat
		To do
		Diary
		Timesheet
	2005_02_27 Sun
		To do
		Diary
		Timesheet
	2005_02_28 Mon
		To do
		Diary
		Timesheet
March 2005
	2005_03_01 Tue
		To do
		Diary
		Timesheet
	2005_03_02 Wed
		To do
		Diary
		Timesheet
	2005_03_03 Thu
		To do
		Diary
		Timesheet
	2005_03_04 Fri
		To do
		Diary
		Timesheet
	2005_03_05 Sat
		To do
		Diary
		Timesheet
	2005_03_06 Sun
		To do
		Diary
		Timesheet
	2005_03_07 Mon
		To do
		Diary
		Timesheet
	2005_03_08 Tue
		To do
		Diary
		Timesheet
	2005_03_09 Wed
		To do
		Diary
		Timesheet
	2005_03_10 Thu
		To do
		Diary
		Timesheet
	2005_03_11 Fri
		To do
		Diary
		Timesheet
	2005_03_12 Sat
		To do
		Diary
		Timesheet
	2005_03_13 Sun
		To do
		Diary
		Timesheet
	2005_03_14 Mon
		To do
		Diary
		Timesheet
	2005_03_15 Tue
		To do
		Diary
		Timesheet
	2005_03_16 Wed
		To do
		Diary
		Timesheet
	2005_03_17 Thu
		To do
		Diary
		Timesheet
	2005_03_18 Fri
		To do
		Diary
		Timesheet
	2005_03_19 Sat
		To do
		Diary
		Timesheet
	2005_03_20 Sun
		To do
		Diary
		Timesheet
	2005_03_21 Mon
		To do
		Diary
		Timesheet
	2005_03_22 Tue
		To do
		Diary
		Timesheet
	2005_03_23 Wed
		To do
		Diary
		Timesheet
	2005_03_24 Thu
		To do
		Diary
		Timesheet
	2005_03_25 Fri
		To do
		Diary
		Timesheet
	2005_03_26 Sat
		To do
		Diary
		Timesheet
	2005_03_27 Sun
		To do
		Diary
		Timesheet
	2005_03_28 Mon
		To do
		Diary
		Timesheet
	2005_03_29 Tue
		To do
		Diary
		Timesheet
	2005_03_30 Wed
		To do
		Diary
		Timesheet
	2005_03_31 Thu
		To do
		Diary
		Timesheet
April 2005
	2005_04_01 Fri
		To do
		Diary
		Timesheet
	2005_04_02 Sat
		To do
		Diary
		Timesheet
	2005_04_03 Sun
		To do
		Diary
		Timesheet
	2005_04_04 Mon
		To do
		Diary
		Timesheet
	2005_04_05 Tue
		To do
		Diary
		Timesheet
	2005_04_06 Wed
		To do
		Diary
		Timesheet
	2005_04_07 Thu
		To do
		Diary
		Timesheet
	2005_04_08 Fri
		To do
		Diary
		Timesheet
	2005_04_09 Sat
		To do
		Diary
		Timesheet
	2005_04_10 Sun
		To do
		Diary
		Timesheet
	2005_04_11 Mon
		To do
		Diary
		Timesheet
	2005_04_12 Tue
		To do
		Diary
		Timesheet
	2005_04_13 Wed
		To do
		Diary
		Timesheet
	2005_04_14 Thu
		To do
		Diary
		Timesheet
	2005_04_15 Fri
		To do
		Diary
		Timesheet
	2005_04_16 Sat
		To do
		Diary
		Timesheet
	2005_04_17 Sun
		To do
		Diary
		Timesheet
	2005_04_18 Mon
		To do
		Diary
		Timesheet
	2005_04_19 Tue
		To do
		Diary
		Timesheet
	2005_04_20 Wed
		To do
		Diary
		Timesheet
	2005_04_21 Thu
		To do
		Diary
		Timesheet
	2005_04_22 Fri
		To do
		Diary
		Timesheet
	2005_04_23 Sat
		To do
		Diary
		Timesheet
	2005_04_24 Sun
		To do
		Diary
		Timesheet
	2005_04_25 Mon
		To do
		Diary
		Timesheet
	2005_04_26 Tue
		To do
		Diary
		Timesheet
	2005_04_27 Wed
		To do
		Diary
		Timesheet
	2005_04_28 Thu
		To do
		Diary
		Timesheet
	2005_04_29 Fri
		To do
		Diary
		Timesheet
	2005_04_30 Sat
		To do
		Diary
		Timesheet
May 2005
	2005_05_01 Sun
		To do
		Diary
		Timesheet
	2005_05_02 Mon
		To do
		Diary
		Timesheet
	2005_05_03 Tue
		To do
		Diary
		Timesheet
	2005_05_04 Wed
		To do
		Diary
		Timesheet
	2005_05_05 Thu
		To do
		Diary
		Timesheet
	2005_05_06 Fri
		To do
		Diary
		Timesheet
	2005_05_07 Sat
		To do
		Diary
		Timesheet
	2005_05_08 Sun
		To do
		Diary
		Timesheet
	2005_05_09 Mon
		To do
		Diary
		Timesheet
	2005_05_10 Tue
		To do
		Diary
		Timesheet
	2005_05_11 Wed
		To do
		Diary
		Timesheet
	2005_05_12 Thu
		To do
		Diary
		Timesheet
	2005_05_13 Fri
		To do
		Diary
		Timesheet
	2005_05_14 Sat
		To do
		Diary
		Timesheet
	2005_05_15 Sun
		To do
		Diary
		Timesheet
	2005_05_16 Mon
		To do
		Diary
		Timesheet
	2005_05_17 Tue
		To do
		Diary
		Timesheet
	2005_05_18 Wed
		To do
		Diary
		Timesheet
	2005_05_19 Thu
		To do
		Diary
		Timesheet
	2005_05_20 Fri
		To do
		Diary
		Timesheet
	2005_05_21 Sat
		To do
		Diary
		Timesheet
	2005_05_22 Sun
		To do
		Diary
		Timesheet
	2005_05_23 Mon
		To do
		Diary
		Timesheet
	2005_05_24 Tue
		To do
		Diary
		Timesheet
	2005_05_25 Wed
		To do
		Diary
		Timesheet
	2005_05_26 Thu
		To do
		Diary
		Timesheet
	2005_05_27 Fri
		To do
		Diary
		Timesheet
	2005_05_28 Sat
		To do
		Diary
		Timesheet
	2005_05_29 Sun
		To do
		Diary
		Timesheet
	2005_05_30 Mon
		To do
		Diary
		Timesheet
	2005_05_31 Tue
		To do
		Diary
		Timesheet
June 2005
	2005_06_01 Wed
		To do
		Diary
		Timesheet
	2005_06_02 Thu
		To do
		Diary
		Timesheet
	2005_06_03 Fri
		To do
		Diary
		Timesheet
	2005_06_04 Sat
		To do
		Diary
		Timesheet
	2005_06_05 Sun
		To do
		Diary
		Timesheet
	2005_06_06 Mon
		To do
		Diary
		Timesheet
	2005_06_07 Tue
		To do
		Diary
		Timesheet
	2005_06_08 Wed
		To do
		Diary
		Timesheet
	2005_06_09 Thu
		To do
		Diary
		Timesheet
	2005_06_10 Fri
		To do
		Diary
		Timesheet
	2005_06_11 Sat
		To do
		Diary
		Timesheet
	2005_06_12 Sun
		To do
		Diary
		Timesheet
	2005_06_13 Mon
		To do
		Diary
		Timesheet
	2005_06_14 Tue
		To do
		Diary
		Timesheet
	2005_06_15 Wed
		To do
		Diary
		Timesheet
	2005_06_16 Thu
		To do
		Diary
		Timesheet
	2005_06_17 Fri
		To do
		Diary
		Timesheet
	2005_06_18 Sat
		To do
		Diary
		Timesheet
	2005_06_19 Sun
		To do
		Diary
		Timesheet
	2005_06_20 Mon
		To do
		Diary
		Timesheet
	2005_06_21 Tue
		To do
		Diary
		Timesheet
	2005_06_22 Wed
		To do
		Diary
		Timesheet
	2005_06_23 Thu
		To do
		Diary
		Timesheet
	2005_06_24 Fri
		To do
		Diary
		Timesheet
	2005_06_25 Sat
		To do
		Diary
		Timesheet
	2005_06_26 Sun
		To do
		Diary
		Timesheet
	2005_06_27 Mon
		To do
		Diary
		Timesheet
	2005_06_28 Tue
		To do
		Diary
		Timesheet
	2005_06_29 Wed
		To do
		Diary
		Timesheet
	2005_06_30 Thu
		To do
		Diary
		Timesheet
July 2005
	2005_07_01 Fri
		To do
		Diary
		Timesheet
	2005_07_02 Sat
		To do
		Diary
		Timesheet
	2005_07_03 Sun
		To do
		Diary
		Timesheet
	2005_07_04 Mon
		To do
		Diary
		Timesheet
	2005_07_05 Tue
		To do
		Diary
		Timesheet
	2005_07_06 Wed
		To do
		Diary
		Timesheet
	2005_07_07 Thu
		To do
		Diary
		Timesheet
	2005_07_08 Fri
		To do
		Diary
		Timesheet
	2005_07_09 Sat
		To do
		Diary
		Timesheet
	2005_07_10 Sun
		To do
		Diary
		Timesheet
	2005_07_11 Mon
		To do
		Diary
		Timesheet
	2005_07_12 Tue
		To do
		Diary
		Timesheet
	2005_07_13 Wed
		To do
		Diary
		Timesheet
	2005_07_14 Thu
		To do
		Diary
		Timesheet
	2005_07_15 Fri
		To do
		Diary
		Timesheet
	2005_07_16 Sat
		To do
		Diary
		Timesheet
	2005_07_17 Sun
		To do
		Diary
		Timesheet
	2005_07_18 Mon
		To do
		Diary
		Timesheet
	2005_07_19 Tue
		To do
		Diary
		Timesheet
	2005_07_20 Wed
		To do
		Diary
		Timesheet
	2005_07_21 Thu
		To do
		Diary
		Timesheet
	2005_07_22 Fri
		To do
		Diary
		Timesheet
	2005_07_23 Sat
		To do
		Diary
		Timesheet
	2005_07_24 Sun
		To do
		Diary
		Timesheet
	2005_07_25 Mon
		To do
		Diary
		Timesheet
	2005_07_26 Tue
		To do
		Diary
		Timesheet
	2005_07_27 Wed
		To do
		Diary
		Timesheet
	2005_07_28 Thu
		To do
		Diary
		Timesheet
	2005_07_29 Fri
		To do
		Diary
		Timesheet
	2005_07_30 Sat
		To do
		Diary
		Timesheet
	2005_07_31 Sun
		To do
		Diary
		Timesheet
August 2005
	2005_08_01 Mon
		To do
		Diary
		Timesheet
	2005_08_02 Tue
		To do
		Diary
		Timesheet
	2005_08_03 Wed
		To do
		Diary
		Timesheet
	2005_08_04 Thu
		To do
		Diary
		Timesheet
	2005_08_05 Fri
		To do
		Diary
		Timesheet
	2005_08_06 Sat
		To do
		Diary
		Timesheet
	2005_08_07 Sun
		To do
		Diary
		Timesheet
	2005_08_08 Mon
		To do
		Diary
		Timesheet
	2005_08_09 Tue
		To do
		Diary
		Timesheet
	2005_08_10 Wed
		To do
		Diary
		Timesheet
	2005_08_11 Thu
		To do
		Diary
		Timesheet
	2005_08_12 Fri
		To do
		Diary
		Timesheet
	2005_08_13 Sat
		To do
		Diary
		Timesheet
	2005_08_14 Sun
		To do
		Diary
		Timesheet
	2005_08_15 Mon
		To do
		Diary
		Timesheet
	2005_08_16 Tue
		To do
		Diary
		Timesheet
	2005_08_17 Wed
		To do
		Diary
		Timesheet
	2005_08_18 Thu
		To do
		Diary
		Timesheet
	2005_08_19 Fri
		To do
		Diary
		Timesheet
	2005_08_20 Sat
		To do
		Diary
		Timesheet
	2005_08_21 Sun
		To do
		Diary
		Timesheet
	2005_08_22 Mon
		To do
		Diary
		Timesheet
	2005_08_23 Tue
		To do
		Diary
		Timesheet
	2005_08_24 Wed
		To do
		Diary
		Timesheet
	2005_08_25 Thu
		To do
		Diary
		Timesheet
	2005_08_26 Fri
		To do
		Diary
		Timesheet
	2005_08_27 Sat
		To do
		Diary
		Timesheet
	2005_08_28 Sun
		To do
		Diary
		Timesheet
	2005_08_29 Mon
		To do
		Diary
		Timesheet
	2005_08_30 Tue
		To do
		Diary
		Timesheet
	2005_08_31 Wed
		To do
		Diary
		Timesheet
September 2005
	2005_09_01 Thu
		To do
		Diary
		Timesheet
	2005_09_02 Fri
		To do
		Diary
		Timesheet
	2005_09_03 Sat
		To do
		Diary
		Timesheet
	2005_09_04 Sun
		To do
		Diary
		Timesheet
	2005_09_05 Mon
		To do
		Diary
		Timesheet
	2005_09_06 Tue
		To do
		Diary
		Timesheet
	2005_09_07 Wed
		To do
		Diary
		Timesheet
	2005_09_08 Thu
		To do
		Diary
		Timesheet
	2005_09_09 Fri
		To do
		Diary
		Timesheet
	2005_09_10 Sat
		To do
		Diary
		Timesheet
	2005_09_11 Sun
		To do
		Diary
		Timesheet
	2005_09_12 Mon
		To do
		Diary
		Timesheet
	2005_09_13 Tue
		To do
		Diary
		Timesheet
	2005_09_14 Wed
		To do
		Diary
		Timesheet
	2005_09_15 Thu
		To do
		Diary
		Timesheet
	2005_09_16 Fri
		To do
		Diary
		Timesheet
	2005_09_17 Sat
		To do
		Diary
		Timesheet
	2005_09_18 Sun
		To do
		Diary
		Timesheet
	2005_09_19 Mon
		To do
		Diary
		Timesheet
	2005_09_20 Tue
		To do
		Diary
		Timesheet
	2005_09_21 Wed
		To do
		Diary
		Timesheet
	2005_09_22 Thu
		To do
		Diary
		Timesheet
	2005_09_23 Fri
		To do
		Diary
		Timesheet
	2005_09_24 Sat
		To do
		Diary
		Timesheet
	2005_09_25 Sun
		To do
		Diary
		Timesheet
	2005_09_26 Mon
		To do
		Diary
		Timesheet
	2005_09_27 Tue
		To do
		Diary
		Timesheet
	2005_09_28 Wed
		To do
		Diary
		Timesheet
	2005_09_29 Thu
		To do
		Diary
		Timesheet
	2005_09_30 Fri
		To do
		Diary
		Timesheet
October 2005
	2005_10_01 Sat
		To do
		Diary
		Timesheet
	2005_10_02 Sun
		To do
		Diary
		Timesheet
	2005_10_03 Mon
		To do
		Diary
		Timesheet
	2005_10_04 Tue
		To do
		Diary
		Timesheet
	2005_10_05 Wed
		To do
		Diary
		Timesheet
	2005_10_06 Thu
		To do
		Diary
		Timesheet
	2005_10_07 Fri
		To do
		Diary
		Timesheet
	2005_10_08 Sat
		To do
		Diary
		Timesheet
	2005_10_09 Sun
		To do
		Diary
		Timesheet
	2005_10_10 Mon
		To do
		Diary
		Timesheet
	2005_10_11 Tue
		To do
		Diary
		Timesheet
	2005_10_12 Wed
		To do
		Diary
		Timesheet
	2005_10_13 Thu
		To do
		Diary
		Timesheet
	2005_10_14 Fri
		To do
		Diary
		Timesheet
	2005_10_15 Sat
		To do
		Diary
		Timesheet
	2005_10_16 Sun
		To do
		Diary
		Timesheet
	2005_10_17 Mon
		To do
		Diary
		Timesheet
	2005_10_18 Tue
		To do
		Diary
		Timesheet
	2005_10_19 Wed
		To do
		Diary
		Timesheet
	2005_10_20 Thu
		To do
		Diary
		Timesheet
	2005_10_21 Fri
		To do
		Diary
		Timesheet
	2005_10_22 Sat
		To do
		Diary
		Timesheet
	2005_10_23 Sun
		To do
		Diary
		Timesheet
	2005_10_24 Mon
		To do
		Diary
		Timesheet
	2005_10_25 Tue
		To do
		Diary
		Timesheet
	2005_10_26 Wed
		To do
		Diary
		Timesheet
	2005_10_27 Thu
		To do
		Diary
		Timesheet
	2005_10_28 Fri
		To do
		Diary
		Timesheet
	2005_10_29 Sat
		To do
		Diary
		Timesheet
	2005_10_30 Sun
		To do
		Diary
		Timesheet
	2005_10_31 Mon
		To do
		Diary
		Timesheet
November 2005
	2005_11_01 Tue
		To do
		Diary
		Timesheet
	2005_11_02 Wed
		To do
		Diary
		Timesheet
	2005_11_03 Thu
		To do
		Diary
		Timesheet
	2005_11_04 Fri
		To do
		Diary
		Timesheet
	2005_11_05 Sat
		To do
		Diary
		Timesheet
	2005_11_06 Sun
		To do
		Diary
		Timesheet
	2005_11_07 Mon
		To do
		Diary
		Timesheet
	2005_11_08 Tue
		To do
		Diary
		Timesheet
	2005_11_09 Wed
		To do
		Diary
		Timesheet
	2005_11_10 Thu
		To do
		Diary
		Timesheet
	2005_11_11 Fri
		To do
		Diary
		Timesheet
	2005_11_12 Sat
		To do
		Diary
		Timesheet
	2005_11_13 Sun
		To do
		Diary
		Timesheet
	2005_11_14 Mon
		To do
		Diary
		Timesheet
	2005_11_15 Tue
		To do
		Diary
		Timesheet
	2005_11_16 Wed
		To do
		Diary
		Timesheet
	2005_11_17 Thu
		To do
		Diary
		Timesheet
	2005_11_18 Fri
		To do
		Diary
		Timesheet
	2005_11_19 Sat
		To do
		Diary
		Timesheet
	2005_11_20 Sun
		To do
		Diary
		Timesheet
	2005_11_21 Mon
		To do
		Diary
		Timesheet
	2005_11_22 Tue
		To do
		Diary
		Timesheet
	2005_11_23 Wed
		To do
		Diary
		Timesheet
	2005_11_24 Thu
		To do
		Diary
		Timesheet
	2005_11_25 Fri
		To do
		Diary
		Timesheet
	2005_11_26 Sat
		To do
		Diary
		Timesheet
	2005_11_27 Sun
		To do
		Diary
		Timesheet
	2005_11_28 Mon
		To do
		Diary
		Timesheet
	2005_11_29 Tue
		To do
		Diary
		Timesheet
	2005_11_30 Wed
		To do
		Diary
		Timesheet
December 2005
	2005_12_01 Thu
		To do
		Diary
		Timesheet
	2005_12_02 Fri
		To do
		Diary
		Timesheet
	2005_12_03 Sat
		To do
		Diary
		Timesheet
	2005_12_04 Sun
		To do
		Diary
		Timesheet
	2005_12_05 Mon
		To do
		Diary
		Timesheet
	2005_12_06 Tue
		To do
		Diary
		Timesheet
	2005_12_07 Wed
		To do
		Diary
		Timesheet
	2005_12_08 Thu
		To do
		Diary
		Timesheet
	2005_12_09 Fri
		To do
		Diary
		Timesheet
	2005_12_10 Sat
		To do
		Diary
		Timesheet
	2005_12_11 Sun
		To do
		Diary
		Timesheet
	2005_12_12 Mon
		To do
		Diary
		Timesheet
	2005_12_13 Tue
		To do
		Diary
		Timesheet
	2005_12_14 Wed
		To do
		Diary
		Timesheet
	2005_12_15 Thu
		To do
		Diary
		Timesheet
	2005_12_16 Fri
		To do
		Diary
		Timesheet
	2005_12_17 Sat
		To do
		Diary
		Timesheet
	2005_12_18 Sun
		To do
		Diary
		Timesheet
	2005_12_19 Mon
		To do
		Diary
		Timesheet
	2005_12_20 Tue
		To do
		Diary
		Timesheet
	2005_12_21 Wed
		To do
		Diary
		Timesheet
	2005_12_22 Thu
		To do
		Diary
		Timesheet
	2005_12_23 Fri
		To do
		Diary
		Timesheet
	2005_12_24 Sat
		To do
		Diary
		Timesheet
	2005_12_25 Sun
		To do
		Diary
		Timesheet
	2005_12_26 Mon
		To do
		Diary
		Timesheet
	2005_12_27 Tue
		To do
		Diary
		Timesheet
	2005_12_28 Wed
		To do
		Diary
		Timesheet
	2005_12_29 Thu
		To do
		Diary
		Timesheet
	2005_12_30 Fri
		To do
		Diary
		Timesheet
	2005_12_31 Sat
		To do
		Diary
		Timesheet
vimoutliner/scripts/outline_calendar/vimrc	[[[1
31
" add the calendar tag file to the tag search stack
set tags^=~/Outlines/outline_calendar/vo_calendar_tags.tag

" open the calendar at date
" a:1 is executed before the jump
function ToDate(date, ...)
    let l:precmd = a:0>0 ? a:1 : ""
    exec l:precmd
    exec "tag " . a:date . "|normal zO"
endfunction 

" open the calendar at a requested date
" default is today
" a:1 is executed before the jump
function ToSomeDay(...)
    let l:precmd = a:0>0 ? a:1 : ""
    let l:today = strftime("%Y-%m-%d") 
    let l:date = input('Date To Goto (yyyy-mm-dd): ', today) 
    call ToDate(l:date, l:precmd)
endfunction

" small case jumps use same window
nmap <leader>td :call ToDate(strftime("%Y-%m-%d"))<cr>
nmap <leader>ts :call ToSomeDay()<cr>
nmap <leader>tc :call ToDate(expand("<cWORD>"))<cr>

" upper case jumps open new window
nmap <leader>tD :call ToDate(strftime("%Y-%m-%d"),"new")<cr>
nmap <leader>tS :call ToSomeDay("new")<cr>
nmap <leader>tC :call ToDate(expand("<cWORD>"),"new")<cr>

vimoutliner/scripts/outline_calendar/vo_calendar_ctags.conf	[[[1
9
--langdef=outline
--langmap=outline:.otl
--regex-outline=/_tag_ set ([^ ]+)/_tag_\1/
--regex-outline=/^\t+([1-9][0-9]{3})_([01][0-9])_([0-3][0-9])/\1-\2-\3/

--languages=-all,+outline
--recurse

--totals=yes
vimoutliner/scripts/outline_calendar/vo_calendar_generator.rb	[[[1
110
#!/usr/bin/ruby

# usage:
# calendar_generator.rb <calendar_folder> <years>

# indent for months, days are indented one more level
# both 0 and 1 make sense
MONTHINDENT = 0


# insert _tag_ todo and _tag_ done items under each day
# DIARY = ["Zu erledigen", "Tagebuch", "Abrechnen"]
# DIARY = [] # for empty days.
DIARY = ["To do", "Diary", "Timesheet"] # deluxe edition


# adapt to your preference
# Sunday should be first, Saturday last entry
# DAYNAMES = %w(So Mo Di Mi Do Fr Sa)
DAYNAMES = %w(Sun Mon Tue Wed Thu Fri Sat)


# January should be first, December last entry
# MONTHNAMES = %w(Januar Februar März April Mai Juni Juli August September Oktober November Dezember)
MONTHNAMES = %w(January February March April May June July August September October November December)

# you should not need to change anything below here
# but you are welcome to write equivalent functionality
# in your language of choice.
# ------------------------------------------------------------
require "date"

TAGFORMAT = "%.4d_%.2d_%.2d"


def indent(sublevel)
  "\t"*(MONTHINDENT+sublevel)
end

def month(date)
  MONTHNAMES[date.month - 1] + 
    (MONTHINDENT == 0 ? " " + date.year.to_s : "")
end

class Shelf
  def initialize(path)
    begin
      @shelf = File.readlines(path)
    rescue 
      @shelf = Array.new
    end
    @path = path
  end
  def parse
    unless @books
      @books = Hash.new
      (0...@shelf.size).step(2) do |i|
        @books[@shelf[i].strip] = @shelf[i+1].strip
      end
    end
  end
  def save()
    File.open(@path, "w") do |out|
      @books.sort.each do |key,value|
        out.puts(key)
        out.puts("\t" + value)
      end if @books
    end
  end
  def update(year)
    re = /^_tag_calendar_#{year}/
    unless @shelf.any? { |str| re.match(str) }
      parse
      @books["_tag_calendar_#{year}"] = "#{year}.otl"
      save
    end
  end
end

def update_shelf(year)
  shelf = Shelf.new(CALENDAR + "/vo_calendar_shelf.otl")
  shelf.update(year)
end

CALENDAR = ARGV.shift

ARGV.each do |arg|

  File.open(CALENDAR + "/" + arg + ".otl", "w") do |out|

    update_shelf(arg)
    year = arg.to_i
    d = Date.new(year, 1, 1)
    out.puts year if MONTHINDENT == 1

    while d.year == year
      out.puts indent(0) + month(d)
      month = d.month
      while d.month == month
        out.puts indent(1) + (TAGFORMAT % [d.year, d.month, d.day]) +
          " " + DAYNAMES[d.wday]
        DIARY.each do |item|
          out.puts indent(2) + item
        end
        d += 1
      end
    end

  end
end
vimoutliner/scripts/outline_calendar/vo_calendar_readme.otl	[[[1
195
Outline Calendar 1.3
	What's new
		in 1.3
			vimrc-script by Lee Bigelow for easy calendar access
			small modifications to this outline
			update from 1.2.2
				edit tagfile path in outline_calendar/vimrc
				add 'source .../outline_calendar/vimrc' to your ~/.vimrc
		in 1.2.2
			changed personal _tag_ set definition
				: it may appear anywhere, but takes only next space-delimited
				: word into account. The advantage is that I can set a tag
				: behind a calendar date and jump to the current week via
				: _tag_kalender
		in 1.2.1
			removed spurious underscores in td function
		in 1.2
			use ~/.vimoutlinerrc to avoid tagfile collisions
			,,d-dates usable as links into calendar
			calendar dates (almost) without syntactic noise
			update to documentation
		in 1.1
			we are almost vo_maketags.pl-compatible again
			you can use vo_calendar_shelf.otl to attach your calendar shelf to your outline tree
			files follow vimoutliner naming convention
			all installation files are kept within one directory
			minor refinements to console user interface
			defaults and samples are in English now
	Prerequisites
		ruby
			used for generating the skeleton calendar and the shelf
			could be replaced by perl, awk, python, ...
			maybe even by a shell script or a small forth program ;-)
		bash
			use of special variable expansion in shell-frontend
		ctags
			create the tags-file for interoutline links and calendar access
			regex support necessary
			$ ctags --version
				: Exuberant Ctags 5.5.1, Copyright (C) 1996-2003 Darren Hiebert
				: Compiled: Aug 15 2003, 21:06:30
				: Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
				: Optional compiled features: +wildcards, +regex
		vimoutliner
			you should already have it
	Known incompatibilities
		none
	Installation and Configuration
		Installation
			I recommend keeping all Outlines in one directory
				it's easier on ctags
			move the distribution folder there
				: $ mv outline_calendar ~/Outlines
			add another tag file to vim's lookup table
				the following line should go into $HOME/.vimrc
					: source ~/Outlines/outline_calendar/vimrc
			configure the various scripts (see below)
			source vo_calendar_ui.sh into your shell
				$HOME/.bashrc is probably a good place for this
				something like the following should do it
					$ . $HOME/Outlines/outline_calendar/vo_calendar_ui.sh
			you're ready to run
				try
					$ calgen 2005 2006 2007
						: you get three yearly calendars plus a shelf to
						: access them through _tag_xxx linking
					$ tagvout
						: this should create a tag file inside the outline
						: calendar directory
					$ td
						: now vimoutliner should be positioned on today
					$ vim
						in normal mode type \tS
							enter a date after the prompt and hit return
							the calendar should open in a new window
		Configure the calendar layout in vo_calendar_generator.rb
			Month layout
				with MONTHINDENT=1
					2006
						January
							_2006-01-01_ Sun
							_2006-01-02_ Mon
				or with MONTHINDENT=0
					January 2006
						_2006-01-01_ Sun
						_2006-01-02_ Mon
			Optional diary headings for each day
				with DIARY=[]
					_2006-01-01_ Sun
					_2006-01-02_ Mon
				with DIARY=["Todo", "Billing", "Personal notes"]
					_2006-01-01_ Sun
						Todo
						Billing
						Personal notes
					_2006-01-02_ Mon
						Todo
						Billing
						Personal notes
			change the language of the calendar
				DAYNAMES 
					names of weekdays starting with Sunday
				MONTHNAMES
					names of months
			calendar skeletons
				need not be generated with the ruby script
				but we do have an "API" to keep things compatible
					: I suggest an approach that can be executed in
					: the same way as my ruby script. If you did it
					: with perl, you could call the script
					: vo_calendar_generator.pl.
					: Its first command line parameter should be the
					: directory, where the calendar files are stored,
					: the remaining parameters denote the years, for which
					: calendar skeletons should be generated.
			calendar shelf
				do not edit manually, a really stupid parser (tm) is reading this
					: it contains the _tag_ format links into the various
					: yearly calendars. It is "parsed" (if you can call it
					: that) to insert a newly created calendar in the correct
					: position. 
		Configure the directory layout in vo_calendar_ui.sh
			See the comments there for further explanations
			Ideally you only have to set the variable OUTLINES, but YMMV
		Configure tag harvesting in vo_calendar_ctags.conf
			it should not need any changes
				if it does, "man 1 ctags" is your friend
			what it does, line by line
				define a new language called outline
				outline handling rules are applied only to .otl files
				recognise headings starting with "_tag_ set "
					everything after "_tag_ set " is considered as tag content
						: this provides an alternative way of defining tags
						: for both interoutline and intraoutline jumps.
						: It can safely be removed without harming the
						: outline calendar.
						: If you keep it, your non-calendar tags will be
						: stored in the calendar tagfile, too, but this should
						: not be a problem.
				recognise headings starting with a yyyy_mm_dd date
					Underscore as date separator
						are distinct from ,,d dates
							date stamps will not be jumped to
							date stamps will only be jumped from
						they are mangled to hyphens as tag marker
						plain ,,d dates can be used to enter the calendar from anywhere
						all dates typed by you are in ISO-format yyyy-mm-dd
				only tag outline files
				handle files in subdirectories, too
				show some impressive statistics
	Usage
		administrative
			once: install and configure (see above)
			rarely: generate a new calendar
				$ calgen 2005 2006 2007
					this will go a long way
			often: refresh the tag file
				$ tagvout
					you might even want to put it in your crontab
					don't rely on shell functions there, use plain commands
						modulo local changes the crontab entry would look like this:
							: */10 * * * * /usr/bin/ctags -f $HOME/.vimoutliner/vo_tags.tag --options=$HOME/Outlines/outline_calendar/vo_calendar_ctags.conf $HOME/Outlines &> /dev/null
						refresh tag file every 10 minutes
						remove the configuration line --totals, you won't need it there
		open calendar from running shell
			edit today's calendar entries
				$ td
					: vimoutliner should open on today
					: if you're running X, you'll get a gvim, otherwise a vim
					: you'll be on today's entry
				move around, add some items to the outline
				move cursor on a ISO-format date yyyy-mm-dd and <C-k> it
			edit any available day
				$ td 2005-05-04
					: release day
		open calendar from running vim session
			mappings for normal mode
				\td and \tD
					jump to today
				\tc and \tC
					jump to the date at the cursor position
				\ts and \tS
					ask for date to jump to
				Notes
					the mappings are defined as <leader>t...
					the uppercase variant opens a new window within the current session
	Author(s)
		(c) Stefan Schmiedl <s@xss.de> 2005-05-04
		Contributors:
			Lee Bigelow brought the \t? functions into existence
	License
		thou shalt neither sue nor blame me
			it's worth what you paid for it
		thou can do whatever else thou want to do with it
			just remember to have fun on the way
vimoutliner/scripts/outline_calendar/vo_calendar_shelf.otl	[[[1
6
_tag_calendar_2003
	2003.otl
_tag_calendar_2004
	2004.otl
_tag_calendar_2005
	2005.otl
vimoutliner/scripts/outline_calendar/vo_calendar_ui.sh	[[[1
39
# parent folder of all outlines
OUTLINES=$HOME/Outlines

# folder for calendar files
# should be a subfolder of $OUTLINES
CALENDAR=$OUTLINES/outline_calendar

# file for calendar tags
CALENDARTAGS=$CALENDAR/vo_calendar_tags.tag

# folders to tag for interoutline links and calendar access
# if $CALENDAR is not below $OUTLINES, you need
#   TAGFOLDERS=($OUTLINES $CALENDAR)
TAGFOLDERS=($OUTLINES)

# script to generate calendar skeletons
CALGENSCRIPT=$CALENDAR/vo_calendar_generator.rb

# option file for ctags
CTAGSOPTIONS=$CALENDAR/vo_calendar_ctags.conf


# you should not need to change anything below here
# that's what all the variables above are for
# ------------------------------------------------------------

function td() {
  local date
  date=${1:-`date +%Y-%m-%d`}
  ${DISPLAY:+g}vim -c ":ta $date" $CALENDAR/${date%%-*}.otl
}

function tagvout() {
  ctags -f $CALENDARTAGS --options=$CTAGSOPTIONS ${TAGFOLDERS[*]}
}

function calgen() {
  $CALGENSCRIPT $CALENDAR $*
}
vimoutliner/scripts/outline_freemind/freemind_outline.py	[[[1
44
'''Converts a freemind xml .mm file to an outline file compatable with vim 
outliner.

Make sure that you check that round trip on your file works.

Author: Julian Ryde
'''
import sys
from xml.etree.ElementTree import XMLParser
import textwrap

class Outline:                     # The target object of the parser
    depth = -1
    indent = '\t'
    current_tag = None
    def start(self, tag, attrib):  # Called for each opening tag.
        self.depth += 1
        self.current_tag = tag
        # print the indented heading
        if tag == 'node' and self.depth > 1:
            #if 'tab' in attrib['TEXT']:
                #import pdb; pdb.set_trace()
            print (self.depth-2)*self.indent + attrib['TEXT']
    def end(self, tag):            # Called for each closing tag.
        self.depth -= 1
        self.current_tag = None
    def data(self, data):
        if self.current_tag == 'p':
            bodyline = data.rstrip('\r\n')
            bodyindent = (self.depth-5)*self.indent + ": "
            #textlines = textwrap.wrap(bodytext, width=77-len(bodyindent), break_on_hyphens=False)
            #for line in textlines: 
            print bodyindent + bodyline

    def close(self):    # Called when all data has been parsed.
        pass

outline = Outline()
parser = XMLParser(target=outline)

fname = sys.argv[1]
filelines = open(fname).readlines()
parser.feed(''.join(filelines))
parser.close()
vimoutliner/scripts/outline_freemind/otl.py	[[[1
26
# Some integer IDs
# headings are 1, 2, 3, ....
bodynowrap = -1 # ;
bodywrap = 0 # :

def level(line):
    '''return the heading level 1 for top level and down and 0 for body text'''
    if line.lstrip().find(':')==0: return bodywrap
    if line.lstrip().find(';')==0: return bodynowrap 
    strstart = line.lstrip() # find the start of text in lin
    x = line.find(strstart)  # find the text index in the line
    n = line.count("\t",0,x) # count the tabs
    return(n+1)              # return the count + 1 (for level)

def is_bodywrap(line):
    return level(line) == bodywrap

def is_bodynowrap(line):
    return level(line) == bodynowrap

def is_heading(line):
    return level(line) > 0

def is_body(line):
    return not is_heading(line)

vimoutliner/scripts/outline_freemind/otl.pyc	[[[1
4
ó
]óâLc           @   s=   d  Z  d Z d   Z d   Z d   Z d   Z d   Z d S(   iÿÿÿÿi    c         C   sv   |  j    j d  d k r t S|  j    j d  d k r> t S|  j    } |  j |  } |  j d d |  } | d S(   sE   return the heading level 1 for top level and down and 0 for body textt   :i    t   ;s   	i   (   t   lstript   findt   bodywrapt
   bodynowrapt   count(   t   linet   strstartt   xt   n(    (    sV   /Users/israel/Documents/Source/vimoutliner/vimoutliner/scripts/outline_freemind/otl.pyt   level   s      c         C   s   t  |   t k S(   N(   R   R   (   R   (    (    sV   /Users/israel/Documents/Source/vimoutliner/vimoutliner/scripts/outline_freemind/otl.pyt   is_bodywrap   s    c         C   s   t  |   t k S(   N(   R   R   (   R   (    (    sV   /Users/israel/Documents/Source/vimoutliner/vimoutliner/scripts/outline_freemind/otl.pyt   is_bodynowrap   s    c         C   s   t  |   d k S(   Ni    (   R   (   R   (    (    sV   /Users/israel/Documents/Source/vimoutliner/vimoutliner/scripts/outline_freemind/otl.pyt
   is_heading   s    c         C   s   t  |   S(   N(   R   (   R   (    (    sV   /Users/israel/Documents/Source/vimoutliner/vimoutliner/scripts/outline_freemind/otl.pyt   is_body   s    N(   R   R   R   R   R   R   R   (    (    (    sV   /Users/israel/Documents/Source/vimoutliner/vimoutliner/scripts/outline_freemind/otl.pyt   <module>   s   					
vimoutliner/scripts/outline_freemind/outline_freemind.py	[[[1
113
'''Read in an otl file and generate an xml mind map viewable in freemind

Make sure that you check that round trip on your file works.

Author: Julian Ryde
'''

import sys
import os
import xml.etree.ElementTree as et
import otl

fname = sys.argv[1]
max_length = 40
depth = 99

debug = False

# TODO body text with manual breaks
# TODO commandline arguments for depth, maxlength etc.
# TODO do not read whole file into memory?
# TODO handle decreasing indent by more than one tab 
# TODO handle body text lines sometimes not ending with space

otlfile = open(fname)
indent = '  '

def attach_note(node, textlines):
    et.ElementTree
    # Format should look like
    #<richcontent TYPE="NOTE">
    #<html>
    #  <head> </head>
    #  <body>
    #  %s
    #  </body>
    #</html>
    #</richcontent>
    notenode = et.SubElement(node, 'richcontent')
    notenode.set('TYPE', 'NOTE')
    htmlnode = et.SubElement(notenode, 'html')
    headnode = et.SubElement(htmlnode, 'head')
    bodynode = et.SubElement(htmlnode, 'body')
    for line in textlines:
        pnode = et.SubElement(bodynode, 'p')
        pnode.text = line

# node ID should be based on the line number of line in the otl file for easier 
# debugging
#for lineno, line in enumerate(open(fname)): 
# enumerate starts at 0 I want to start at 1
lineno = 0

mapnode = et.Element('map')
mapnode.set('version', '0.9.0')

topnode = et.SubElement(mapnode, 'node')
topnode.set('TEXT', fname)

parents = [mapnode, topnode]

#left_side = True # POSITION="right"

# read otl file into memory
filelines = open(fname).readlines()

# remove those that are too deep or body text and pesky end of line characters
#filelines = [line.rstrip('\r\n') for line in filelines if otl.level(line) <= depth]
#filelines = [line for line in filelines if otl.is_heading(line)]

# first handle the body texts turn it into a list of headings with associated 
# body text for each one this is because the body text especially multi-line is 
# what makes it awkward.
headings = []
bodytexts = []
for line in filelines:
    if otl.is_heading(line):
        headings.append(line)
        bodytexts.append([])
    else:
        # TODO this ': ' removal should go in otl.py?
        bodytexts[-1].append(line.lstrip()[2:] + '\n')

#import pdb; pdb.set_trace()
oldheading = ''
for heading, bodytext in zip(headings, bodytexts):
    if debug: print heading, bodytext

    level = otl.level(heading)
    oldlevel = otl.level(oldheading)

    if level == oldlevel:
        pass
    elif level > oldlevel:
        # about to go down in the hierarchy so add this line as a parent to the 
        # stack
        parents.append(node)
    elif level < oldlevel:
        # about to go up in the hierarchy so remove parents from the stack
        leveldiff = oldlevel - level
        parents = parents[:-leveldiff]

    node = et.SubElement(parents[-1], 'node')
    node.set('TEXT', heading.lstrip().rstrip('\r\n'))
    #if len(bodytext) > 0:
    attach_note(node, bodytext)

    oldheading = heading

xmltree = et.ElementTree(mapnode)
xmltree.write(sys.stdout, 'utf-8')
#xmltree.write('test.mm')
print
vimoutliner/scripts/outline_freemind/test.otl	[[[1
27
A
	: This is some early multi-line body text which should wrap. This is some 
	: early multi-line body text which should wrap. This is some early 
	: multi-line body text which should wrap. 
	a
		: single line body text
	b
		1
	c
B
	d
		2
		3
		4
C

This is a very long heading line that should be longer than the wrap width and so tests this case
Heading with a 	tab in the middle
	: body text with tab 	in it
Body text with empy line in it
	: First line
	: 
	: Third line
Difficult characters
	[_] ' " &
Last line body text
	: This is a last line of body text
vimoutliner/scripts/outline_freemind/test.sh	[[[1
6
outputdir=/tmp
#fname=$1
fname=test.otl
python outline_freemind.py $fname > $outputdir/test.mm
python freemind_outline.py $outputdir/test.mm > $outputdir/return.otl
diff $fname $outputdir/return.otl
vimoutliner/scripts/test.txt	[[[1
17
Pets
Indoor
	Cats
		Sophia
		Hillary
	Rats
		Finley
		Oliver
	Dogs
		Kirby
Outdoor
	Dogs
		Kirby
		Hoover
	Goats
		Primrose
		Joey
vimoutliner/scripts/test1.txt	[[[1
17
Pets
Indoor
	Cats
		Sophia
		Hillary
	Rats
		Finley
		Oliver
	Dogs
		Kirby
Outdoor
	Dogs
		Kirby
		Hoover
	Goats
		Primrose
		Joey
vimoutliner/scripts/test2.txt	[[[1
17
Pets
Indoor
	Cats
		Sophia
		Hillary
	Rats
		Finley
		Oliver
	Dogs
		Kirby
Outdoor
	Dogs
		Kirby
		Hoover
	Goats
		Primrose
		Joey
vimoutliner/scripts/vo_grep.vim	[[[1
62
function! s:grep(pattern, first_line, last_line)
  let result = []
  let parents = range(10)
  let parent_printed = range(10)
  let linenr = a:first_line
  while linenr <= a:last_line
    let line = getline(linenr)
    let level = indent(linenr)
    let parents[level] = line
    let parent_printed[level] = 0
    "echom 'while: '.line
    if match(line, a:pattern) != -1
      let match_level = level
      for i in range(level)
        if parent_printed[i] == 0
          "echom parents[i]
          call add(result, parents[i])
          "echom string(result)
          let parent_printed[i] = 1
        endif
      endfor
      "echom parents[level]
      call add(result, parents[level])
      while linenr < a:last_line && indent(linenr+1) > match_level
        let linenr += 1
        "echom getline(linenr)
        call add(result, getline(linenr))
      endwhile
    endif
    let linenr += 1
  endwhile
  return result
endfunction

function! s:main(pattern, ...) range
  let result = []
  if a:0
    for file_pat in a:000
      for file in split(glob(file_pat), "\n")
        exec 'edit '.file
        let result += s:grep(a:pattern, a:firstline, a:lastline)
      endfor
    endfor
  else
    let result += s:grep(a:pattern, a:firstline, a:lastline)
  endif
  if result == []
    echom 'VOgrep: No matches found.'
    return
  endif
  new
  if append(0, result) == 1
    bd!
    echohl ErrorMsg
    echom 'VOgrep: There was an error while inserting the results.'
    echohl Normal
    return
  endif
  $d
endfunction

command! -bar -range=% -nargs=+ -complete=file VOgrep <line1>,<line2>call <SID>main(<f-args>)
vimoutliner/scripts/vo_maketags.pl	[[[1
339
#!/usr/bin/perl -w
# #######################################################################
# vo_maketags.pl: Vim outline tagging system, main program, version 0.3.5
#   Copyright (C) 2001-2003, 2011 by Steve Litt (slitt@troubleshooters.com)
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# Steve Litt, slitt@troubleshooters.com, http://www.troubleshooters.com
# #######################################################################

# #######################################################################
# #######################################################################
# #######################################################################
# HISTORY
# V0.1.0 Pre-alpha
#     Starting at a "top level" indent-defined Vim outline, this
#     program finds all "tags" defined as headlines starting with
#     _tag_, and containing a subheadline containing the file
#     to which the tag should jump. This program creates a tags
#     file.
#Steve Litt, 5/28/2001
#End of version 0.1.0
#
# V0.1.1 Pre-alpha
#     Bug fixes, including ../ resolution
#
#Steve Litt, 5/28/2001
#End of version 0.1.1
#
#
# V0.1.2 Pre-alpha
#	More bug fixes, and facility to create a new outline
#	file from a tag whose corresponding file doesn't yet
#	exist.  
#Steve Litt, 5/30/2001
#End of version 0.1.2
#
# V0.1.3 Pre-alpha
#	More bug fixes. This was the first version released
#	file from a tag whose corresponding file doesn't yet
#	exist.  
#Steve Litt, 6/01/2001
#End of version 0.1.3
#
# V0.2.0 Pre-alpha
#Steve Litt, 12/03/2002
#	This file unchanged. The overall Vimoutliner version
#	0.2.0 has extensive improvements, including intuitive
#	collapse/expand.
#End of version 0.2.0
#END OF HISTORY
#
#
# V0.1.2 Pre-alpha
#	More bug fixes, and facility to create a new outline
#	file from a tag whose corresponding file doesn't yet
#	exist.  
#Steve Litt, 5/30/2001
#End of version 0.1.2
# V0.3.5 release 20110303
#       Changed vo_tags.tag directory from
#       $HOME/.vimoutliner/
#       to
#       $HOME/.vim/vimoutliner/
#Steve Litt, 3/3/2011
#End of version 0.3.5 release 20110303
#END OF HISTORY
#
# #######################################################################


use strict;
use vars qw($TAGFILENAME);
use Cwd;

$TAGFILENAME = $ENV{"HOME"} . "/.vim/vimoutliner/vo_tags.tag";
##### OLD LOCATION BELOW, REMOVE IN 0.3.6, COMMENT FOR NOW
#$TAGFILENAME = $ENV{"HOME"} . "/.vimoutliner/vo_tags.tag";

sub process1Outline($$); #Early prototype the recursive routine
sub makeDirectory($);    #Early prototype the recursive routine

sub makeTagFileStartingAt($)
	{
	unless(@ARGV == 1)
		{
		usage();
		die;
		}
	my($absoluteFileName) =  deriveAbsoluteFileName(Cwd::cwd(), $_[0]);
	
	my(%processedFiles) = ();
	recordFileAsProcessed($absoluteFileName,\%processedFiles);
	unlink $TAGFILENAME;
	process1Outline($absoluteFileName, \%processedFiles);
	sortAndDeleteDupsFromTagFile();
	}

sub sortAndDeleteDupsFromTagFile()
	{
	my($TEMPTAGFILENAME) = "$ENV{'HOME'}/temptagfile.tag";
	system("sort $TAGFILENAME | uniq > $TEMPTAGFILENAME"); 
	system("rm $TAGFILENAME");
	system("mv $TEMPTAGFILENAME $TAGFILENAME");
	}


sub process1Outline($$)
	{
	my($fileName) = $_[0];
	my($processedFilesHashRef) = $_[1];
	
	unless(fileExists($fileName))
		{
		makeDirectory($fileName);
		makeEmptyFile($fileName);
		}

	print "Begin processing file $fileName.\n";

	my($baseDirectory) = getBaseDirectory($fileName);
	my(%tags) = getTagsFromFile($fileName);
	my(@tagKeys) = keys(%tags);
	my($tagKey);
	foreach $tagKey (@tagKeys)
		{
		my($absoluteFileName);
		if(isAbsoluteFilePath($tags{$tagKey}))
			{
			$absoluteFileName = $tags{$tagKey};
			}
		else
			{
			$absoluteFileName =
			 deriveAbsoluteFileName($baseDirectory, $tags{$tagKey});
			}
		appendTagToTagFile($tagKey,$absoluteFileName);
 		if(notProcessedYet($absoluteFileName, $processedFilesHashRef))
 			{
			recordFileAsProcessed($absoluteFileName,$processedFilesHashRef);
 			process1Outline($absoluteFileName, $processedFilesHashRef);
 			}
		}
	}

sub appendTagToTagFile($$)
	{
	open(TAGFILE, ">>$TAGFILENAME");
	print TAGFILE "$_[0]	$_[1]	:1\n";
	close(TAGFILE);
	}


sub makeEmptyFile($)
	{
	open(OUTLINEFILE, ">" . $_[0]);
	close(OUTLINEFILE);
	}


sub makeDirectory($)
	{
	my($completeFileName) = $_[0];
	my($directoryName) = ($completeFileName =~ m/^(.*?)[^\/]*$/);
	unless($directoryName eq "")
		{
		my($temp) = ($directoryName =~ m/^(.*).$/);
		makeDirectory($temp);
		print "Creating $directoryName...";
		if(mkdir $directoryName)
			{
			print " succeeded.\n";
			}
		else
			{
			print " no action: $!.\n";
			}
		}
	}

sub fileExists($)
	{
	my($outlineFileName) = $_[0];
	my($success) = open(OUTLINEFILE, "<" . $outlineFileName);
	if($success)
		{
		close(OUTLINEFILE);
		return(1);
		}
	else
		{
		return(0);
		}
	}

sub getTagsFromFile($)
	{
	my($outlineFileName) = $_[0];
	my(%tags);
	my($tagString) = "";
	my($success) = open(OUTLINEFILE, "<" . $outlineFileName);
	unless($success)
		{
		print "Failed to open $outlineFileName\n";
		return(());
		}
	while(<OUTLINEFILE>)
		{
		my($line) = $_;
		chomp($line);
		if($line =~ m/^\s*(_tag_\S+)/)
			{
			$tagString = $1;
			}
		elsif($tagString ne "")
			{
			$line =~ m/^\s*(\S+)/;
			my($filename) = $1;
			$tags{$tagString} =
			  deriveAbsoluteFileName(getBaseDirectory($_[0]), $1);
			$tagString = "";
			}
		}	
	return(%tags);
	}

sub recordFileAsProcessed($$)
	{
	my($absoluteFileName) = $_[0];
	my($processedFilesHashRef) = $_[1];
	${$processedFilesHashRef}{$absoluteFileName} = "1";
	}

sub notProcessedYet($$)
	{
        my($absoluteFileName) = $_[0];
	my(%processedFiles) = %{$_[1]};
	if(defined($processedFiles{$absoluteFileName}))
		{
		return(0);
		}
	else
		{
		return(1);
		}
	}

sub dia($)
	{
	print "dia " . $_[0] . "\n";
	}


sub isAbsoluteFilePath($)
	{
	if($_[0] =~ m/^\//)
		{
		return 1;
		}
	else
		{
		return 0;
		}
	}

sub getFileNameOnly($)
	{ 
	my($fileString); 
	if ($_[0] =~ m/.+\/(.*)$/)
		{
		$fileString= $1
		}
	else
		{
		$fileString = $_[0];
		}

	return $fileString;
	}

sub getBaseDirectory($)
	{ 
	my($dirString) = ($_[0] =~ m/(.+\/).*$/);
	return $dirString;
	}

sub deriveAbsoluteFileName($$)
	{
	my($absoluteFileName);
	my($baseDirectory) = $_[0];
	my($passedFileName) = $_[1];
	unless($baseDirectory =~ m/\/$/)
		{
		$baseDirectory= $baseDirectory . "/"; 
		}
	if($passedFileName =~ m/^\//)
		{
		$absoluteFileName = $passedFileName;
		}
	else
		{
		$absoluteFileName = $baseDirectory . $passedFileName;
		}

	$absoluteFileName =~ s/\/\.\//\//g;  #remove all "./";
	deleteDoubleDots($absoluteFileName);

	return($absoluteFileName);
	}

sub deleteDoubleDots($)
	{
	while($_[0] =~ m/\.\./)
		{
		$_[0] =~ s/\/[^\/]*\/\.\.//;
		}
	}

sub usage()
	{
	print "\nUsage is:\n";
	print "otltags topLevelOutlineFileName\n\n";
	}
	

makeTagFileStartingAt($ARGV[0])

README	[[[1
85
VimOutliner is an outline processor with many of the same features
as Grandview, More, Thinktank, Ecco, etc. Features include tree
expand/collapse, tree promotion/demotion, level sensitive colors,
interoutline linking, and body text.

What sets VimOutliner apart from the rest is that it's been constructed
from the ground up for fast and easy authoring.  Keystrokes are quick and
easy, especially for someone knowing the Vim editor. VimOutliner can be
used without the mouse (but is supported to the extent that Vim supports
the mouse). 

Many of the VimOutliner commands start with a double comma ",,"
because that's very quick to type. All VimOutliner files have the ".otl"
extension. For an overview of the VimOutliner commands you can type ":h
vo_cheatsheet" when you have opened an otl file. For help on VimOutliner
type ":h vo".


* Usage

VimOutliner has been reported to help with the following tasks:

    - Project management
    - Password wallet
    - To-do lists
    - Account and cash book
    - 'Plot device' for writing novels
    - Inventory control
    - Hierarchical database
    - Web site managment

* Characteristics

    - Fast and effective
    - Fully integrated with Vim
    - Extensible through plugins
    - Many post-processing scripts  allow exporting to multiple formats
    - Extensive documentation

For more information on the use of VimOutliner see the README.detailed
file in this directory.


Installation details

To install from the zip file in this page do the following (exchange
"x" with version number from the package you have downloaded):

$ unzip vimoutliner-0.3.x.zip $ cd vimoutliner-0.3.x $ sh install.sh

gzip and vimball archives are available here:

https://github.com/vimoutliner/vimoutliner/downloads


To install from the gzip archive follow these steps:

$ tar -xzvf vimoutliner-0.3.x.tgz $ cd vimoutliner-0.3.x $ sh install.sh

Installing from the vimball archive does not require of external
utilities, just open vimoutliner-0.3.x.vba with Vim and type the following
command to install in your home vim folder:

:so %

If you want to install it in other folder use the following command:

:UseVimball path/to/folder

NOTE: If you install from a vimball archive you need to set the executable
permissions for the scripts in ~/vim/vimoutliner/script (like chmod +x
<script> in Linux/Mac OS X).

Download of all packages can also be done from the Freshmeat site:

 http://freshmeat.net/projects/vimoutliner       


For more detailed installation instructions see the INSTALL file in
this directory.





README.detailed	[[[1
1300
*vo_readme.txt*	For Vim version 7.1	Last change: 2011 March 25

                                                                *vo* *vimoutliner*
The VimOutliner  0.3.6 ~

VimOutliner is an outline processor designed with lighting fast authoring as
the main feature, it also has many of the same features as Grandview, More,
Thinktank, Ecco, etc. These features include tree expand/collapse, tree
promotion/demotion, level sensitive colors, interoutline linking, checkboxes
and body text.


  License                                                       |vo-license|
  Version                                                       |vo-version|
  Installing and testing VimOutliner                            |vo-install|
      Automatic method                                     |vo-auto-install|
      Updating                                                 |vo-updating|
      Manual method                                      |vo-manual-install|
      Color schemes                                               |vo-color|
      Testing                                                   |vo-testing|
      Debian                                                     |vo-debian|
  Using VimOutliner on other file types                     |vo-other-files|
  Troubleshooting                                       |vo-troubleshooting|
  VimOutliner philosophy                                     |vo-philosophy|
  Running VimOutliner                                           |vo-running|
      Comma comma commands                                      |vo-command|
      Basic VimOutliner activities                           |vo-activities|
      Menu                                                         |vo-menu|
      Vim Outliner objects                                      |vo-objects|
      Post Processors                                   |vo-post-processors|
  Advanced                                                     |vo-advanced|
      Executable Lines                                 |vo-executable-lines|
  Plugins                                                       |vo-plugins|
      Checkboxes                                               |vo-checkbox|
      Hoisting                                                 |vo-hoisting|
  Scripts                                                       |vo-scripts|
      vo_maketags.pl                                           |vo-maketags|
      otl2html.py                                                 |otl2html|
  Other information                                          |vo-other-info|


==============================================================================
License                                                             *vo-license*


VimOutliner Copyright (C) 2001, 2003 by Steve Litt
            Copyright (C) 2004 by Noel Henson
Licensed under the GNU General Public License (GPL), version 2
Absolutely no warranty, see COPYING file for details.

If your distro doesn't come with this file
    HTML: http://www.gnu.org/copyleft/gpl.html
    Text: http://www.gnu.org/copyleft/gpl.txt


==============================================================================
Installing and Testing VimOutliner                                  *vo-install*


    Automatic Method                |vo-auto-install|
    Updating                        |vo-updating|
    Manual Method                   |vo-manual-install|
    Color Schemes                   |vo-colors|
    Testing                         |vo-testing|


                                                               *vo-auto-install*
Automatic Method~

The automatic installation targets Unix-compatible platforms: >

From tar archive

    $ tar xzvf vimoutliner-0.3.x.tar.gz
    $ cd vimoutliner
    $ sh install.sh

From zip archive 

    $ unzip vimoutliner-0.3.x.zip
    $ cd vimoutliner-0.3.x
    $ sh install.sh 

From vimball

Open vimoutliner-0.3.x.vba with Vim and type the following command to install in your home vim folder:

:so % 

<
The install.sh script will ask you whether to install the VimOutliner files or abort the
process leaving everything unchanged.  Assuming you confirmed the
installation, the script creates the necessary directory tree and copies the
files which provide the core functionality and documentation.

With the second question you decide whether you want to install some brand new
add-ons, currently implementing hoisting and checkboxes.

                                                                   *vo-updating*
Updating~

Updating an existing installation might require some manual work.

If you are already working with a previous VimOutliner release, there is a
slight chance that the current directory tree is different from your current
one. In this case, you will have to manually migrate your files to the new
locations.

The installation script creates unique backups of files being replaced with
newer versions. So if you put some local customisations into, say
$HOME/.vim/vimoutliner/vimoutlinerrc, you'll probably have to merge the backup
with the new file by hand.

                                                             *vo-manual-install*
Manual Method~

You can also copy the files from the unpacked distribution tarball into their
destination folders by yourself. The following steps are a description of what
has to go where and assume some knowledge of your vim setup.

If you encounter problems, please contact the mailinglist for an immediate
solution and more complete future documentation.  www.lists.vimoutliner.org

If you want to setup VimOutliner on a system running Microsoft Windows, the
directory $HOME denotes the base folder of the vim installation.  If you're on
Unix based system, the location of $HOME is as usual.

You need the following subtrees in your $HOME directory: >

    $HOME/.vim/
        doc/
        ftdetect/
        ftplugin/
        syntax/
        vimoutliner/
            plugins/
            scripts/
<
The distribution tarball unpacks into a directory vimoutliner with the
following contents: >

    vimoutliner/
        plugins/             (1)
        scripts/             (1)
    doc/                     (1)
    ftdetect/                (1)
    ftplugin/                (1)
    install.sh*
    syntax/                  (1)
    syntax/                  (1)
    vimoutlinerrc            (1)
<
(1) The content of these folders should be copied to their namesakes in the
$HOME/.vim folder

Your $HOME/.vimrc file should contain the lines >

     filetype plugin indent on
     syntax on
<
Finally, you need to integrate the online help provided with VimOutliner into
the vim help system.  Start vim and execute the following command: >
>
    :helptags $HOME/.vim/doc
<
At this point, VimOutliner should be functional.  Type ":help vo" to get
started. You can also type ":help vo_cheatsheet" to a get a quick overview of all
the VimOutliner commands.

                                                                      *vo-color*
Color Schemes~

Color schemes specify the colors Vim Outliner uses when displaying an outline.
Colors are specified by object and level.  These objects currently include:
headings, body text, pre- formatted body text, tables and others. See
|vo-objects| for more information.

Color scheme files are located in the system-wide vim colors directory and/or
your $HOME/.vim/colors directory. You can select from any of the provided
schemes. Vim Outliner internally includes a scheme the matches vo_light.vim.

To override the default color scheme you can edit these lines in your
$HOME/.vim/vimoutline/vimoutlinerrc file:
>
    "Custom Colors **********************************
    " Uncomment this next line to force using VO on
    " a light background
    " colorscheme vo_light
    " Uncomment this next line to force using VO on
    " a dark background
    " colorscheme vo_dark
<
To create your own scheme follow these simple steps:

1. Go to your $HOME/.vim/colors directory.  If you don't have one, create it.

2. Make a copy of one of the included schemes to use as a starting point. You
   should be able to find them in places like: $HOME/.vim/colors and
   /usr/share/vim/vim63/colors. Put the copy in your own colors directory
   ($HOME/.vim/colors)

3. Edit the scheme file to change whatever colors you wish.

4. Select the scheme in your $HOME/.vim/vimoutline/vimoutlinerrc file.  The
   line should look something like this:
>
       colorscheme noel
<
That's all there is to it.

                                                                    *vo-testing*
Testing Base Functionality~

Open a new outline with the following:
>
    rm $HOME/vo_test.otl
    gvim $HOME/vo_test.otl or vim $HOME/vo_test.otl
<
Verify the following:
- Tabs indent the text
- Different indent levels are different colors
- Lines starting with a colon and space word-wrap

  Lines starting with colons are body text. They should word wrap and
  should be a special color (typically green, but it can vary). Verify
  that paragraphs of body text can be reformatted with the Vim gq
  commands.

Verify Interoutline Linking:

Interoutline linking currently requires a working perl installation to
generate the necessary tag file. We are looking into porting this to vim's own
scripting language.

Place the following two lines in $HOME/vo_test.otl:
>
    _tag_newfile
        $HOME/vo_newfile.otl
<
Note that in the preceding, the 2nd line should be indented from the first.

To create VimOutliner's tag file $HOME/.vim/vimoutliner/vo_tags.tag, run
vo_maketags.pl, which resides in $HOME/.vimoutliner/scripts/: $
$HOME/.vim/vimoutliner/scripts/vo_maketags.pl $HOME/vo_test.otl

Try the following:
- In $HOME/vo_test.otl
- Cursor to the _tag_newfile marker
- Press CTRL-K
    You should be brought to $HOME/vo_newfile.otl
- Press CTRL-N
    You should be brought back to $HOME/vo_test.otl
Note:
    CTRL-K is a VimOutliner synonym for CTRL-]
    CTRL-N is a VimOutliner synonym for CTRL-T

                                                                     *vo-debian*
Debian Installation~

Debian does include Vim Outliner as a package. However some Debian version
require this line to be added to your .vimrc file: >

    syntax on
>

==============================================================================
Using VimOutliner On Other File Types                           *vo-other-files*

How to use VimOutliner on non .otl files~

Previous VimOutliner versions used the ol script to invoke VimOutliner. As of
VimOutliner 0.3.0, the ol script is no longer necessary nor provided. Instead,
VimOutliner is now a Vim plugin, so Vim does all the work.

This makes VimOutliner much simpler to use in most cases, but Vim plugins are
file extension based, meaning that if you want to use VimOutliner on a file
extension other than .otl, you must declare that file extension in
$HOME/.vim/ftdetect/vo_base.vim. In this section we'll use the .emdl extension
(Easy Menu Definition Language) as an example.

To enable VimOutliner work with .emdl files, do this:
>
    vim $HOME/.vim/ftdetect/vo_base.vim
<
Right below the line reading:
>
    au! BufRead,BufNewFile *.otl    setfiletype vo_base
<
Insert the following line:
>
    au! BufRead,BufNewFile *.emdl   setfiletype vo_base
<
Save and exit
>
    gvim $HOME/vo_test.emdl
<
You should get:
- level colors,
- body text (lines starting with colon)
- comma comma commands (try ,,2 and ,,1)


==============================================================================
Troubleshooting                                             *vo-troubleshooting*


Q: I can't switch between colon based and space based body text.
A: See next question

Q: My ,,b and ,,B don't do anything. How do I fix it?
A: Open vim like this:
>
      vim $HOME/.vim/ftplugin/vo_base.vim
<
   Search for use_space_colon
   Make sure it is set to 0, not 1
   Rerun Vim, and ,,b and ,,B should work

Q: I don't get VimOutliner features on files of extension .whatever.
A: Open vim like this:
>
      vim $HOME/.vim/ftdetect/vo_base.vim
<
   Right below the line reading:
>
      au! BufRead,BufNewFile *.otl          setfiletype vo_base
<
   Insert the following line:
>
      au! BufRead,BufNewFile *.whatever     setfiletype vo_base
<
   Save and exit.


==============================================================================
VimOutliner Philosophy                                           *vo-philosophy*


Authoring Speed~

VimOutliner is an outline processor with many of the same features as
Grandview, More, Thinktank, Ecco, etc. Features include tree expand/collapse,
tree promotion/demotion, level sensitive colors, interoutline linking, and
body text.

What sets VimOutliner apart from the rest is that it's been constructed from
the ground up for fast and easy authoring.  Keystrokes are quick and easy,
especially for someone knowing the Vim editor. The mouse is completely
unnecessary (but is supported to the extent that Vim supports the mouse). Many
of the VimOutliner commands start with a double comma because that's very
quick to type.

Many outliners are prettier than VimOutliner. Most other outliners are more
intuitive for the newbie not knowing Vim. Many outliners are more featureful
than VimOutliner (although VimOutliner gains features monthly and is already
very powerful).  Some outliners are faster on lookup than VimOutliner. But as
far as we know, NO outliner is faster at getting information out of your mind
and into an outline than VimOutliner.

VimOutliner will always give you lightning fast authoring. That's our basic,
underlying philosophy, and will never change, no matter what features are
added.


Vim Integration~

Earlier VimOutliner versions prided themselves on being standalone
applications, self-contained in a single directory with a special script to
run everything.

As of 0.3.0, VimOutliner is packaged as a Vim Plugin, eliminating the need for
the ol script, which many saw as clumsy. Given that all VimOutliner features
are produced by the Vim engine, it makes perfect sense to admit that
VimOutliner is an add-on to Vim.

Therefore VimOutliner now prides itself in being a Vim plugin.  With the
VimOutliner package installed, the Vim editor yields the VimOutliner feature
set for files whose extensions are listed as vo_base types in
$HOME/.vim/ftplugin/vo_base.vim.

The Vim Plugin philosophy yields several benefits:
- Less reliance on Perl, bash and environment vars
- (upcoming) Portability between Linux, Windows and Mac
- (upcoming) Installation via Vim script


==============================================================================
Running VimOutliner                                                 *vo-running*


Vim Knowledge~

You needn't be a Vim expert to use VimOutliner. If you know the basics --
inserting and deleting linewise and characterwise, moving between command and
insert modes, use of Visual Mode selections,and reformatting, you should be
well equipped to use VimOutliner.

Run Vim or GVim and follow the instruction on :help |tutor|

VimOutliner is a set of Vim scripts and configurations. Its features all come
from the Vim editor's engine. If you do not know Vim, you'll need to learn the
Vim basics before using VimOutliner.  Start by taking the Vim tutorial. The
tutorial should take about 2 hours.

VimOutliner is so fast, that if you often use outlining, you'll make up that
time within a week.

                                                                    *vo-command*
Comma Comma Commands~

For maximum authoring speed, VimOutliner features are accessed through
keyboard commands starting with 2 commas.  The double comma followed by a
character is incredibly fast to type.

We expect to create more comma comma commands, so try not to create your own,
as they may clash with later comma comma commands. If you have an
exceptionally handy command, please report it to the VimOutliner list. Perhaps
others could benefit from it.

    Command   List     Description ~
        ,,D   all      VimOutliner reserved command
        ,,H   all      reserved for manual de-hoisting (add-on)
        ,,h   all      reserved for hoisting (add-on)
        ,,1   all      set foldlevel=0
        ,,2   all      set foldlevel=1
        ,,3   all      set foldlevel=2
        ,,4   all      set foldlevel=3
        ,,5   all      set foldlevel=4
        ,,6   all      set foldlevel=5
        ,,7   all      set foldlevel=6
        ,,8   all      set foldlevel=7
        ,,9   all      set foldlevel=8
        ,,0   all      set foldlevel=99999
        ,,-   all      Draw dashed line
        ,,f   normal   Directory listing of the current directory
        ,,s   normal   Sort sub-tree under cursor ascending
        ,,S   normal   Sort sub-tree under cursor descending
        ,,t   normal   Append timestamp (HH:MM:SS) to heading
        ,,T   normal   Pre-pend timestamp (HH:MM:SS) to heading
        ,,T   normal   Pre-pend timestamp (HH:MM:SS) to heading
        ,,t   insert   Insert timestamp (HH:MM:SS) at cursor
        ,,d   normal   Append datestamp  (YYYY-MM-DD) to heading
        ,,d   insert   Insert datestamp  (YYYY-MM-DD) at cursor
        ,,D   normal   Pre-pend datestamp  (YYYY-MM-DD) to heading
        ,,B   normal   Make body text start with a space
        ,,b   normal   Make body text start with a colon and space
        ,,w   insert   Save changes and return to insert mode
        ,,e   normal   Execute the executable tag line under cursor


Other VimOutliner Commands~

Naturally, almost all Vim commands work in VimOutliner.  Additionally,
VimOutliner adds a few extra commands besides the comma comma commands
discussed previously.

Command list:
    CTRL-K        Follow tag (Synonym for CTRL-])
    CTRL-N        Return from tag (Synonym for CTRL-T)
    Q             Reformat (Synonym for gq)


To get a quick overview of all VimOutliner commands type ":help vo_cheatsheet" in vim.

                                                                 *vo-activities*
Basic VimOutliner activities~

How do I collapse a tree within command mode?
    zc
    (note: a full list of folding commands |fold-commands|)

How do I expand a tree within command mode?
    To expand one level:
        zo
    To expand all the way down
        zO

How do I demote a headline?
    In command mode, >>
    In insert mode at start of the line, press the Tab key
    In insert mode within the headline, CTRL-T

How do I promote a headline?
    In command mode, <<
    In insert mode at start of the line, press the Backspace key
    In insert mode within the headline, CTRL-D

How do I promote or demote several consecutive headlines?
    Highlight the lines with the V command
    Press < to promote or > to demote. You can precede
    the < or > with a count to promote or demote several levels

How do I promote or demote an entire tree?
    Collapse the tree
    Use << or >> as appropriate

How do I collapse an entire outline?
    ,,1

How do I maximally expand an entire outline?
    ,,0

How do I expand an outline down to the third level?
    ,,3

How do I move a tree?
    Use Vim's visual cut and paste

How do I create body text?
    Open a blank line below a headline
    Start the line with a colon followed by a space
    Continue to type. Your text will wrap

How do I reformat body text?
    Highlight (Shift+V) the body text to be reformatted
    Use the gq command to reformat

How do I reformat one paragraph of body text?
    The safest way is highlighting.
        DANGER! Other methods can reformat genuine headlines.

How do I switch between colon based and space based body text?
    ,,b for colon based, ,,B for space based

What if ,,b and ,,B don't work
    Change variable use_space_colon from 1 to 0
        in $HOME/.vim/ftplugin/vo_base.vim

How do I perform a wordcount?
    Use the command :w !wc
        The space before the exclamation point is a MUST.

                                                                       *vo-menu*
Menu~

There is a simple menu included in Vim Outliner when running in GUI mode.
Named 'VO', you can usually find it right next to the 'Help' menu. There are
commands to change the fold level and select alternate color schemes. There is
also entries for common tools.

The last tool item calls a shell script, 'myotl2html.sh'. This script should
be provided by the user and is not included in VO releases. A sample
myotl2html.sh script might look like this:
>
    #!/bin/bash
    otl2html.py -S pjtstat.css $1 > $HOME/public_html/$1.html
<
If you have several different types of reports you create regularly, you can
create your own menu entries. Just add lines like these to your
~/.vimoutlinerrc file: >
>
    amenu &VO.&Reports.&Big\ Project :!otl2html.py -S big.css % > %.html
    amenu &VO.&Reports.&Hot\ List :!otl2html.py -S todo.css % > %.html
    amenu &VO.&Reports.&Weekly :!otl2html.py -S weekly.css % > %.html
<
I'm sure you get the idea.

                                                                    *vo-objects*
Vim Outliner Objects~

There are several object/line types that VO supports. The most common on
simple headings and body text. Simple headings are tab-indented line that
start with any non-whitespace character except: : ; | < >.  These characters
specify other objects. Here is a list of each of the non-heading types:

    Start    Description~
      :      body text (wrapping)
      ;      preformatted body text (non-wrapping)
      |      table
      >      user-defined, text block (wrapping)
      <      user-defined, preformatted text block (non-wrapping)

The body text marker, :, is used to specify lines that are automatically
wrapped and reformatted. VO and post-processors are free to wrap and reformat
this text as well as use proportionally- spaced fonts. A post-processor will
probably change the appearance of what you have written. If you are writing a
book or other document, most of the information you enter will be body text.

Here is an example:
>
    Kirby the Wonder Dog
    	: Kirby is nine years old. He understand about 70-100
	: English words. Kirby also understands 11 different hand
	: signals. He is affectionate, playful and attentive.
	:
	: His breeding is unknown. He appears to be a mix between
	: a german shepherd and a collie.
<
When folded, body text looks something like this:
>
    Kirby the Wonder Dog
	[TEXT] -------------------------------- (6 lines)
<
The preformatted text marker, ;, is used to mark text that should not be
reformatted nor wrapped by VO or any post-processor. A post- processor would
use a fixed-space font, like courier, to render these lines. A post-processor
will probably not change the appearance of what you have written. This is
useful for making text picture, program code or other format-dependent text.

Here is an example:
>
    Output waveform
	;         _______                ______
	;   _____/       \______________/
	;        |-10us--|----35us------|
<
When folded, preformatted body text looks something like this:
>
    Output waveform
	[TEXT BLOCK] -------------------------- (6 lines)
<
The table marker, |, is used to create tables. This is an excellent way to
show tabular data. The marker is used as if it were are real vertical line. A
|| (double-|) is optionally used to mark a table heading line. This is useful
for post-processors.

Here is an example:
>
	Pets
		|| Name  | Age | Animal | Inside/Outside |
		| Kirby  |   9 |    dog |           both |
		| Hoover |   1 |    dog |           both |
		| Sophia |   9 |    cat |         inside |
<
There is no automatic alignment of columns yet. It must be done manually. The
post-processor, otl2thml.py, does have alignment functions. See its
documentation for more information.

When folded, a table looks something like this:
>
    Pets
	[TABLE] ------------------------------- (4 lines)
<
User-defined text is similar to body text but more flexible and it's use is
not pre-defined by Vim Outliner. The basic, user-defined text block marker, >,
behaves just like body text.

For example:
>
    Kirby the Wonder Dog
    	> Kirby is nine years old. He understand about 70-100
	> English words. Kirby also understands 11 different hand
	> signals. He is affectionate, playful and attentive.
	>
	> His breeding is unknown. He appears to be a mix between
	> a german shepherd and a collie.
<
When folded, body text looks something like this:
>
    Kirby the Wonder Dog
	[USER] -------------------------------- (6 lines)
<
But unlike body text, user-defined text can be expanded. You could have
user-defined text types. If you were writing a book, in addition to body text
for paragraphs you might need special paragraphs for tips and warnings.
User-defined text blocks can accomplish this:
>
	>Tips
	> Don't forget to back up your computer daily. You don't
	> need to back up the entire computer. You just need to
	> backup up the files that have changed.
	>Warning
	>Never store you backup floppy disks on the side of you
	>file cabinets by adhering them with magnets.
<
A post processor will know how to remove the style tags (Tips and Warning) and
you want the text to be formatted.

When folded, the above would appear as:
>
	[USER Tips] --------------------------- (4 lines)
	[USER Warning]------------------------- (3 lines)
<
The user-defined, preformatted text block marker, <, behaves just like
preformatted text. But like >, it leaves the functional definition up to the
user. A simple user-defined, preformatted text block could be:
>
    Tux
	<                 _.._
	<              .-'    `-.
	<             :          ;
	<             ; ,_    _, ;
	<             : \{"  "}/ :
	<            ,'.'"=..=''.'.
	<           ; / \      / \ ;
	<         .' ;   '.__.'   ; '.
	<      .-' .'              '. '-.
	<    .'   ;                  ;   '.
	<   /    /                    \    \
	<  ;    ;                      ;    ;
	<  ;   `-._                  _.-'   ;
	<   ;      ""--.        .--""      ;
	<    '.    _    ;      ;    _    .'
	<    {""..' '._.-.    .-._.' '..""}
	<     \           ;  ;           /
	<      :         :    :         :
	<      :         :.__.:         :
	<       \       /"-..-"\       /    fsc
	<        '-.__.'        '.__.-'
<
When folded it would be:
>
    Tux
	[USER BLOCK] -------------------------- (6 lines)
<
Like user-defined text, these blocks can be given user-defined styles. For
example:
>
	<ASCIIart
	<                 _.._
	<              .-'    `-.
	<             :          ;
	<             ; ,_    _, ;
	<             : \{"  "}/ :
	<            ,'.'"=..=''.'.
	<           ; / \      / \ ;
	<         .' ;   '.__.'   ; '.
	<      .-' .'              '. '-.
	<    .'   ;                  ;   '.
	<   /    /                    \    \
	<  ;    ;                      ;    ;
	<  ;   `-._                  _.-'   ;
	<   ;      ""--.        .--""      ;
	<    '.    _    ;      ;    _    .'
	<    {""..' '._.-.    .-._.' '..""}
	<     \           ;  ;           /
	<      :         :    :         :
	<      :         :.__.:         :
	<       \       /"-..-"\       /    fsc
	<        '-.__.'        '.__.-'
	<Code
	< getRXDN macro
	<
	< 	local	gRXD1, gRXD2
	< 	bcf	STATUS,C
	< 	btfsc	FLAGS,SERPOL
	<
	< 	goto	gRXD1
	< 	btfsc	RXDN
	< 	bsf	STATUS,C
	< 	goto	gRXD2
	<
	< gRXD1	btfss	RXDN
	< 	bsf	STATUS,C
	< 	nop
	< gRXD2
	< 	endm
<
When folded, the above would appear as:
>
	[USER BLOCK ASCIIart] ----------------- (22 lines)
	[USER BLOCK Code] --------------------- (17 lines)
<

                                                            *vo-post-processors*
VimOutliner Post-Processors~

There are already serveral post processors for Vim Outliner. Some are general
purpose in nature and others perform specific conversions. There are several of 
the tested scripts now included in the $HOME/.vim/vimoutliner/scripts folder.
See also the scripts section.                                   |vo-scripts|

For overview of several of the scripts on the web see:
        https://sites.google.com/site/vimoutlinerinfo/scripts-for-vimoutliner


==============================================================================
Advanced VimOutliner                                               *vo-advanced*

                                                           *vo-executable-lines*
Executable Lines~

Executable lines enable you to launch any command from a specially constructed
headline within VimOutliner. The line must be constructed like this:
>
    Description _exe_ command
<
Here's an example to pull up Troubleshooters.Com:
>
    Troubleshooters.Com _exe_ mozilla http://www.troubleshooters.com
<
Executable lines offer the huge benefit of a single-source knowledge tree,
where all your knowledge, no matter what its format, exists within a single
tree of outlines connected with inter-outline links and executable lines.


==============================================================================
Plugins                                                             *vo-plugins*


The VimOutliner distribution currently includes two plugins for easy handling
of checkboxes, hoisting (see below) and smart paste. 

The checkboxes plugin is enables by default. The hoisting and smart paste plugin are disabled by default.
To enable these look for the easy instructions for this in your $HOME/.vimoutlinerrc file.

More information below and in the plugin files in the $HOME/.vim/vimoutliner/plugin folder.

                                                                   *vo-checkbox*
Checkboxes~

Checkboxes enable VimOutliner to understand tasks and calculate the current
status of todo-lists etc. Three special notations are used:
>
    [_]     an unchecked item or incomplete task
    [X]     a checked item or complete task
    %       a placeholder for percentage of completion
<
Several ,,-commands make up the user interface:
>
    ,,cb  Insert a check box on the current line or each line of the currently
          selected range (including lines in selected but closed folds). This
          command is currently not aware of body text. Automatic recalculation
          of is performed for the entire root-parent branch that contains the
          updated child. (see ,,cz)
    ,,cx  Toggle check box state (percentage aware)
    ,,cd  Delete check boxes
    ,,c%  Create a check box with percentage placeholder except on childless
          parents
    ,,cp  Create a check box with percentage placeholder on all headings
    ,,cz  Compute completion for the tree below the current heading.
<
How do I use it?

Start with a simple example. Let's start planning a small party, say a barbeque.

1. Make the initial outline.
>
    Barbeque
        Guests
            Bill and Barb
            Larry and Louise
            Marty and Mary
            Chris and Christine
            David and Darla
            Noel and Susan
        Food
            Chicken
            Ribs
            Corn on the cob
            Salad
            Desert
        Beverages
            Soda
            Iced Tea
            Beer
        Party Favors
            Squirt guns
            Hats
            Name tags
        Materials
            Paper Plates
            Napkins
            Trash Containers
<

2. Add the check boxes.

This can be done by visually selecting them and typing ,,cb.  When done, you
should see this:
>
    [_] Barbeque
        [_] Guests
            [_] Bill and Barb
            [_] Larry and Louise
            [_] Marty and Mary
            [_] Chris and Christine
            [_] David and Darla
            [_] Noel and Susan
        [_] Food
            [_] Chicken
            [_] Ribs
            [_] Corn on the cob
            [_] Salad
            [_] Desert
        [_] Beverages
            [_] Soda
            [_] Iced Tea
            [_] Beer
        [_] Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] Materials
            [_] Paper Plates
            [_] Napkins
            [_] Trash Containers
<

3. Now check off what's done.

Checking off what is complete is easy with the
,,cx command.  Just place the cursor on a heading and ,,cx it. Now you can see
what's done as long as the outline is fully expanded.
>
    [_] Barbeque
        [_] Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

4. Now summarize what's done.

You can summarize what is done with the ,,cz command.  Place the cursor on the
'Barbeque' heading and ,,cz it.  The command will recursively process the
outline and update the check boxes of the parent headlines. You should see:
(Note: the only change is on the 'Guests' heading. It changed because all of
its children are complete.)
>
    [_] Barbeque
        [X] Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

5. Add percentages for a better view.

You can get a much better view of what's going on, especially with collapsed
headings, if you add percentages.  Place a % on each heading that has children
like this:
>
    [_] % Barbeque
        [X] % Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] % Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] % Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] % Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] % Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

6. Now compute the percentage of completion.

After adding the % symbols, place the cursor on the 'Barbeque' heading and
execute ,,cz as before. Keep in mind that the recursive percentages are
weighted. You should see:
>
    [_] 58% Barbeque
        [X] 100% Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] 60% Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [_] Salad
            [X] Desert
        [_] 66% Beverages
            [_] Soda
            [X] Iced Tea
            [X] Beer
        [_] 0% Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] 66% Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<

7. Complete a few more just for fun.

Mark Salad and Soda and you should see the ouline below.  Try plaing around
with zc and zo to see the effects of opening and closing folds. Even if you
place the cursor on 'Barbeque' and zo it, you still have a good understanding
of how complete the project is.
>
    [_] 69% Barbeque
        [X] 100% Guests
            [X] Bill and Barb
            [X] Larry and Louise
            [X] Marty and Mary
            [X] Chris and Christine
            [X] David and Darla
            [X] Noel and Susan
        [_] 80% Food
            [X] Chicken
            [X] Ribs
            [_] Corn on the cob
            [X] Salad
            [X] Desert
        [X] 100% Beverages
            [X] Soda
            [X] Iced Tea
            [X] Beer
        [_] 0% Party Favors
            [_] Squirt guns
            [_] Hats
            [_] Name tags
        [_] 66% Materials
            [X] Paper Plates
            [_] Napkins
            [X] Trash Containers
<
                                                                   *vo-hoisting*
Hoisting~

NOTE: THIS PLUGIN IS NOT FINISHED AND MIGHT CAUSE DATA LOSS!!! USE IT AT YOUR
OWN RISK. This plugin is disabled by default.

Hoisting is a way to focus on the offspring of the currently selected outline
item. The subitems will be presented as top level items in the automatically
extracted hoist-file located in the same directory as the main outline file.
You cannot hoist parts of an already hoisted file again.

To enable this plugin uncomment the following line in
 ~/.vimoutlinerrc:
>
    "let g:vo_modules_load .= ':hoist'
<
Once it is enabled, you hoist the subtopics of the currently selected
item with

    ,,h   Hoist the subtopics into a temporary file

The changes are merged back into the original file by closing the temporary
hoist file with

    :q  :wq  :x  ZZ

If something went wrong, you can perform a manual de-hoisting with the
following procedure:

Open the main file in VimOutliner Search for the line containing the __hoist
tag On this line, do

    ,,H    Manual de-hoisting


==============================================================================
Scripts                                                             *vo-scripts*


The VimOutliner distribution currently includes several useful  external scripts to
support interoutline links, HTML export and more. All scripts are included in your 
$HOME/.vim/vimoutliner/scripts folder. For more information on these scripts see 
usage section in the scripts. You can also find several of these scripts on this web site
with links to their specific web site:
       https://sites.google.com/site/vimoutlinerinfo/scripts-for-vimoutliner 


Information on some of the scripts

vo_maketags.pl                                                     *vo-maketags*

A basic description of how to use this Perl script is given in section
|vo-testing|, subsection "Verify interoutline linking".

otl2html.py                                                           *otl2html*

This Python script transforms an outline into an HTML file. Use $ otl2html.py
--help to get detailed information.

This script does not adhere to the VimOutliner naming convention with the
'vo_' prefix because it is not necessary for any VimOutliner functionality. It
is provided both as a useful tool for creating HTML pages and HTML slides from
outlines and as a working demonstration of how to convert .otl files to other
formats.


==============================================================================
Other Information                                                *vo-other-info*


The VimOutliner Project~

- How do I add my own features?
Two ways -- by changing VimOutliner source code, or by inserting your own code
in $HOME/.vimoutlinerrc, which runs at the end of the VimOutliner startup
scripts. You might have to merge your personal .vimoutlinerrc with future
versions to take advantage of new features.

- How is VimOutliner licensed?
VimOutliner is licensed under the GNU General Public License.

- How do I contribute to VimOutliner
Step 1 is to subscribe to our mailing list. Join up at
http://www.lists.vimoutliner.org/. Lurk for a few days or so to get the feel,
then submit your idea/suggestion. A lively discussion will ensue, after which
your idea, probably in some modified form, will be considered. The more of the
actual work you have done, the more likely your feature will go in the
distribution in a timely manner.


- What's with the VimOutliner file names?
All VimOutliner files must begin with vo_ unless Vim itself requires them to
have a different name. A few older files from previous versions break this
rule, but over time these will be changed to our naming convention.

In the old days, with the "self contained" philosophy, there was no naming
convention, because VimOutliner files were segregated into their own tree.
With the coming of the "vim plugin" philosophy, there's a need to identify
VimOutliner files for purposes of modification, upgrade and de-installation.
Hence our naming convention.

- What if my feature doesn't make it into the VimOutliner distribution?
You can offer it on your own website, or very possibly on
to the forthcoming new VimOutliner home page  VimOutliner ships with its
core features, but many additional functionalities, especially those that
operate from Perl scripts (or bash or python) are available outside the
distro. For instance, right now there's an Executable Line feature that turns
VimOutliner into a true single tree information reservoir. The Executable Line
feature is available extra-distro on the VimOutliner home page. See also the
scripts included in the $HOME/.vim/vimoutliner/scripts folder.


Anticipated improvements in later versions~

Command-invoking headlines
    Already prototyped
    Probably coming next version
    Allows you to press a key and get an html command in a browser
    Enables a true single tree knowledge collection
    Enables use of VimOutliner as a shell

Groupware
    Not yet well defined
    Enables collaborative work on an outline
    A pipedream, but VimOutliner itself was once a pipedream

Easy mode
    Let's Windows users operate VO like a common insert-only editor. This will
    remove a great deal of VO's keyboarder- friendly features. But then,
    they're Windows users: let them use the mouse.

Headline to headline links
    Not yet sanctioned, might never be implemented If implemented, this would
    presumably create links not just between outlines, but between headlines,
    either in the same outline or in a different one. This would be a start on
    "neural networking".

Headline numbering
    Under feasibility investigation
    Supported by external scripts

Toolbar in gvim
    Under feasibility investigation


Further information on outlines, outline processing and outliners~

http://freshmeat.net/projects/vimoutliner
Main distribution website

https://github.com/vimoutliner/vimoutliner
git repository

http://www.troubleshooters.com/projects/alt-vimoutliner-litt/
Preliminary main web site with links to other sites

http://www.troubleshooters.com/tpromag/199911/199911.htm
Outlining discussion, not product specific

http://www.troubleshooters.com/linux/olvim.htm
Discussion on how to use Vim for outlining

http://www.troubleshooters.com/projects/vimoutliner.htm
Former Webpage for the VimOutliner distro

http://www.outliners.com
Discussion of (proprietary) outliners from days gone by.
Downloads for ancient versions of such outliners.
Unfortunately, all are dos, windows and mac.

http://members.ozemail.com.au/~caveman/Creative/Software/Inspiration/index.html
Discussion of (proprietary,Mac) Inspiration software
This page discusses many methods of thought/computer interaction:
    Visual Outlining
    Textual Outlining
    Idea mapping
    Mind Mapping
    Brainstorming with Rapid Fire Entry
    Concept Mapping
    Storyboarding
    Diagrams (using rich symbol library)

http://members.ozemail.com.au/~caveman/Creative/index.html
Not about outlines, but instead about how to use your brain.
The whole purpose of outlines is to use your brain.
New ways of using your brain produce new ways to use outlines.

==============================================================================
                                                                    *vo-history*
Version                                                             *vo-version*


Version 0.3.5
Released 2011-03-20
	* Additions/Changes:~
	- Moved all files inside $HOME/.vim.
	- Added a cheat sheet to the documentation.
	- Added smart-paste plugin.
	- Added and updated post-processor scripts:
		· fs2otl
		· Node.pm
		· otl2aft.awk
		· otl2docbook.pl
		· otl2html.py
		· otl2lyx.awk
		· otl2ooimpress.py
		· otl2table.py
		· otl2tags.py
		· otlgrep.py
		· otlhead.sh
		· otlsplit.py
		· otltail.sh
		· otl_handler
		· outline_calendar
		· outline_freemind
		· vo_maketags.pl
	- Added syntax support for _ilink_.
	- Hoist plugin disabled by default.
	- Layout of vo_readme.txt made more similar to Vim help.

	* Bug fixes:~
	- ,,S did not work. Fixed

Version 0.3.4
Released
	* Additions/changes:~
	- added ,,cp as an alias to ,,c%
	- Color schemes have been added
	- Checkboxes and hoisting default to 'on'
	- Modified ,,cb and ,,c% (and ,,cp) to work only on headings
	- Fixed the ,,cz command to make the correct call
	- Added descriptions of VO objects to help (headings, text, tables, etc.)

	* Bug fixes:~
	- W18 errors have been fixed


 vim:set filetype=help textwidth=78:

CHANGELOG	[[[1
1495
CHANGELOG

Version 0.3.6
Development
	* Additions/Changes:
	- Added updated comments and information to the user in the INSTALL
	  file.
	- Added comments and information to the user in install.sh to align
	  with the new version.
	- Added new light version of README and moved the more extensive file
	  to README.detailed
	- Several updates and additions to the README, README.detailed and
	  doc/vo_readme.txt file.
	* Bug fixes:
	- Source only the first vimoutlinerrc found.
	- Do not echo mappings.
	- Fixed typo and updated reference in install.sh.
	- Fixed several typos and updated reference in the
	  ftplugin/vo_base.vim
	- Fixed typos and removed outdated references in the vo_hoist.otl and
	  vo_hoist.vim files.
	- Fixed typos and removed outdated references in the vo_checkbox.otl
	  file.
	- Fixed two mappings for sourcing rc file and writing file in
	  ftplugin/vo_base.vim. 
	- Fixed typos in colors/vo_base.vim
	- Fixed errors when g:vo_modules_load is not defined, also updated the
	  plugin loading process to use lists.
Version 0.3.5
Released 2011-03-20
	* Additions/Changes:
	- Moved all files inside $HOME/.vim.
	- Added a cheat sheet to the documentation.
	- Added smart-paste plugin.
	- Added and updated post-processor scripts:
		· fs2otl
		· Node.pm
		· otl2aft.awk
		· otl2docbook.pl
		· otl2html.py
		· otl2lyx.awk
		· otl2ooimpress.py
		· otl2table.py
		· otl2tags.py
		· otlgrep.py
		· otlhead.sh
		· otlsplit.py
		· otltail.sh
		· otl_handler
		· outline_calendar
		· outline_freemind
		· vo_maketags.pl
	- Added syntax support for _ilink_.
	- Hoist plugin disabled by default.
	- Layout of vo_readme.txt made more similar to Vim help.
	* Bug fixes:
	- ,,S did not work. Fixed

Version 0.3.4
Released
	* Additions/changes:
	- added ,,cp as an alias to ,,c%
	- Color schemes have been added
	- Checkboxes and hoisting default to 'on'
	- Modified ,,cb and ,,c% (and ,,cp) to work only on headings
	- Fixed the ,,cz command to make the correct call
	- Added descriptions of VO objects to help (headings, text, tables,
	  etc.)
	* Bug fixes:
	- W18 errors have been fixed

=============================================================================
RCS file: /root/VimOutliner/VimOutliner/INSTALL,v
Working file: INSTALL
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2004-11-27 19:30:43 +0000;  author: noel;  state: Exp;  lines: +2 -2

Minor syntax and installation adjustments.
Change to vo_checkbox to fix a typo.
----------------------------
revision 1.1
date: 2004-02-17 22:00:15 +0000;  author: noel;  state: Exp;
These files are only in cvs for backup purposes. They should be extracted
from vo_readme.txt and never edited themselves:
  INSTALL
  LICENSE
  VERSION
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/Attic/INSTALL.TXT,v
Working file: INSTALL.TXT
head: 1.3
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
Quick installation instructions for developers.
----------------------------
revision 1.3
date: 2003-06-20 14:13:15 +0000;  author: noel;  state: dead;  lines: +0 -0
Final documentation tweaks for the final 0.3.0 release.
----------------------------
revision 1.2
date: 2003-06-18 13:50:55 +0000;  author: noel;  state: Exp;  lines: +1 -1
Modified the installation title.
----------------------------
revision 1.1
date: 2003-03-20 22:56:49 +0000;  author: noel;  state: Exp;
Initial revision
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/LICENSE,v
Working file: LICENSE
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2004-11-27 19:30:43 +0000;  author: noel;  state: Exp;  lines: +4 -2

Minor syntax and installation adjustments.
Change to vo_checkbox to fix a typo.
----------------------------
revision 1.1
date: 2004-02-17 22:00:15 +0000;  author: noel;  state: Exp;
These files are only in cvs for backup purposes. They should be extracted
from vo_readme.txt and never edited themselves:
  INSTALL
  LICENSE
  VERSION
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/VERSION,v
Working file: VERSION
head: 1.4
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 4;	selected revisions: 4
description:
----------------------------
revision 1.4
date: 2005-06-07 17:48:50 +0000;  author: noel;  state: Exp;  lines: +4 -0
Updated to include help on VO objects.
----------------------------
revision 1.3
date: 2005-06-07 17:41:42 +0000;  author: noel;  state: Exp;  lines: +10 -10
Updated version.
----------------------------
revision 1.2
date: 2004-11-27 19:30:43 +0000;  author: noel;  state: Exp;  lines: +9 -14

Minor syntax and installation adjustments.
Change to vo_checkbox to fix a typo.
----------------------------
revision 1.1
date: 2004-02-17 22:00:15 +0000;  author: noel;  state: Exp;
These files are only in cvs for backup purposes. They should be extracted
from vo_readme.txt and never edited themselves:
  INSTALL
  LICENSE
  VERSION
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/install.sh,v
Working file: install.sh
head: 1.3
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
----------------------------
revision 1.3
date: 2005-06-06 18:42:29 +0000;  author: noel;  state: Exp;  lines: +3 -0
Added support for color schemes.
----------------------------
revision 1.2
date: 2004-11-27 19:30:43 +0000;  author: noel;  state: Exp;  lines: +2 -2

Minor syntax and installation adjustments.
Change to vo_checkbox to fix a typo.
----------------------------
revision 1.1
date: 2004-05-02 19:03:01 +0000;  author: noel;  state: Exp;
Added to the distro.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/vimoutlinerrc,v
Working file: vimoutlinerrc
head: 1.6
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 6;	selected revisions: 6
description:
----------------------------
revision 1.6
date: 2005-06-07 12:39:01 +0000;  author: noel;  state: Exp;  lines: +9 -78
Enabled checkboxes and hoisting by default.
Added Vim colorscheme support.
----------------------------
revision 1.5
date: 2005-01-19 15:06:20 +0000;  author: noel;  state: Exp;  lines: +4 -3
Fixed another W18 error.
Enabled hoisting and checkboxes by default.
----------------------------
revision 1.4
date: 2004-05-24 15:56:34 +0000;  author: noel;  state: Exp;  lines: +45 -0
Added highlighting and folding support for:
	Tables (marked with '|')
	User-defined, wrapping text (marked with '>')
	User-defined, non-wrapping text (marked with '<')
----------------------------
revision 1.3
date: 2004-05-17 17:27:55 +0000;  author: noel;  state: Exp;  lines: +2 -2
Fixed plugin loaders for checkboxes and hoisting.
----------------------------
revision 1.2
date: 2004-03-18 13:23:53 +0000;  author: noel;  state: Exp;  lines: +1 -0
Added a line to change the background.
----------------------------
revision 1.1
date: 2004-02-17 21:50:36 +0000;  author: noel;  state: Exp;
This file will be provided from now on to make it easy for people
to customize their settings. The install process will rename this file
to .vimoutlinerrc and put it into the user's home directory.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/Attic/vo_INSTALL.TXT,v
Working file: vo_INSTALL.TXT
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2005-06-07 17:24:05 +0000;  author: noel;  state: dead;  lines: +0 -0
*** empty log message ***
----------------------------
revision 1.1
date: 2003-06-26 19:52:07 +0000;  author: noel;  state: Exp;
Initial add to VimOutliner
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/Attic/vo_README.otl,v
Working file: vo_README.otl
head: 1.4
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 4;	selected revisions: 4
description:
----------------------------
revision 1.4
date: 2005-06-07 17:24:05 +0000;  author: noel;  state: dead;  lines: +0 -0
*** empty log message ***
----------------------------
revision 1.3
date: 2003-10-17 02:17:07 +0000;  author: noel;  state: Exp;  lines: +2 -2
Changed version numbers.
----------------------------
revision 1.2
date: 2003-06-20 14:13:15 +0000;  author: noel;  state: Exp;  lines: +4 -41
Final documentation tweaks for the final 0.3.0 release.
----------------------------
revision 1.1
date: 2003-06-18 13:55:03 +0000;  author: noel;  state: Exp;
Added this documentation to Vim Outliner.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/add-ons/plugins/vo_checkbox.otl,v
Working file: add-ons/plugins/vo_checkbox.otl
head: 1.3
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
----------------------------
revision 1.3
date: 2004-11-27 19:30:43 +0000;  author: noel;  state: Exp;  lines: +12 -8

Minor syntax and installation adjustments.
Change to vo_checkbox to fix a typo.
----------------------------
revision 1.2
date: 2004-05-17 15:57:58 +0000;  author: noel;  state: Exp;  lines: +6 -0
Modified documentation to match current version.
----------------------------
revision 1.1
date: 2003-10-23 22:13:00 +0000;  author: noel;  state: Exp;
Instructions for vo_checkbox.vim
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/add-ons/plugins/vo_checkbox.vim,v
Working file: add-ons/plugins/vo_checkbox.vim
head: 1.18
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 18;	selected revisions: 18
description:
----------------------------
revision 1.18
date: 2005-06-07 15:08:59 +0000;  author: noel;  state: Exp;  lines: +12 -45
Fixed a bug that added checkboxes to body text, preformatted body text,
tables, user-defined text and user-defined preformatted text lines.
Fixed a bug where ,,cb would modify terms like 'test%' or ',,c%'. Now
it only modifies this term: ' [0-9]*%'.
----------------------------
revision 1.17
date: 2005-06-07 13:53:22 +0000;  author: noel;  state: Exp;  lines: +8 -2
Added ,,cp. It is the same as ,,c%
----------------------------
revision 1.16
date: 2004-05-27 22:22:48 +0000;  author: noel;  state: Exp;  lines: +24 -4
Made ,,cd smart so it would try to delete non-existent checkboxes.
Fixed a recursion bug in NewHMD to branches with a single child would
be computed properly.
----------------------------
revision 1.15
date: 2004-05-27 18:11:53 +0000;  author: noel;  state: Exp;  lines: +25 -5
Added smart (only the entire tree in which the child exists), automatic
completion calculations to the ,,cx command.
Added smart (only for parents, not children) '%' sign insertion for
,,c%.
----------------------------
revision 1.14
date: 2004-05-17 15:53:38 +0000;  author: noel;  state: Exp;  lines: +13 -7
Modified SwitchBox() to be more selective.
----------------------------
revision 1.13
date: 2004-05-17 15:43:23 +0000;  author: noel;  state: Exp;  lines: +7 -3
Fixed a broken key mapping: ,,c%.
----------------------------
revision 1.12
date: 2004-02-23 12:19:27 +0000;  author: noel;  state: Exp;  lines: +26 -9
Fixed Up-to-date problem.
Fixed 'Safely script names'.
----------------------------
revision 1.11
date: 2003-09-05 16:37:55 +0000;  author: cepl;  state: Exp;  lines: +41 -2
Added ,cp binding for the new function InsertCheckBoxPerCent,
which adds not only the checkbox but also percentage sign.
----------------------------
revision 1.10
date: 2003-08-23 16:42:15 +0000;  author: noel;  state: Exp;  lines: +18 -17
Modified completion percentages to be recursive.
This:
[_] 0% Project
	[_] 33% Task
		[_] Subtask
		[X] Subtask
		[X] Subtask
	[_] 0% Task
		[_] Subtask
		[_] 50% Subtask
			[X] Subsubtask
			[_] Subsubtask
			[X] Subsubtask
			[_]  Subsubtask

Becomes this:
[_] 29% Project
	[_] 33% Task
		[_] Subtask
		[X] Subtask
		[X] Subtask
	[_] 25% Task
		[_] Subtask
		[_] 50% Subtask
			[X] Subsubtask
			[_] Subsubtask
			[X] Subsubtask
			[_]  Subsubtask
----------------------------
revision 1.9
date: 2003-08-16 13:49:53 +0000;  author: noel;  state: Exp;  lines: +9 -7
added ! to functions.
----------------------------
revision 1.8
date: 2003-08-11 19:16:28 +0000;  author: noel;  state: Exp;  lines: +30 -5
Fixed a bug in which any line that contained the letter x was counted as
completed.
----------------------------
revision 1.7
date: 2003-08-03 23:56:46 +0000;  author: noel;  state: Exp;  lines: +89 -40

Replaced HowManyDone() with a new routine. The new routine is recursive,
ignores headings that don't have checkboxes and does not care what the
current folding states of the parent or children are. The heading at the
top of the tree does not even need to have a checkbox. This will work:

Projects
	[_] Software
		[_] Input
		[_] Processing
			[_] Math
			[_] Database
			[_] Networking
		[_] Output
	[_] Hardware
		[_] Keyboard
		[_] Harddisk
		[_] Processor
		[_] Printer

One only needs to ,,cx on Projects to update everything (everything shown).
As before, including a % on a parent heading with childred, will be replaced
with a percentage of completion. Nice work Matej!
----------------------------
revision 1.6
date: 2003-07-14 00:36:57 +0000;  author: noel;  state: Exp;  lines: +9 -5
Changed [x] to [X] to make it look more full. If the consensus is
[x], I'll gladly put it back.
----------------------------
revision 1.5
date: 2003-07-10 16:29:50 +0000;  author: cepl;  state: Exp;  lines: +75 -3
Calculation of the subtree completion added. The very first alpha
draft.
----------------------------
revision 1.4
date: 2003-07-08 23:48:43 +0000;  author: noel;  state: Exp;  lines: +6 -3
Fixed a bug in <localleader>cd. It used to only delete unchecked boxes.
Now it does both.
----------------------------
revision 1.3
date: 2003-07-07 14:17:04 +0000;  author: noel;  state: Exp;  lines: +11 -6
Fixed the folding of the new headers.
----------------------------
revision 1.2
date: 2003-07-07 14:14:02 +0000;  author: noel;  state: Exp;  lines: +24 -0
Added appropriate headers.
----------------------------
revision 1.1
date: 2003-07-07 13:52:45 +0000;  author: noel;  state: Exp;
Changed checkbox.vim to vo_checkbox.vim
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/add-ons/plugins/vo_hoist.otl,v
Working file: add-ons/plugins/vo_hoist.otl
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2003-10-23 22:12:20 +0000;  author: noel;  state: Exp;
Instructions for vo_hoist.vim.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/add-ons/plugins/vo_hoist.vim,v
Working file: add-ons/plugins/vo_hoist.vim
head: 1.9
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 9;	selected revisions: 9
description:
----------------------------
revision 1.9
date: 2003-11-12 17:26:09 +0000;  author: noel;  state: Exp;  lines: +6 -2
Added a command to place the cursor on the first line of
a hoisted outline.
----------------------------
revision 1.8
date: 2003-11-12 17:10:51 +0000;  author: noel;  state: Exp;  lines: +9 -3
Fixed a bug that occurs on a level 1 heading with no children.
----------------------------
revision 1.7
date: 2003-10-23 22:14:14 +0000;  author: noel;  state: Exp;  lines: +13 -5
Minor changes to DeHoist() to compensate for current foldlevel settings.
----------------------------
revision 1.6
date: 2003-08-17 15:35:24 +0000;  author: noel;  state: Exp;  lines: +10 -9
Put the new mappings in the correct place this time.
Added a : and <cr> to the ZZ command.
----------------------------
revision 1.5
date: 2003-08-17 14:47:42 +0000;  author: noel;  state: Exp;  lines: +8 -2
Added ZZ, qa, and x to the list of commands that de-hoist the current
outline.
----------------------------
revision 1.4
date: 2003-08-17 00:07:31 +0000;  author: noel;  state: Exp;  lines: +13 -10
Added "silent" to commands generating tedious messages.
----------------------------
revision 1.3
date: 2003-08-16 20:08:06 +0000;  author: noel;  state: Exp;  lines: +11 -6
Removed a need to exclude fold level 1 headings.
----------------------------
revision 1.2
date: 2003-08-16 19:02:44 +0000;  author: noel;  state: Exp;  lines: +84 -31
First fully functional version. May need some tweaks but it works and is
quite easy to use.
----------------------------
revision 1.1
date: 2003-08-14 21:05:05 +0000;  author: noel;  state: Exp;
First publicly available, experiment verison
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/colors/vo_dark.vim,v
Working file: colors/vo_dark.vim
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2005-06-07 15:24:30 +0000;  author: noel;  state: Exp;  lines: +1 -1
The color darkyellow does not appear to exist on some systems. This color
has been changed to darkred.
----------------------------
revision 1.1
date: 2005-06-06 18:45:11 +0000;  author: noel;  state: Exp;
These are the new color scheme files.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/colors/vo_light.vim,v
Working file: colors/vo_light.vim
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2005-06-07 15:24:30 +0000;  author: noel;  state: Exp;  lines: +3 -3
The color darkyellow does not appear to exist on some systems. This color
has been changed to darkred.
----------------------------
revision 1.1
date: 2005-06-06 18:45:11 +0000;  author: noel;  state: Exp;
These are the new color scheme files.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/doc/vo_readme.txt,v
Working file: doc/vo_readme.txt
head: 1.9
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 9;	selected revisions: 9
description:
----------------------------
revision 1.9
date: 2005-06-07 17:48:21 +0000;  author: noel;  state: Exp;  lines: +4 -0
Added a better VERSION description.
----------------------------
revision 1.8
date: 2005-06-07 16:44:58 +0000;  author: noel;  state: Exp;  lines: +294 -150
Added a section about VO objects.
Added the ,,cp command.
----------------------------
revision 1.7
date: 2004-05-28 15:28:47 +0000;  author: noel;  state: Exp;  lines: +274 -28
Added complete help for vo_checkbox.vim.
----------------------------
revision 1.6
date: 2004-05-17 17:16:28 +0000;  author: noel;  state: Exp;  lines: +1 -1
Changed 0.3.2 to 0.3.3 in the tite.
----------------------------
revision 1.5
date: 2004-05-17 15:21:25 +0000;  author: noel;  state: Exp;  lines: +75 -69
Modified to reflecte 0.3.3 changes.
----------------------------
revision 1.4
date: 2004-02-17 21:52:41 +0000;  author: noel;  state: Exp;  lines: +263 -111
Modified heavily by Stefan Schiedl for 0.3.2.
----------------------------
revision 1.3
date: 2003-10-17 02:18:07 +0000;  author: noel;  state: Exp;  lines: +44 -7
Changed version numbers.
----------------------------
revision 1.2
date: 2003-06-20 14:13:15 +0000;  author: noel;  state: Exp;  lines: +5 -42
Final documentation tweaks for the final 0.3.0 release.
----------------------------
revision 1.1
date: 2003-06-18 13:55:03 +0000;  author: noel;  state: Exp;
Added this documentation to Vim Outliner.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/experimental/Attic/checkbox.vim,v
Working file: experimental/checkbox.vim
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2003-07-07 13:52:45 +0000;  author: noel;  state: dead;  lines: +0 -0
Changed checkbox.vim to vo_checkbox.vim
----------------------------
revision 1.1
date: 2003-07-07 01:22:35 +0000;  author: noel;  state: Exp;
Initial experimental version of checkboxes.
Contains only one function and two mappings.
The only capabilities are to add and delete check boxes from
the beginnings of headings.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/filetype/Attic/filetype.vim,v
Working file: filetype/filetype.vim
head: 1.5
branch:
locks: strict
access list:
symbolic names:
	arelease: 1.1.1.1
	avendor: 1.1.1
	testfork: 1.3.0.2
keyword substitution: kv
total revisions: 6;	selected revisions: 6
description:
VimOutliner filetype.vim
----------------------------
revision 1.5
date: 2005-06-07 17:26:52 +0000;  author: noel;  state: dead;  lines: +5 -2
*** empty log message ***
----------------------------
revision 1.4
date: 2003-03-01 17:37:17 +0000;  author: noel;  state: Exp;  lines: +6 -3
Changed the filetype name to our new standard: vo_base
----------------------------
revision 1.3
date: 2003-02-14 17:49:43 +0000;  author: noel;  state: Exp;  lines: +6 -4
Removed unnecessary filetype commands
----------------------------
revision 1.2
date: 2003-02-09 15:07:35 +0000;  author: noel;  state: Exp;  lines: +8 -7
Changed the auto commands. Setting the "filetype plugin indent on"
option here does not work with ftplugins.
----------------------------
revision 1.1
date: 2003-02-08 21:11:26 +0000;  author: noel;  state: Exp;
branches:  1.1.1;
Initial revision
----------------------------
revision 1.1.1.1
date: 2003-03-20 22:35:15 +0000;  author: noel;  state: Exp;  lines: +17 -8
no message
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/filetype/vo_base.vim,v
Working file: filetype/vo_base.vim
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2005-01-19 16:12:37 +0000;  author: noel;  state: Exp;
Finally added to CVS.
Don't know how I missed this one.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/ftplugin/vo_base.vim,v
Working file: ftplugin/vo_base.vim
head: 2.59
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 59;	selected revisions: 59
description:
Vim Outliner Main Program File
----------------------------
revision 2.59
date: 2005-06-07 19:50:45 +0000;  author: noel;  state: Exp;  lines: +2 -1
Re-removed the did_filetype() function. Restored the original variable-based
solution.
----------------------------
revision 2.58
date: 2005-06-07 12:47:38 +0000;  author: noel;  state: Exp;  lines: +1 -2
Modified switch that prevents the filetype from being loaded more than once.
----------------------------
revision 2.57
date: 2004-05-24 22:31:11 +0000;  author: noel;  state: Exp;  lines: +0 -6
Removed a redundant PreformattedBodyText() function.
----------------------------
revision 2.56
date: 2004-05-24 15:56:34 +0000;  author: noel;  state: Exp;  lines: +78 -0
Added highlighting and folding support for:
	Tables (marked with '|')
	User-defined, wrapping text (marked with '>')
	User-defined, non-wrapping text (marked with '<')
----------------------------
revision 2.55
date: 2004-05-17 15:18:20 +0000;  author: noel;  state: Exp;  lines: +20 -1
Added Steve Litt's simple executable lines.
----------------------------
revision 2.54
date: 2004-05-17 14:18:27 +0000;  author: noel;  state: Exp;  lines: +41 -16
Replaced system calls to 'date' with strftime().
Modified the time- and date-stamp functions.
normal	<localleader>t	append the time to the current heading
normal	<localleader>T	prepend the time to the current heading
insert	<localleader>t	insert the time at the cursor
normal	<localleader>d	append the date to the current heading
normal	<localleader>D	prepend the date to the current heading
insert	<localleader>d	insert the date at the cursor
----------------------------
revision 2.53
date: 2004-05-17 13:32:38 +0000;  author: noel;  state: Exp;  lines: +2 -2
Added <cr> to end of sort commands.
----------------------------
revision 2.52
date: 2004-05-17 13:30:12 +0000;  author: noel;  state: Exp;  lines: +167 -2
Added child-aware sorting functions.
Mapped <localleader>s to sort ascending.
Mapped <localleader>S to sort descending.
----------------------------
revision 2.51
date: 2004-03-18 13:25:46 +0000;  author: noel;  state: Exp;  lines: +1 -1
Fixed a mapping command for <localleader>w
----------------------------
revision 2.50
date: 2004-02-17 21:47:31 +0000;  author: noel;  state: Exp;  lines: +0 -217
Removed the detailed revision log. It's getting too big. From now on
'cvs log' will need to be used to see the log.
----------------------------
revision 2.49
date: 2003-10-17 01:37:10 +0000;  author: noel;  state: Exp;  lines: +24 -10
Fixed a minor folding issue.
----------------------------
revision 2.48
date: 2003-08-04 13:25:17 +0000;  author: noel;  state: Exp;  lines: +37 -7
Corrected a type for <localleader>w
----------------------------
revision 2.47
date: 2003-06-16 23:57:20 +0000;  author: noel;  state: Exp;  lines: +7 -3
Set UseSpaceColon=0. This is now the standard.
----------------------------
revision 2.46
date: 2003-06-04 11:54:25 +0000;  author: noel;  state: Exp;  lines: +24 -6
The behavior of the "d" and "t" commands have been improved and put into
functions. These commands are now mapped to call the improved functions.
----------------------------
revision 2.45
date: 2003-06-04 11:25:56 +0000;  author: noel;  state: Exp;  lines: +12 -3
Moved the modification to the tags path outside the "if" statement in
autocommands in ftplugin. Completely removed the line from syntax.
----------------------------
revision 2.44
date: 2003-05-27 13:33:34 +0000;  author: noel;  state: Exp;  lines: +45 -29
Added Vim style folds to both vo_base files to make them easier to read.
Added a mode line to the end of each to activate the folds.
Added a "Documentation" section that is mostly empty. This section will
eventually be extracted automatically to form the online help via Vim's
built-in help mechanisms.
----------------------------
revision 2.43
date: 2003-05-23 18:36:44 +0000;  author: noel;  state: Exp;  lines: +7 -4
More trouble with the ,,d function and retaining proper indentation.
----------------------------
revision 2.42
date: 2003-05-23 16:02:42 +0000;  author: noel;  state: Exp;  lines: +8 -2
Added tag file support for ~/.vimoutliner.
----------------------------
revision 2.41
date: 2003-05-23 13:55:25 +0000;  author: noel;  state: Exp;  lines: +10 -6
Modified the d and t commands. They did not work properly on closed folds.
Commented-out the d and t commands when in insert mode. I have not used them
and they don't work properly.
----------------------------
revision 2.40
date: 2003-05-17 23:29:25 +0000;  author: noel;  state: Exp;  lines: +11 -6
Modified date and time (,,d/,,t) to place date/time at beginning of
line instead of end of line to allow for sorting.
----------------------------
revision 2.39
date: 2003-05-17 22:49:26 +0000;  author: noel;  state: Exp;  lines: +20 -16
Changed ^M to <cr> in all occurrances.
Modified date (<leader>d) and time (<leader>t) to add date/time to end of
current line.
----------------------------
revision 2.38
date: 2003-03-05 17:58:22 +0000;  author: cepl;  state: Exp;  lines: +6 -3
Personal configuration file was not run from the user's $HOME directory.
Fixed.
----------------------------
revision 2.37
date: 2003-03-03 16:24:49 +0000;  author: noel;  state: Exp;  lines: +6 -3
Added ~/.vim and ~/.vimoutliner as places to look for tag files.
----------------------------
revision 2.36
date: 2003-03-01 17:37:41 +0000;  author: noel;  state: Exp;  lines: +13 -5
Changed the filetype name to our new standard: vo_base
----------------------------
revision 2.35
date: 2003-02-09 15:04:56 +0000;  author: noel;  state: Exp;  lines: +70 -55
Changed key mappings to be local to the current buffer only. They
will also be loaded for any subsequent .otl file.
Changed key mappings to use an easily modifiable leader. In this case
",,".
Changed the scope of some variables. They had a buffer scoping but now
have a function scope.
----------------------------
revision 2.34
date: 2003-02-08 22:07:47 +0000;  author: noel;  state: Exp;  lines: +5 -63
Removed spellfix functions. Perhaps I'll make them another plugin.
----------------------------
revision 2.33
date: 2003-02-08 21:31:01 +0000;  author: noel;  state: Exp;  lines: +5 -116
Split out syntax settings as Dillon originally showed.
----------------------------
revision 2.32
date: 2003-01-30 01:47:41 +0000;  author: noel;  state: Exp;  lines: +6 -3
modified switches sent to ispell to make it guess better.
----------------------------
revision 2.31
date: 2003-01-28 22:31:37 +0000;  author: noel;  state: Exp;  lines: +6 -3
Modified setlocal foldtext.... to set foldtext....
----------------------------
revision 2.30
date: 2003-01-22 22:03:12 +0000;  author: noel;  state: Exp;  lines: +8 -3
Fixed bodytext folding method.
----------------------------
revision 2.29
date: 2003-01-21 00:18:50 +0000;  author: noel;  state: Exp;  lines: +20 -7
Fixed a problem with runtimepath.
Added a use_space_colon setting to that one can choose between bodytext
marked with a : or with a space-:.
----------------------------
revision 2.28
date: 2003-01-19 16:46:27 +0000;  author: noel;  state: Exp;  lines: +11 -3
Removed some strange escape characters from a revision comment.
----------------------------
revision 2.27
date: 2003-01-19 16:16:54 +0000;  author: noel;  state: Exp;  lines: +101 -88
Added detection of the color scheme and an alternative set of colors
for dark backgrounds. (well actually for non-"light" backgrounds) at
Dillon Jones' request.
Set the "current_syntax" at Dillon's request.
Modified the exe lines in the source to remove the debugging style I was
using.
----------------------------
revision 2.26
date: 2003-01-16 00:56:51 +0000;  author: noel;  state: Exp;  lines: +26 -23
Changed a bunch of set commands to setlocal commands at the
suggestion of Jeffrey Hood. Thanks, Jeffrey!
----------------------------
revision 2.25
date: 2003-01-13 17:05:08 +0000;  author: noel;  state: Exp;  lines: +14 -11
Fixed a problem with the new regex that define headings.
----------------------------
revision 2.24
date: 2003-01-12 19:08:32 +0000;  author: noel;  state: Exp;  lines: +36 -25
Converted from _ to :
----------------------------
revision 2.23
date: 2003-01-11 21:00:33 +0000;  author: noel;  state: Exp;  lines: +55 -38
Added Matej requirement for personalization settings via
.vimoutlinerrc.
Added Steve's style of bodytext that allows for wrapping and formatting
with have the headings wrap as well. It is currently set for "_" as
the bodytext marker.
Added ,,b to set all bodytext to Steve's style.
Added ,,B to set all bodytext to my style. This will also make it
possible for Steve's style to be quickly reformatted for pretty
printing with :ha.
----------------------------
revision 2.22
date: 2003-01-11 00:35:32 +0000;  author: noel;  state: Exp;  lines: +7 -2
[6~Added support for .vimoutlinerrc in both ~ and ~/.vimoutliner.
----------------------------
revision 2.21
date: 2002-12-12 13:38:58 +0000;  author: noel;  state: Exp;  lines: +10 -3
Fixed a spelling problem when words contain a '.
----------------------------
revision 2.20
date: 2002-12-11 23:33:16 +0000;  author: noel;  state: Exp;  lines: +7 -3
Removed a debug setting, again (sigh).
Added some iskeyword symbols so spell-check would work on things
like: don't
----------------------------
revision 2.19
date: 2002-12-11 22:55:19 +0000;  author: noel;  state: Exp;  lines: +24 -11
Fixed body text end error. I was checking for too specific a case.
----------------------------
revision 2.18
date: 2002-12-11 14:57:52 +0000;  author: noel;  state: Exp;  lines: +7 -4
Fixed wrapmargin setting and a line counter error during folding.
----------------------------
revision 2.17
date: 2002-12-11 00:42:47 +0000;  author: noel;  state: Exp;  lines: +7 -3
Removed a debug setting, again.
----------------------------
revision 2.16
date: 2002-12-10 22:21:09 +0000;  author: noel;  state: Exp;  lines: +19 -14
Moved body text up one tab level. It seems to be more intuitive
to others.
----------------------------
revision 2.15
date: 2002-12-10 19:24:13 +0000;  author: noel;  state: Exp;  lines: +6 -2
Added a function to auto-wrap lines. This could be a problem for entering long headings.
----------------------------
revision 2.14
date: 2002-12-10 18:11:13 +0000;  author: noel;  state: Exp;  lines: +9 -3
Removed a debug feature
----------------------------
revision 2.13
date: 2002-12-10 17:59:42 +0000;  author: noel;  state: Exp;  lines: +45 -15
Added bodytext.
Added bodytext folding.
Modified MyFoldText to show [TEXT] for folded bodytext.
Added an autocommand to re-sync the folding.
----------------------------
revision 2.12
date: 2002-12-09 18:16:49 +0000;  author: noel;  state: Exp;  lines: +11 -4
Fixed a typo and added an extra \ before & for adding upper cas3e
words.
----------------------------
revision 2.11
date: 2002-12-09 17:15:37 +0000;  author: noel;  state: Exp;  lines: +13 -5
Added ,,kA.
Swapped functions of ,,ka and ,,kA.
	,,ka	add lowercase version of word to dictionary
	,,kA	add word as it appears to dictionary
----------------------------
revision 2.10
date: 2002-12-09 17:08:47 +0000;  author: noel;  state: Exp;  lines: +15 -8
Fixed an error that occurs when there is just a single spelling checker.
----------------------------
revision 2.9
date: 2002-12-09 16:42:02 +0000;  author: noel;  state: Exp;  lines: +13 -7
Fixed error messages on searches with no matches.
This is part of the spell-check search.
----------------------------
revision 2.8
date: 2002-12-09 14:21:29 +0000;  author: noel;  state: Exp;  lines: +11 -8
Fixed spelling highlighting and and spelling searches so that only real matches are highlighed and possible to jump to with ,,kn and ,,kN (and n and N after
that).
Modified the "source" statement that load spellfix.vim. Spellfix.vim now
needs to be in ~/.vimoutliner.
----------------------------
revision 2.7
date: 2002-12-07 22:08:02 +0000;  author: noel;  state: Exp;  lines: +30 -39
finished integration of spellfix.vim
----------------------------
revision 2.6
date: 2002-12-07 16:46:47 +0000;  author: noel;  state: Exp;  lines: +86 -6
Added these commands to enhance the spelling checker
	,,kk	speck-check document highlighting errors
	,,ka	add the word under the cursor to the selected dictionary
	,,kn	search forward to the next spelling error
		N and n both work well with this
	,,kN	search backward to the next spelling error
		N and n both work well with this
	,,kq	unhighlight the spelling errors
----------------------------
revision 2.5
date: 2002-11-27 22:54:28 +0000;  author: noel;  state: Exp;  lines: +22 -16
Changed date and time formats.
changed the mappings of ,,0-,,9 so that ,,1 corresponds to show only
1 level.
----------------------------
revision 2.4
date: 2002-11-26 00:36:08 +0000;  author: noel;  state: Exp;  lines: +68 -62
Added more comments.
Added Steve's GPL header.
Will keep the RCS info in my version but will remove it for
distribution.
----------------------------
revision 2.3
date: 2002-11-21 19:30:37 +0000;  author: noel;  state: Exp;  lines: +21 -8
Included a patchfile from Steve to:
	move the if loaded behavior to a place in the file after the settings
	add an if loaded behavior for the file extension autocommmand
	added the nocindent setting
	changed the ,,,, mapping
	clear the indexexpr setting
----------------------------
revision 2.2
date: 2002-11-16 00:00:10 +0000;  author: noel;  state: Exp;  lines: +215 -196
Added more comments.
Switched the polarity of the if exists(loaded_outliner) function
Commented-out some experimental features.
Grouped the user preferences together and separated out the
VimOutliner operational settings.
----------------------------
revision 2.1
date: 2002-11-15 23:37:39 +0000;  author: noel;  state: Exp;
Version 2 Beta Candidate before pre-release modifications
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/otf/otf.vim,v
Working file: otf/otf.vim
head: 1.3
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
----------------------------
revision 1.3
date: 2003-06-03 19:56:09 +0000;  author: gabriel;  state: Exp;  lines: +2 -2
changed bash function to perl,corrected file name error in otf.vi
----------------------------
revision 1.2
date: 2003-06-02 21:01:16 +0000;  author: gabriel;  state: Exp;  lines: +9 -9
created wishlist_demo.otl
changed output files of Createotl() in otf.vim so users need only a ~/bin directory
----------------------------
revision 1.1
date: 2003-06-01 13:16:32 +0000;  author: gabriel;  state: Exp;
new 'on the fly' files
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/otf/otfREADME,v
Working file: otf/otfREADME
head: 1.4
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 4;	selected revisions: 4
description:
----------------------------
revision 1.4
date: 2003-06-03 20:21:43 +0000;  author: gabriel;  state: Exp;  lines: +2 -1
instruction where to put otl.pl
----------------------------
revision 1.3
date: 2003-06-03 19:56:09 +0000;  author: gabriel;  state: Exp;  lines: +2 -3
changed bash function to perl,corrected file name error in otf.vi
----------------------------
revision 1.2
date: 2003-06-02 21:01:16 +0000;  author: gabriel;  state: Exp;  lines: +12 -7
created wishlist_demo.otl
changed output files of Createotl() in otf.vim so users need only a ~/bin directory
----------------------------
revision 1.1
date: 2003-06-01 13:16:32 +0000;  author: gabriel;  state: Exp;
new 'on the fly' files
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/otf/otl,v
Working file: otf/otl
head: 1.2
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 2;	selected revisions: 2
description:
----------------------------
revision 1.2
date: 2003-06-02 21:01:16 +0000;  author: gabriel;  state: Exp;  lines: +2 -5
created wishlist_demo.otl
changed output files of Createotl() in otf.vim so users need only a ~/bin directory
----------------------------
revision 1.1
date: 2003-06-01 13:16:32 +0000;  author: gabriel;  state: Exp;
new 'on the fly' files
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/otf/otl.pl,v
Working file: otf/otl.pl
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2003-06-03 19:57:00 +0000;  author: gabriel;  state: Exp;
new script replacing otl
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/otf/wishlist_demo.otl,v
Working file: otf/wishlist_demo.otl
head: 1.3
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 3;	selected revisions: 3
description:
----------------------------
revision 1.3
date: 2003-06-03 20:21:43 +0000;  author: gabriel;  state: Exp;  lines: +2 -1
instruction where to put otl.pl
----------------------------
revision 1.2
date: 2003-06-02 21:29:49 +0000;  author: gabriel;  state: Exp;  lines: +28 -18
changed Otl fns branch so it had the correct parents
----------------------------
revision 1.1
date: 2003-06-02 21:01:16 +0000;  author: gabriel;  state: Exp;
created wishlist_demo.otl
changed output files of Createotl() in otf.vim so users need only a ~/bin directory
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/scripts/vo_maketags.pl,v
Working file: scripts/vo_maketags.pl
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2003-06-20 14:13:15 +0000;  author: noel;  state: Exp;
Final documentation tweaks for the final 0.3.0 release.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/syntax/vo_base.vim,v
Working file: syntax/vo_base.vim
head: 2.47
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 47;	selected revisions: 47
description:
Vim Outliner Main Program File
----------------------------
revision 2.47
date: 2005-06-07 15:24:30 +0000;  author: noel;  state: Exp;  lines: +4 -4
The color darkyellow does not appear to exist on some systems. This color
has been changed to darkred.
----------------------------
revision 2.46
date: 2005-01-19 15:03:55 +0000;  author: noel;  state: Exp;  lines: +2 -1
Fixed another W18 error.
----------------------------
revision 2.45
date: 2004-11-27 19:30:43 +0000;  author: noel;  state: Exp;  lines: +6 -5

Minor syntax and installation adjustments.
Change to vo_checkbox to fix a typo.
----------------------------
revision 2.44
date: 2004-05-24 15:56:34 +0000;  author: noel;  state: Exp;  lines: +142 -19
Added highlighting and folding support for:
	Tables (marked with '|')
	User-defined, wrapping text (marked with '>')
	User-defined, non-wrapping text (marked with '<')
----------------------------
revision 2.43
date: 2004-02-17 21:48:47 +0000;  author: noel;  state: Exp;  lines: +0 -297
Removed the embedded and out-of-date documentation.
Removed the detailed revision log. It's too large. From now on
'cvs log' will be needed to see the log.
----------------------------
revision 2.42
date: 2003-10-17 01:34:03 +0000;  author: noel;  state: Exp;  lines: +43 -30

Modified highlighting to support extended character sets.
----------------------------
revision 2.41
date: 2003-06-04 11:25:56 +0000;  author: noel;  state: Exp;  lines: +5 -3
Moved the modification to the tags path outside the "if" statement in
autocommands in ftplugin. Completely removed the line from syntax.
----------------------------
revision 2.40
date: 2003-05-27 15:03:26 +0000;  author: noel;  state: Exp;  lines: +88 -23
Added some documentation on the commands.
----------------------------
revision 2.39
date: 2003-05-27 13:33:34 +0000;  author: noel;  state: Exp;  lines: +73 -16
Added Vim style folds to both vo_base files to make them easier to read.
Added a mode line to the end of each to activate the folds.
Added a "Documentation" section that is mostly empty. This section will
eventually be extracted automatically to form the online help via Vim's
built-in help mechanisms.
----------------------------
revision 2.38
date: 2003-05-23 16:02:42 +0000;  author: noel;  state: Exp;  lines: +8 -3
Added tag file support for ~/.vimoutliner.
----------------------------
revision 2.37
date: 2003-03-01 17:07:53 +0000;  author: noel;  state: Exp;  lines: +34 -36
Removed the bold and underline glamour.
It did not work with the level colorization nor properly cross line boundries.
----------------------------
revision 2.36
date: 2003-02-12 15:40:26 +0000;  author: noel;  state: Exp;  lines: +41 -32
Added some glamour. *word* make word bold and _word_ underlines a word.
----------------------------
revision 2.35
date: 2003-02-09 14:54:10 +0000;  author: noel;  state: Exp;  lines: +7 -3
Removed syntax highlighting for SpellErrors and BadWord. The plugins
include their own.
----------------------------
revision 2.34
date: 2003-02-08 21:59:25 +0000;  author: noel;  state: Exp;  lines: +36 -31
Added SpellErrors and BadWord to the contains attributes of headings
and bodytext. Now we're compatible with engspchk and vimspell.
----------------------------
revision 2.33
date: 2003-02-08 21:34:46 +0000;  author: noel;  state: Exp;  lines: +5 -213
Split out functions as Dillon originally showed.
----------------------------
revision 2.32
date: 2003-01-30 01:47:41 +0000;  author: noel;  state: Exp;  lines: +6 -3
modified switches sent to ispell to make it guess better.
----------------------------
revision 2.31
date: 2003-01-28 22:31:37 +0000;  author: noel;  state: Exp;  lines: +6 -3
Modified setlocal foldtext.... to set foldtext....
----------------------------
revision 2.30
date: 2003-01-22 22:03:12 +0000;  author: noel;  state: Exp;  lines: +8 -3
Fixed bodytext folding method.
----------------------------
revision 2.29
date: 2003-01-21 00:18:50 +0000;  author: noel;  state: Exp;  lines: +20 -7
Fixed a problem with runtimepath.
Added a use_space_colon setting to that one can choose between bodytext
marked with a : or with a space-:.
----------------------------
revision 2.28
date: 2003-01-19 16:46:27 +0000;  author: noel;  state: Exp;  lines: +11 -3
Removed some strange escape characters from a revision comment.
----------------------------
revision 2.27
date: 2003-01-19 16:16:54 +0000;  author: noel;  state: Exp;  lines: +101 -88
Added detection of the color scheme and an alternative set of colors
for dark backgrounds. (well actually for non-"light" backgrounds) at
Dillon Jones' request.
Set the "current_syntax" at Dillon's request.
Modified the exe lines in the source to remove the debugging style I was
using.
----------------------------
revision 2.26
date: 2003-01-16 00:56:51 +0000;  author: noel;  state: Exp;  lines: +26 -23
Changed a bunch of set commands to setlocal commands at the
suggestion of Jeffrey Hood. Thanks, Jeffrey!
----------------------------
revision 2.25
date: 2003-01-13 17:05:08 +0000;  author: noel;  state: Exp;  lines: +14 -11
Fixed a problem with the new regex that define headings.
----------------------------
revision 2.24
date: 2003-01-12 19:08:32 +0000;  author: noel;  state: Exp;  lines: +36 -25
Converted from _ to :
----------------------------
revision 2.23
date: 2003-01-11 21:00:33 +0000;  author: noel;  state: Exp;  lines: +55 -38
Added Matej requirement for personalization settings via
.vimoutlinerrc.
Added Steve's style of bodytext that allows for wrapping and formatting
with have the headings wrap as well. It is currently set for "_" as
the bodytext marker.
Added ,,b to set all bodytext to Steve's style.
Added ,,B to set all bodytext to my style. This will also make it
possible for Steve's style to be quickly reformatted for pretty
printing with :ha.
----------------------------
revision 2.22
date: 2003-01-11 00:35:32 +0000;  author: noel;  state: Exp;  lines: +7 -2
[6~Added support for .vimoutlinerrc in both ~ and ~/.vimoutliner.
----------------------------
revision 2.21
date: 2002-12-12 13:38:58 +0000;  author: noel;  state: Exp;  lines: +10 -3
Fixed a spelling problem when words contain a '.
----------------------------
revision 2.20
date: 2002-12-11 23:33:16 +0000;  author: noel;  state: Exp;  lines: +7 -3
Removed a debug setting, again (sigh).
Added some iskeyword symbols so spell-check would work on things
like: don't
----------------------------
revision 2.19
date: 2002-12-11 22:55:19 +0000;  author: noel;  state: Exp;  lines: +24 -11
Fixed body text end error. I was checking for too specific a case.
----------------------------
revision 2.18
date: 2002-12-11 14:57:52 +0000;  author: noel;  state: Exp;  lines: +7 -4
Fixed wrapmargin setting and a line counter error during folding.
----------------------------
revision 2.17
date: 2002-12-11 00:42:47 +0000;  author: noel;  state: Exp;  lines: +7 -3
Removed a debug setting, again.
----------------------------
revision 2.16
date: 2002-12-10 22:21:09 +0000;  author: noel;  state: Exp;  lines: +19 -14
Moved body text up one tab level. It seems to be more intuitive
to others.
----------------------------
revision 2.15
date: 2002-12-10 19:24:13 +0000;  author: noel;  state: Exp;  lines: +6 -2
Added a function to auto-wrap lines. This could be a problem for entering long headings.
----------------------------
revision 2.14
date: 2002-12-10 18:11:13 +0000;  author: noel;  state: Exp;  lines: +9 -3
Removed a debug feature
----------------------------
revision 2.13
date: 2002-12-10 17:59:42 +0000;  author: noel;  state: Exp;  lines: +45 -15
Added bodytext.
Added bodytext folding.
Modified MyFoldText to show [TEXT] for folded bodytext.
Added an autocommand to re-sync the folding.
----------------------------
revision 2.12
date: 2002-12-09 18:16:49 +0000;  author: noel;  state: Exp;  lines: +11 -4
Fixed a typo and added an extra \ before & for adding upper cas3e
words.
----------------------------
revision 2.11
date: 2002-12-09 17:15:37 +0000;  author: noel;  state: Exp;  lines: +13 -5
Added ,,kA.
Swapped functions of ,,ka and ,,kA.
	,,ka	add lowercase version of word to dictionary
	,,kA	add word as it appears to dictionary
----------------------------
revision 2.10
date: 2002-12-09 17:08:47 +0000;  author: noel;  state: Exp;  lines: +15 -8
Fixed an error that occurs when there is just a single spelling checker.
----------------------------
revision 2.9
date: 2002-12-09 16:42:02 +0000;  author: noel;  state: Exp;  lines: +13 -7
Fixed error messages on searches with no matches.
This is part of the spell-check search.
----------------------------
revision 2.8
date: 2002-12-09 14:21:29 +0000;  author: noel;  state: Exp;  lines: +11 -8
Fixed spelling highlighting and and spelling searches so that only real matches are highlighed and possible to jump to with ,,kn and ,,kN (and n and N after
that).
Modified the "source" statement that load spellfix.vim. Spellfix.vim now
needs to be in ~/.vimoutliner.
----------------------------
revision 2.7
date: 2002-12-07 22:08:02 +0000;  author: noel;  state: Exp;  lines: +30 -39
finished integration of spellfix.vim
----------------------------
revision 2.6
date: 2002-12-07 16:46:47 +0000;  author: noel;  state: Exp;  lines: +86 -6
Added these commands to enhance the spelling checker
	,,kk	speck-check document highlighting errors
	,,ka	add the word under the cursor to the selected dictionary
	,,kn	search forward to the next spelling error
		N and n both work well with this
	,,kN	search backward to the next spelling error
		N and n both work well with this
	,,kq	unhighlight the spelling errors
----------------------------
revision 2.5
date: 2002-11-27 22:54:28 +0000;  author: noel;  state: Exp;  lines: +22 -16
Changed date and time formats.
changed the mappings of ,,0-,,9 so that ,,1 corresponds to show only
1 level.
----------------------------
revision 2.4
date: 2002-11-26 00:36:08 +0000;  author: noel;  state: Exp;  lines: +68 -62
Added more comments.
Added Steve's GPL header.
Will keep the RCS info in my version but will remove it for
distribution.
----------------------------
revision 2.3
date: 2002-11-21 19:30:37 +0000;  author: noel;  state: Exp;  lines: +21 -8
Included a patchfile from Steve to:
	move the if loaded behavior to a place in the file after the settings
	add an if loaded behavior for the file extension autocommmand
	added the nocindent setting
	changed the ,,,, mapping
	clear the indexexpr setting
----------------------------
revision 2.2
date: 2002-11-16 00:00:10 +0000;  author: noel;  state: Exp;  lines: +215 -196
Added more comments.
Switched the polarity of the if exists(loaded_outliner) function
Commented-out some experimental features.
Grouped the user preferences together and separated out the
VimOutliner operational settings.
----------------------------
revision 2.1
date: 2002-11-15 23:37:39 +0000;  author: noel;  state: Exp;
Version 2 Beta Candidate before pre-release modifications
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/tarballs/vimoutliner-0.3.2.tar.gz,v
Working file: tarballs/vimoutliner-0.3.2.tar.gz
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2004-02-23 12:34:28 +0000;  author: noel;  state: Exp;
Adding for posterity's sake.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/tarballs/vimoutliner-0.3.2a.tar.gz,v
Working file: tarballs/vimoutliner-0.3.2a.tar.gz
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2004-02-23 12:34:28 +0000;  author: noel;  state: Exp;
Adding for posterity's sake.
=============================================================================

RCS file: /root/VimOutliner/VimOutliner/tarballs/vimoutliner.0.3.1.tgz,v
Working file: tarballs/vimoutliner.0.3.1.tgz
head: 1.1
branch:
locks: strict
access list:
symbolic names:
keyword substitution: kv
total revisions: 1;	selected revisions: 1
description:
----------------------------
revision 1.1
date: 2003-10-17 02:21:28 +0000;  author: noel;  state: Exp;
Official version 0.3.1
=============================================================================
 
" vim600: set noet ts=8 sw=8 sts=8 tw=78:
INSTALL	[[[1
208
Installing and Testing VimOutliner


    Automatic Method                |vo-auto-install|
    Updating                        |vo-updating|
    Manual Method                   |vo-manual-install|
    Color Schemes                   |vo-colors|
    Testing                         |vo-testing|


Automatic Method

The automatic installation targets Unix-compatible platforms:

From tar archive

    $ tar xzvf vimoutliner-0.3.x.tar.gz
    $ cd vimoutliner
    $ sh install.sh

From zip archive 

    $ unzip vimoutliner-0.3.x.zip
    $ cd vimoutliner-0.3.x
    $ sh install.sh 

From vimball

Open vimoutliner-0.3.x.vba with Vim and type the following command to install in your home vim folder:

:so % 

First you can decide whether to install the VimOutliner files or abort the
process leaving everything unchanged.  Assuming you confirmed the
installation, the script creates the necessary directory tree and copies the
files which provide the core functionality and documentation.

With the second question you decide whether you want to install some brand new
add-ons, currently implementing checkboxes(enabled), hoisting(disabled) 
and smart paste(disabled), as well as several useful external scripts in the vimoutliner/scripts folder.


Updating

Updating an existing installation might require some manual work.

If you are already working with a previous VimOutliner release, there is a
slight chance that the current directory tree is different from your current
one. In this case, you will have to manually migrate your files to the new
locations.

The installation script creates unique backups of files being replaced with
newer versions. So if you put some local customisations into, say
$HOME/.vim/vimoutliner/vimoutlinerrc, you'll probably have to merge the backup
with the new file by hand.


Manual Method

You can also copy the files from the unpacked distribution tarball into their
destination folders by yourself. The following steps are a description of what
has to go where and assume some knowledge of your vim setup.

If you encounter problems, please contact the mailinglist for an immediate
solution and more complete future documentation.  www.lists.vimoutliner.org

If you want to setup VimOutliner on a system running Microsoft Windows, the
directory $HOME denotes the base folder of the vim installation.  If you're on
Unix based system, $HOME is as usual.

You need the following subtrees in your $HOME directory:

    $HOME/.vim/
        doc/
        ftdetect/
        ftplugin/
        syntax/
        vimoutliner/
            plugins/
            scripts/

The distribution tarball unpacks into a directory vimoutliner with the
following contents:

    vimoutliner/
        plugins/             (1)
        scripts/             (1)
    doc/                     (1)
    ftdetect/                (1)
    ftplugin/                (1)
    install.sh*
    syntax/                  (1)
    syntax/                  (1)
    vimoutlinerrc            (1)

(1) The content of these folders should be copied to their namesakes in the
$HOME/.vim folder

Your $HOME/.vimrc file should contain the lines

     filetype plugin indent on
     syntax on

Finally, you need to integrate the online help provided with VimOutliner into
the vim help system.  Start vim and execute the following command:

    :helptags $HOME/.vim/doc

At this point, VimOutliner should be functional.  Type ":help vo" to get
started. To get a quick overview of all VimOutliner commands you can view the 
cheatsheet with ":help vo_cheatsheet". 


Color Schemes

Color schemes specify the colors Vim Outliner uses when displaying an outline.
Colors are specified by object and level.  These objects currently include:
headings, body text, pre- formatted body text, tables and others. See
|vo-objects| for more information.

Color scheme files are located in the system-wide vim colors directory and/or
your $HOME/.vim/colors directory. You can select from any of the provided
schemes. Vim Outliner internally includes a scheme the matches vo_light.vim.

To override the default color scheme you can edit these lines in your
$HOME/.vim/vimoutline/vimoutlinerrc file:

    "Custom Colors **********************************
    " Uncomment this next line to force using VO on
    " a light background
    " colorscheme vo_light
    " Uncomment this next line to force using VO on
    " a dark background
    " colorscheme vo_dark

To create your own scheme follow these simple steps:

1. Go to your $HOME/.vim/colors directory.  If you don't have one, create it.

2. Make a copy of one of the included schemes to use as a starting point. You
   should be able to find them in places like: $HOME/.vim/colors and
   /usr/share/vim/vim63/colors. Put the copy in your own colors directory
   ($HOME/.vim/colors)

3. Edit the scheme file to change whatever colors you wish.

4. Select the scheme in your $HOME/.vim/vimoutline/vimoutlinerrc file.  The
   line should look something like this:

       colorscheme noel

That's all there is to it.


Testing Base Functionality

Open a new outline with the following:

    rm $HOME/vo_test.otl
    gvim $HOME/vo_test.otl or vim $HOME/vo_test.otl

Verify the following:
- Tabs indent the text
- Different indent levels are different colors
- Lines starting with a colon and space word-wrap

  Lines starting with colons are body text. They should word wrap and
  should be a special color (typically green, but it can vary). Verify
  that paragraphs of body text can be reformatted with the Vim gq
  commands.

Verify Interoutline Linking:

Interoutline linking currently requires a working perl installation to
generate the necessary tag file. We are looking into porting this to vim's own
scripting language.

Place the following two lines in $HOME/vo_test.otl:

    _tag_newfile
        $HOME/vo_newfile.otl

Note that in the preceding, the 2nd line should be indented from the first.

To create VimOutliner's tag file $HOME/.vim/vimoutliner/vo_tags.tag, run
vo_maketags.pl, which resides in $HOME/.vimoutliner/scripts/: $
$HOME/.vim/vimoutliner/scripts/vo_maketags.pl $HOME/vo_test.otl

Try the following:
- In $HOME/vo_test.otl
- Cursor to the _tag_newfile marker
- Press CTRL-K
    You should be brought to $HOME/vo_newfile.otl
- Press CTRL-N
    You should be brought back to $HOME/vo_test.otl
Note:
    CTRL-K is a VimOutliner synonym for CTRL-]
    CTRL-N is a VimOutliner synonym for CTRL-T


Debian Installation

Debian does include Vim Outliner as a package. However some Debian versions
require this line to be added to your .vimrc file:

    syntax on


install.sh	[[[1
161
#!/bin/bash

homedir=$HOME
#homedir=./test
vimdir=$homedir/.vim
vodir=$vimdir/vimoutliner
OS=`uname`

#BACKUP FILE NAMES
bext=`date +_%T_%F.old`
if [ $OS == Linux ] ; then 
       backupargs="-bS $bext"
elif [ $OS == FreeBSD ] ; then
       backupargs="-bB $bext"
else backupargs="";
fi


#SOME FUNCTIONS
function sure? {
	read -p" (y/N)? " 
	echo
	test $REPLY = "y" || test $REPLY = "Y"
}

function make_dir {
	  test -d $1 || {
		  echo "    creating: $1"
		  mkdir $1
		  created=1
  	}
}

function copyfile {
	echo "    installing: $2/$1"
	install $backupargs $1 $2/$1
}

function copydir {
	files=`ls $1`
	for i in $files; do 
		echo "    installing: $2/$i"
		if [[ -d $1/$i ]]; then
			mkdir -p $2/$i
			copydir $1/$i $2/$i
		else
			install $backupargs $1/$i $2
		fi
	done
}

#START THE INSTALL
cat <<EOT
Vim Outliner Installation
    This script is safe for installing Vim Outliner and for upgrading an
    existing Vim Outliner installation. Existing files will be backed-up
    with this extension: $bext. This will simplify
    recovery of any of the old files.

EOT
echo -n "Would you like to continue "
sure? || exit


#CREATE NECESSARY DIRECTORIES
created=0
echo checking/creating needed directories
make_dir $vimdir
make_dir $vimdir/syntax
make_dir $vimdir/ftplugin
make_dir $vimdir/ftdetect
make_dir $vimdir/doc
make_dir $vimdir/colors
make_dir $vodir
make_dir $vodir/plugin
make_dir $vodir/scripts
if [ $created -eq 0 ]; then echo "    none created"; fi

#TWEAK .vimrc
modified=0
echo checking/creating/modifying $homedir/.vimrc
test -f $homedir/.vimrc || { echo "    creating $homedir/.vimrc"
                            touch $homedir/.vimrc
		    }
egrep -lq "filetype[[:space:]]+plugin[[:space:]]+indent[[:space:]]+on" $homedir/.vimrc || \
        { modified=1
	  echo "filetype plugin indent on" >> $homedir/.vimrc
	  }
egrep -lq "syntax[[:space:]]+on" $homedir/.vimrc || \
        { modified=1
	  echo "syntax on" >> $homedir/.vimrc
	  }
if [ $modified -eq 0 ] ; then 
	echo "    not modified"; 
else
	echo "    modifying $homedir/.vimrc"
fi

#TWEAK .vim/filetype.vim
modified=0
echo checking/creating/modifying $homedir/.vim/filetype.vim
test -f $homedir/.vim/filetype.vim || \
       { echo "    creating $homedir/.vim/filetype.vim"
       touch $homedir/.vim/filetype.vim 
       }
egrep -lq "runtime\! ftdetect/\*.vim" $homedir/.vim/filetype.vim || \
       { echo "    modifying $homedir/.vim/filetype.vim"
	 modified=1
         echo "runtime! ftdetect/*.vim" >> $homedir/.vim/filetype.vim
       }
if [ $modified -eq 0 ] ; then echo "    not modified"; fi

#COPY FILES AND BACKUP ANY EXISTING FILES
echo "installing files and making backups if necessary (*$bext)"
copyfile syntax/vo_base.vim $vimdir
copyfile ftplugin/vo_base.vim $vimdir
copyfile ftdetect/vo_base.vim $vimdir
copyfile doc/vo_readme.txt $vimdir
copyfile doc/vo_cheatsheet.txt $vimdir
copyfile colors/vo_dark.vim $vimdir
copyfile colors/vo_light.vim $vimdir
copyfile vimoutliner/vimoutlinerrc $vimdir
copyfile vimoutliner/scripts/vo_maketags.pl $vimdir

#INCORPORATE DOCS
echo installing documentation
vim -c "helptags $HOME/.vim/doc" -c q

#INSTALL THE ADD-ONS
cat <<EOT
Add-ons
    There are optional Vim Outliner plugins to handle checkboxes, hoisting and
    smartpaste. There is also a script to convert a Vim Outliner .otl file
    to a html file, as well as many other external scripts included. 
    The plugins will be stored in $vodir/plugin and the scripts will be installed in 
    $vodir/scripts.

EOT

echo -n "Would you like to install these "
if sure?; then
	echo installing add-ons
	copydir vimoutliner/plugin $vodir/plugin
	copydir vimoutliner/scripts $vodir/scripts
fi

#ALL DONE
echo installation complete

cat <<EOT

**********************************************************************
* For help with using VimOutliner simply execute ":help vo" within   *
* vim. For a quick overview of all commands execute:                 * 
* ":help vo_cheatsheet"                                              *
*                                                                    *
* Additional scripts are available in the scripts folder, see        *
* $HOME/.vim/vimoutliner/scripts                                     *
**********************************************************************

EOT
LICENSE	[[[1
11
LICENSE                                                      

    VimOutliner
    Copyright (C) 2001, 2003 by Steve Litt
    Copyright (C) 2004 by Noel Henson
    Licensed under the GNU General Public License (GPL), version 2
    Absolutely no warranty.
    
    If your distro doesn't come with this file
        HTML: http://www.gnu.org/copyleft/gpl.html
        Text: http://www.gnu.org/copyleft/gpl.txt 
