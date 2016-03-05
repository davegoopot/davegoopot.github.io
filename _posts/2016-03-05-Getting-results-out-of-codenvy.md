---
layout: post
title: Getting Results File out of Codenvy
---

I have something of a crush on [Codenvy](https://codenvy.com/), the on-demand in-your-browser development environment. The main wrinkle I've encountered with Codenvy is that it is not easy to get a files out their hosted Docker environment.

I have a small batch process I have coded up.  It is easy enough to pass in the input files.  The process runs and produces a single Excel file as the output.  The way I get at the output file is to set up the Docker runner so that it emails the results to my Gmail account.

Here at the steps:

1. Install Mutt and SSMPT in the Docker runner:
<pre>
<code>
RUN sudo apt-get install -y mutt openssl ca-certificates ssmtp
</code>
</pre>

2. Create an ssmpt.conf file in my Codenvy project.  This file contains:
<pre>
<code>
root=MY-GMAIL-EMAIL-ADDRESS
mailhub=smtp.gmail.com:587
rewriteDomain=
hostname=MY-GMAIL-EMAIL-ADDRESS
UseSTARTTLS=YES
AuthUser=MY-GMAIL-EMAIL-ADDRESS
AuthPass=MY-GMAIL-PASSWORD
FromLineOverride=YES
</code>
</pre>

3. Add the config into the Docker runner:
<pre>
<code>
COPY $src$/ssmtp.conf /etc/ssmtp/
</code>
</pre>

4. Run the process to create the output file.

5. Use this one-liner to email the results:

<pre>
<code>
RUN echo Result attached. | mutt -s "Matching Results" MY-GMAIL-EMAIL-ADDRESS -a /home/user/output.xlsx
</code>
</pre>


