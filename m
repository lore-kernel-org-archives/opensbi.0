From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 26 Dec 2023 21:21:49 +0530
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
In-Reply-To: <87le9i8vf0.fsf@linux-m68k.org>
References: <20231221014432.393824-1-wxjstz@126.com> <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
 <87le9i8vf0.fsf@linux-m68k.org>
Message-ID: <CAK9=C2VZLvj3D60Wtnd3f9U0xH+ffaVQ81ygOR7d5YeLtsUF=Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 25, 2023 at 3:19?PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 25 2023, Anup Patel wrote:
>
> > If "cur_hartid < hbase + BITS_PER_LONG" then
> > "1UL << (cur_hartid - hbase) == 0x0"
>
> If cur_hartid - hbase < BITS_PER_LONG, then 1UL << (cur_hartid - hbase)
> will not be 0.  If cur_hartid - hbase >= BITS_PER_LONG, then 1UL <<
> (cur_hartid - hbase) will overflow and be undefined.

I meant "cur_hartid >= hbase + BITS_PER_LONG" which is
the overflow case.

Since the overflow behavior is undefined, we have the
explicit check added by this patch.

Regards,
Anup

>
> --
> Andreas Schwab, schwab at linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

