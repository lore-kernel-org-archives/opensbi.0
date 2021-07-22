From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 22 Jul 2021 20:33:42 +0100
Subject: [PATCH 2/2] lib: utils: support both of gpio-poweroff, gpio-reset
In-Reply-To: <20210722105359.18622-3-xypron.glpk@gmx.de>
References: <20210722105359.18622-1-xypron.glpk@gmx.de>
 <20210722105359.18622-3-xypron.glpk@gmx.de>
Message-ID: <35DD8491-3162-458D-97C3-BC09E1F2ABC1@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22 Jul 2021, at 11:53, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> 
> The generic GPIO reset driver has two entries in the match table:
> "gpio-poweroff", "gpio-reset". Only the first entry is considered by
> fdt_reset_init().

This is inaccurate. fdt_reset_init does consider all entries in turn.
The problem is that OpenSBI?s driver attachment is backwards from
normal operating systems. Normal operating systems will iterate over
all devices, and for each device will iterate over all drivers trying
to find the best one, if any. This means multiple instances of the same
driver (including for very different compatible strings) can exist. In
OpenSBI, however, this is turned on its head, with it iterating over
all drivers, trying to find a device that each driver can attach to.
This means multiple instances of the same driver cannot exist, so
whichever of gpio-poweroff and gpio-reset appears in the device tree
first is the one that gets attached to. Splitting the two sets of
functionality out into their own drivers therefore works around this
limitation, though arguably it would be better to alter OpenSBI to
follow a normal driver attachment process as I?m sure this will come up
again eventually.

Jess


