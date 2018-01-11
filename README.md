<h1> WILLIAM FINDLAY'S MINIX DOTFILES </h1>

<p>
  My dotfiles for the minix virtual machine image for COMP3000 designed for use in a linux host OS environment.
</p>

<h2>IMPORTANT</h2>
<p>
  To configure git for the first time, type the following:<br/>
  &nbsp;&nbsp;git config --global user.name &lt;your username&gt;<br/>
  &nbsp;&nbsp;git config --global user.email &lt;your email&gt;<br/>
  &nbsp;&nbsp;git config --global http.sslVerify false<br/>
  <br/>
  To set up SSH on your VM, go into VirtualBox <b>settings -&gt; network -&gt;
  advanced -&gt; port forwarding...</b><br/> Then set <b>Host IP to 127.0.0.1 and guest IP
  to 10.0.2.15</b>. Also make sure <b>Protocol is TCP, Host Port is 2222 and
  Guest Port is 22</b>.
</p>

<h2>Also note...</h2>
<p>
  It should be noted that the termite.terminfo need only be used if SSHing from the
  termite terminal for Linux. If you wish to use Termite, you MUST recompile
  termite.terminfo using the tic command in termite. If you do not compile
  termite.terminfo, your terminal WILL NOT WORK PROPERLY.
</p>
