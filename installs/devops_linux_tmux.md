

Getting started with Tmux
=========================

Updated Aug 28, 2019

<span class="inline-block mx-2">•</span>

4 min read

<span class="underline"></span>

Contents

-   [What is
    tmux?](https://linuxize.com/post/getting-started-with-tmux/index.html#what-is-tmux)
-   [Installing
    Tmux](https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux)
    -   [Installing Tmux on Ubuntu and
        Debian](https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux-on-ubuntu-and-debian)
    -   [Installing Tmux on CentOS and
        Fedora](https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux-on-centos-and-fedora)
    -   [Installing Tmux on
        macOS](https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux-on-macos)
-   [Starting Your First Tmux
    Session](https://linuxize.com/post/getting-started-with-tmux/index.html#starting-your-first-tmux-session)
-   [Creating Named Tmux
    Sessions](https://linuxize.com/post/getting-started-with-tmux/index.html#creating-named-tmux-sessions)
-   [Detaching from Tmux
    Session](https://linuxize.com/post/getting-started-with-tmux/index.html#detaching-from-tmux-session)
-   [Re-attaching to Tmux
    Session](https://linuxize.com/post/getting-started-with-tmux/index.html#re-attaching-to-tmux-session)
-   [Working with Tmux Windows and
    Panes](https://linuxize.com/post/getting-started-with-tmux/index.html#working-with-tmux-windows-and-panes)
-   [Customizing
    Tmux](https://linuxize.com/post/getting-started-with-tmux/index.html#customizing-tmux)
-   [Basic Tmux
    Usage](https://linuxize.com/post/getting-started-with-tmux/index.html#basic-tmux-usage)
-   [Conclusion](https://linuxize.com/post/getting-started-with-tmux/index.html#conclusion)

<figure>
<embed src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%221000%22%20height%3D%22530%22%3E%3C%2Fsvg%3E" class="ezlazyload w-full h-full absolute inset-0 m-auto" sizes="(max-width: 991px) 100w, 1000px" />
</figure>This guide will go through the installation and basic usage of
Tmux to get you up and running.

What is tmux? <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#what-is-tmux" class="headline-link">#</a>
-------------------------------------------------------------------------------------------------------------------------------

Tmux is a terminal multiplexer an alternative to [GNU
Screen](https://linuxize.com/post/how-to-use-linux-screen/) . In other
words, it means that you can start a Tmux session and then open multiple
windows inside that session. Each window occupies the entire screen and
can be split into rectangular panes.<span
id="ezoic-pub-ad-placeholder-158" class="ezoic-adpicker-ad"></span>

With Tmux you can easily switch between multiple programs in one
terminal, detach them and reattach them to a different terminal.<span
id="ezoic-pub-ad-placeholder-138" class="ezoic-adpicker-ad"></span>

Tmux sessions are persistent, which means that programs running in Tmux
will continue to run even if you get disconnected.

All commands in Tmux start with a prefix, which by default is

Installing Tmux <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux" class="headline-link">#</a>
------------------------------------------------------------------------------------------------------------------------------------

You can easily install Tmux using the package manager of your
distro.
### Installing Tmux on Ubuntu and Debian <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux-on-ubuntu-and-debian" class="headline-link">#</a>

    sudo apt install tmux

### Installing Tmux on CentOS and Fedora <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux-on-centos-and-fedora" class="headline-link">#</a>

    sudo yum install tmux

### Installing Tmux on macOS <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#installing-tmux-on-macos" class="headline-link">#</a>

    brew install tmux

Starting Your First Tmux Session <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#starting-your-first-tmux-session" class="headline-link">#</a>
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

To start your first Tmux session, simply type `tmux` in your

    tmux

This will open a new session, create a new window, and start a shell in
that window.

Once you are in Tmux you’ll notice a status line at the bottom of the
screen which shows information about the current session.

You can now run your first Tmux command. For example, to get a list of
all commands, you would type:

`Ctrl+b` `?`

Creating Named Tmux Sessions <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#creating-named-tmux-sessions" class="headline-link">#</a>
--------------------------------------------------------------------------------------------------------------------------------------------------------------

By default, Tmux sessions are named numerically. Named sessions are
useful when you run multiple Tmux sessions. To create a new named
session, run the `tmux` command with the following arguments:<span
id="ezoic-pub-ad-placeholder-142" class="ezoic-adpicker-ad"></span><span
class="ezoic-ad medrectangle-4 adtester-container adtester-container-142"
style="display:block !important;float:none;margin-bottom:24px !important;margin-left:0px !important;margin-right:0px !important;margin-top:24px !important;min-height:280px;min-width:336px;text-align:center !important;"
data-ez-name="linuxize_com-medrectangle-4"><span
id="div-gpt-ad-linuxize_com-medrectangle-4-0" class="ezoic-ad ezoic-adl"
ezaw="336" ezah="280"
style="position:relative;z-index:0;display:inline-block;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:280px;min-width:336px;"></span></span>

    tmux new -s session_name

It’s always a good idea to choose a descriptive session name.<span
id="ezoic-pub-ad-placeholder-160" class="ezoic-adpicker-ad"></span>

Detaching from Tmux Session <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#detaching-from-tmux-session" class="headline-link">#</a>
------------------------------------------------------------------------------------------------------------------------------------------------------------

You can detach from the Tmux session and return to your normal shell by
typing:

`Ctrl+b` `d`

The program running in the Tmux session will continue to run after you
detach from the session.
Re-attaching to Tmux Session <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#re-attaching-to-tmux-session" class="headline-link">#</a>
--------------------------------------------------------------------------------------------------------------------------------------------------------------

To attach to a session first, you need
to find the name of the session. To get a list of the currently running
sessions type:

    tmux ls

The name of the session is the first column of the output.

    0: 1 windows (created Sat Sep 15 09:38:43 2018) [158x35]
    my_named_session: 1 windows (created Sat Sep 15 10:13:11 2018) [78x35]

As you can see from the output, there are two running Tmux sessions. The
first one is named `0` and the second one `my_named_session`.<span
id="ezoic-pub-ad-placeholder-144" class="ezoic-adpicker-ad"></span>

For example, to attach to session `0`, you would type:

    tmux attach-session -t 0

Working with Tmux Windows and Panes <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#working-with-tmux-windows-and-panes" class="headline-link">#</a>
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

When you start a new Tmux session, by default, it creates a single
window with a shell in it.<span id="ezoic-pub-ad-placeholder-157"
class="ezoic-adpicker-ad"></span>

To create a new window with shell type `Ctrl+b` `c`, the first available
number from the range `0...9` will be assigned to it.<span
id="ezoic-pub-ad-placeholder-145" class="ezoic-adpicker-ad"></span>

A list of all windows is shown on the status line at the bottom of the
screen.

Below are some most common commands for managing Tmux windows and panes:

-   `Ctrl+b` `c` Create a new window (with shell)
-   `Ctrl+b` `w` Choose window from a list
-   `Ctrl+b` `0` Switch to window 0 (by number )
-   `Ctrl+b` `,` Rename the current window
-   `Ctrl+b` `%` Split current pane horizontally into two panes
-   `Ctrl+b` `"` Split current pane vertically into two panes
-   `Ctrl+b` `o` Go to the next pane
-   `Ctrl+b` `;` Toggle between the current and previous pane
-   `Ctrl+b` `x` Close the current pane

Customizing Tmux <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#customizing-tmux" class="headline-link">#</a>
--------------------------------------------------------------------------------------------------------------------------------------

When Tmux is started, it reads its configuration parameters from
`~/.tmux.conf` if the file is present.

Here is a sample `~/.tmux.conf` configuration with customized status
line and few additional options:<span id="ezoic-pub-ad-placeholder-146"
class="ezoic-adpicker-ad"></span>

~/.tmux.conf

    # Improve colors
    set -g default-terminal 'screen-256color'

    # Set scrollback buffer to 10000
    set -g history-limit 10000

    # Customize the status line
    set -g status-fg  green
    set -g status-bg  black

<figure>
<embed src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%221024%22%20height%3D%22768%22%3E%3C%2Fsvg%3E" class="ezlazyload w-full h-full absolute inset-0 m-auto" sizes="(max-width: 991px) 100w, 1024px" />
</figure>Basic Tmux Usage <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#basic-tmux-usage" class="headline-link">#</a>
--------------------------------------------------------------------------------------------------------------------------------------

Below are the most basic steps for getting started with Tmux:

1.  On the command prompt, type `tmux new -s my_session`,
2.  Run the desired program.
3.  Use the key sequence `Ctrl-b` + `d` to detach from the session.
4.  Reattach to the Tmux session by typing
    `tmux attach-session -t my_session`.

Conclusion <a href="https://linuxize.com/post/getting-started-with-tmux/index.html#conclusion" class="headline-link">#</a>
--------------------------------------------------------------------------------------------------------------------------

In this tutorial, you learned how to use Tmux. Now you can start
creating multiple Tmux windows in a single session, split windows by
creating new panes, navigate between windows, detach and resume
sessions, and personalize your Tmux instance using the `.tmux.conf`
file.

To learn more about Tmux type `man tmux` in your terminal or visit the
[Tmux User’s
Manual](https://man.openbsd.org/OpenBSD-current/man1/tmux.1) page.

If you have any questions or feedback, feel free to leave a comment.

<a href="https://linuxize.com/tags/tmux/" class="font-medium text-sm bg-indigo-700 hover:bg-indigo-800 mr-2 mt-2 px-4 py-2 rounded text-white tracking-wide">tmux</a>
<a href="https://linuxize.com/tags/terminal/" class="font-medium text-sm bg-indigo-700 hover:bg-indigo-800 mr-2 mt-2 px-4 py-2 rounded text-white tracking-wide">terminal</a>

<span id="ezoic-pub-ad-placeholder-102"
class="ezoic-adpicker-ad"></span>

<span id="ezoic-pub-ad-placeholder-126"
class="ezoic-adpicker-ad"></span><span
class="ezoic-ad box-1 adtester-container adtester-container-126 ezoic-ad-adaptive"
style="background:0 0 !important;display:block !important;float:none;margin-left:auto !important;margin-right:auto !important;min-height:1050px;min-width:300px;text-align:center !important;width:300px;"
data-ez-name="linuxize_com-box-1"><span
class="ezoic-ad box-1 adtester-container adtester-container-126"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-box-1"><span
id="div-gpt-ad-linuxize_com-box-1-0" class="ezoic-ad" ezaw="300"
ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span></span>

<span class="ezoic-ad box-1 adtester-container adtester-container-126"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-box-1"><span
id="div-gpt-ad-linuxize_com-box-1-0_1" class="ezoic-ad" ezaw="300"
ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span>

<span class="ezoic-ad box-1 adtester-container adtester-container-126"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-box-1"><span
id="div-gpt-ad-linuxize_com-box-1-0_2" class="ezoic-ad" ezaw="300"
ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span>

<span class="ezoic-ad box-1 adtester-container adtester-container-126"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-box-1"><span
id="div-gpt-ad-linuxize_com-box-1-0_3" class="ezoic-ad" ezaw="300"
ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span>

Related Tutorials

-   <a href="https://linuxize.com/post/linux-file-command/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">Linux File Command</a>
-   <a href="https://linuxize.com/post/how-to-create-bash-aliases/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">How to Create Bash Aliases</a>
-   <a href="https://linuxize.com/post/how-to-rename-files-in-linux/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">How to Rename Files and Directories in Linux</a>
-   <a href="https://linuxize.com/post/scheduling-cron-jobs-with-crontab/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">Scheduling Cron Jobs with Crontab</a>
-   <a href="https://linuxize.com/post/linux-time-command/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">Linux Time Command</a>
-   <a href="https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">How to Create Users in Linux (useradd Command)</a>
-   <a href="https://linuxize.com/post/linux-chown-command/" class="dark:text-gray-300 dark-hover:text-gray-100 hover:text-gray-900 font-medium text-gray-700 text-sm">Chown Command in Linux (File Ownership)</a>

<span class="underline"></span>

<span id="ezoic-pub-ad-placeholder-105"
class="ezoic-adpicker-ad"></span><span
class="ezoic-ad large-leaderboard-1 adtester-container adtester-container-105 ezoic-ad-adaptive"
style="background:0 0 !important;display:block !important;float:none;margin-left:auto !important;margin-right:auto !important;min-height:1050px;min-width:300px;text-align:center !important;width:300px;"
data-ez-name="linuxize_com-large-leaderboard-1"><span
class="ezoic-ad large-leaderboard-1 adtester-container adtester-container-105"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-large-leaderboard-1"><span
id="div-gpt-ad-linuxize_com-large-leaderboard-1-0"
class="ezoic-ad ezoic-adl" ezaw="300" ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span></span>

<span
class="ezoic-ad large-leaderboard-1 adtester-container adtester-container-105"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-large-leaderboard-1"><span
id="div-gpt-ad-linuxize_com-large-leaderboard-1-0_1"
class="ezoic-ad ezoic-adl" ezaw="300" ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span>

<span
class="ezoic-ad large-leaderboard-1 adtester-container adtester-container-105"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-large-leaderboard-1"><span
id="div-gpt-ad-linuxize_com-large-leaderboard-1-0_2"
class="ezoic-ad ezoic-adl" ezaw="300" ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span>

<span
class="ezoic-ad large-leaderboard-1 adtester-container adtester-container-105"
style="display:block !important;float:none;margin-bottom:6px !important;margin-left:0px !important;margin-right:0px !important;margin-top:0 !important;min-height:250px;min-width:300px;text-align:center !important;"
data-ez-name="linuxize_com-large-leaderboard-1"><span
id="div-gpt-ad-linuxize_com-large-leaderboard-1-0_3"
class="ezoic-ad ezoic-adl" ezaw="300" ezah="262"
style="position:relative;z-index:0;display:inline-block;min-height:262px;min-width:300px;"></span></span>

If you like our content, please consider buying us a coffee.  
Thank you for your support!

<span class="font-medium text-xs uppercase ml-2">Buy me a coffee</span>

Sign up to our newsletter and get our latest tutorials and news straight
to your mailbox.

<span class="text-center">Subscribe</span>

We’ll never share your email address or spam you.

Related Articles
----------------

<a href="https://linuxize.com/post/linux-file-command/" class="w-full flex md:mb-0 md:w-1/3 overflow-hidden px-4 mb-8"></a>

Dec 21, 2018

### Linux File Command

<figure>
<embed src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%221000%22%20height%3D%22530%22%3E%3C%2Fsvg%3E" class="ezlazyload w-full h-full absolute inset-0 m-auto" sizes="(max-width: 991px) 100w, 1000px" />
</figure>

<a href="https://linuxize.com/post/how-to-create-bash-aliases/" class="w-full flex md:mb-0 md:w-1/3 overflow-hidden px-4 mb-8"></a>

Dec 20, 2018

### How to Create Bash Aliases

<figure>
<embed src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%221000%22%20height%3D%22530%22%3E%3C%2Fsvg%3E" class="ezlazyload w-full h-full absolute inset-0 m-auto" sizes="(max-width: 991px) 100w, 1000px" />
</figure>

<a href="https://linuxize.com/post/how-to-rename-files-in-linux/" class="w-full flex md:mb-0 md:w-1/3 overflow-hidden px-4 mb-0"></a>

Dec 19, 2018

### How to Rename Files and Directories in Linux

<figure>
<embed src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%221000%22%20height%3D%22530%22%3E%3C%2Fsvg%3E" class="ezlazyload w-full h-full absolute inset-0 m-auto" sizes="(max-width: 991px) 100w, 1000px" />
</figure>

<a href="https://linuxize.com/post/getting-started-with-tmux/#disqus_thread" class="w-full block bg-gray-200 dark:bg-gray-900 disqus-comment-count disqus-load md:py-8 py-4 text-center" title="Show comments for post">Write a comment</a>

Please enable JavaScript to view the [comments powered by
Disqus.](https://disqus.com/?ref_noscript)

<span class="small">ESC</span>

<span
class="dark:text-gray-300 text-gray-800 mb-2 block lg:inline-block lg:mb-0 lg:mr-8">©
2020 Linuxize.com</span>
<a href="https://linuxize.com/privacy-policy/" class="dark:text-gray-300 dark-hover:text-gray-100 no-underline mr-4 footer-menu-item hover:text-gray-800 inline-block lg:mt-0 text-gray-900">Privacy Policy</a>
<a href="https://linuxize.com/terms-of-service/" class="dark:text-gray-300 dark-hover:text-gray-100 no-underline mr-4 footer-menu-item hover:text-gray-800 inline-block lg:mt-0 text-gray-900">Terms</a>
<a href="https://linuxize.com/contact/" class="dark:text-gray-300 dark-hover:text-gray-100 no-underline footer-menu-item hover:text-gray-800 inline-block lg:mt-0 text-gray-900 mr-0">Contact</a>
