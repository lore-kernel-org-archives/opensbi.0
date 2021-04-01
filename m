From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 1 Apr 2021 12:48:35 +0000
Subject: [PATCH] firmware: Remove redundant add instruction from trap
 restore path
In-Reply-To: <02D9B822-5A8D-4F94-89F3-5BB451429632@jrtc27.com>
References: <20210401111945.318643-1-anup.patel@wdc.com>
 <02D9B822-5A8D-4F94-89F3-5BB451429632@jrtc27.com>
Message-ID: <DM6PR04MB62018DB9448EC99087D0F23A8D7B9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Jessica Clarke <jrtc27@jrtc27.com>
> Sent: 01 April 2021 17:47
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>;
> opensbi at lists.infradead.org
> Subject: Re: [PATCH] firmware: Remove redundant add instruction from trap
> restore path
> 
> On 1 Apr 2021, at 12:19, Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The "add sp, a0, zero" instruction in the trap restore path is
> > redundant and can be avoided if TRAP_RESTORE_xyz() assembly macros
> use
> > a0 as the base register instead of sp.
> 
> Are interrupts disabled at this point?

Yes, interrupts are disabled.

Currently, we are not enabling interrupts while running in M-mode.
We only get interrupts in M-mode when we are in lower privilege modes.

Regards,
Anup


