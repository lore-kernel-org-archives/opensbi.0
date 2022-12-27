From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Dec 2022 21:49:07 +0800
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <878ritdl45.fsf@igel.home>
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
 <374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com> <CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
 <87cz85dmmd.fsf@igel.home> <CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
 <878ritdl45.fsf@igel.home>
Message-ID: <CAEUhbmWx9=YYZQ1SW_a9rkLraJ-R4ABStdMASUARVkBAx0mYUA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 27, 2022 at 9:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 27 2022, Bin Meng wrote:
>
> > On Tue, Dec 27, 2022 at 9:04 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >>
> >> On Dez 27 2022, Bin Meng wrote:
> >>
> >> > Changing the array size to PLIC_SOURCES + 1 does not make sense. The
> >> > PLIC_SOURCES should be 176 which is correct as it includes source 0 on
> >> > the Allwinner SoC. The "riscv,ndev" [1] should not be 176 otherwise it
> >> > will create a buffer overrun.
> >>
> >> The range check will always allow that overrrun.
> >>
> >
> > Well, with a correct dtb it doesn't.
>
> You cannot argue with the dtb, since this is externally controlled.
>
> > Strictly speaking, your proposed fix allows that overrun too
>
> How?
>

Passing num = 200 to plic_priority_save/restore.

You can argue my example is a misuse of the API, but I can argue a
wrong dtb should not be in the first place too.

Regards,
Bin

