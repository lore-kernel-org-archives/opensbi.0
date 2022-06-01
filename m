From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 1 Jun 2022 20:16:17 +0530
Subject: console putchar/getchar ecalls and sbi v02
In-Reply-To: <2594568.q0ZmV6gNhb@diego>
References: <2594568.q0ZmV6gNhb@diego>
Message-ID: <CAK9=C2XRBgtb--K8o7geFxWjvza6ztNX-oMObwVnsUYz28+0+Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Heiko,

On Wed, Jun 1, 2022 at 8:00 PM Heiko St?bner <heiko@sntech.de> wrote:
>
> Hi,
>
> I just stumbled across the issue that the console_putchar and _getchar
> ecalls are only part of the v0.1 specification and the spec states that
> they "are expected to be deprecated; they have no replacement."
>
> As I was using that for their earlycon functionality for a bit and haven't
> found the reasoning behind the deprecation so far, I guess I'm curious
> why it is going away :-) .
>
> The commit adding the spec-note [0] also gives no explanation for it
> and Google also wasn't helpful.
>
> Any hints?

Almost all SBI v0.1 calls have been replaced by SBI v0.2 extensions,
except console_putchar() and _getchar() calls.

The console_putchar() was certainly quite useful for early prints but
since it is going to be deprecated, we need something equivalent or
better in the SBI spec.

I do have a draft "SBI debug console" proposal which is based on
shared memory and replaces the SBI v0.1 console_putchar(). I will
send-out this proposal soon.

Regards,
Anup

>
>
> Thanks
> Heiko
>
>
>
> [0] https://github.com/riscv-non-isa/riscv-sbi-doc/commit/705e9556d25dc070926b99f8ccbcdc5073407447
>
>

