From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 28 Sep 2021 13:32:50 +0300
Subject: [PATCH 0/4] reboot SiFive Unmatched via PMIC
In-Reply-To: <05f7cf09-a0a4-0f53-6e82-5d0873cf430f@canonical.com>
References: <20210924113347.3576-1-nikita.shubin@maquefel.me>
 <CAEUhbmWUiTWuVNxEDo3mRCAh2KBfYs8Y46egsAoNenKy=wVa8w@mail.gmail.com>
 <05f7cf09-a0a4-0f53-6e82-5d0873cf430f@canonical.com>
Message-ID: <20210928133250.086db2c4@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Heinrich,

On Sat, 25 Sep 2021 10:11:29 +0200
Heinrich Schuchardt <heinrich.schuchardt@canonical.com> wrote:

> At some point we will have to decide on a configuration system to
> enable only those drivers that are needed for the current hardware. 
> Unfortunately we cannot reuse Linux Kconfig as our license is BSD-2.
> 

Actually KConfig license does not apply to the code it is building and
configuring. 


> Currently if a reset driver fails it simply ends up hanging in an 
> endless loop.
> 
> The SiFive Unmatched will use GPIO for poweroff and I2C for reset.
> 
> We need the ability to iterate through multiple reset drivers. If 
> resetting is not possible, we should return to the caller with an
> error code.

How it is supposed to return to Linux kernel reset handler for example
and for what ? Could you please explain in detail ?

Yours,
Nikita Shubin


