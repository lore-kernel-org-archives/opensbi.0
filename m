From: Xiang W <wxjstz@126.com>
Date: Sun, 14 Nov 2021 09:27:35 +0800
Subject: [PATCH] lib: utils/serial: Modify uart_getc to a blocking function
In-Reply-To: <170BB07D-DC33-4A66-8387-486D25A8E043@jrtc27.com>
References: <20211113070622.90364-1-wxjstz@126.com>
 <81552989-313B-46A5-9C21-DFF37C527C06@jrtc27.com>
 <3c0b5c46afeb692a8d98da4e9645f114251a5db2.camel@126.com>
 <170BB07D-DC33-4A66-8387-486D25A8E043@jrtc27.com>
Message-ID: <f714339e3f54a590a53add3d13f770dfdcfd1b79.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-11-14???? 00:31 +0000?Jessica Clarke???
> On 14 Nov 2021, at 00:23, Xiang W <wxjstz@126.com> wrote:
> > ? 2021-11-13???? 22:11 +0000?Jessica Clarke???
> > > On 13 Nov 2021, at 07:06, Xiang W <wxjstz@126.com> wrote:
> > > > 
> > > > If uart_getc is non-blocking, if the sending end is faster than
> > > > the
> > > > receiving end, the data received by some functions(sbi_gets) is
> > > > incomplete
> > > 
> > > Without hardware flow control this is always going to be true.
> > > Making
> > > getc blocking does not change that. Moreover, making it blocking
> > > means
> > > there is no longer a way to poll, whereas having it be non-
> > > blocking
> > > means you can poll, and if you want to make it blocking you can
> > > always
> > > put a loop in the caller (which also avoids putting it in every
> > > single
> > > driver).
> > > 
> > > Also, this breaks the SBI getchar call; it?s supposed to be
> > > non-blocking, but this makes it blocking, so it is impossible for
> > > an
> > > OS
> > > to poll the SBI console.
> > 
> > uart get does not support and returns the same value without
> > receiving
> > data. So polling will also cause problems
> > 
> > int sbi_getc(void)
> > {
> > ????????if (console_dev && console_dev->console_getc)
> > ????????????????// Return -1 without valid data
> > ????????????????return console_dev->console_getc();
> > ????????return -1;
> > }
> 
> I do not understand what you are saying. There is no problem here. If
> there is no character available, either because there is no UART or
> because the UART?s receive buffer has been drained, the OS is told
> there is no character. What?s wrong with that?
What I mean is that the program that executes the sbi call cannot
confirm whether it has not implemented console_dev->getc or has not
received data

Found the linux polling code, linux opened a kernel thread for polling.
Therefore, no implemented  is the same as unreceived data.

Thk
Xiang W
> 
> The only problem I can see is that BBL returns 0 when there is no
> UART
> and -1 when there?s a UART but no character available, so this is not
> a
> correct implementation of the legacy SBI, but probably a more
> sensible
> interface given 0 is a valid character.
> 
> Jess



