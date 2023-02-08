From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Feb 2023 10:57:02 +0530
Subject: [PATCH 1/2] firmware: Not to clear all the MIP
In-Reply-To: <20230117081428.15042-2-nick.hu@sifive.com>
References: <20230117081428.15042-1-nick.hu@sifive.com> <20230117081428.15042-2-nick.hu@sifive.com>
Message-ID: <CAAhSdy061xtCx7zgVYAdj9nVjpoRBoyQ5dj-pPmN43nOfSMkTA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 17, 2023 at 1:44 PM Nick Hu <nick.hu@sifive.com> wrote:
>
> In generic behavior of QEMU, if the pending bits of PLIC are still set and
> we clear the SEIP, the QEMU may not set the SEIP back immediately and the
> interrupt may not be handled anymore until the new interrupts arrived and
> QEMU set the SEIP back which is a generic behavior in QEMU.
>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  firmware/fw_base.S | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 3f622b3..50f284e 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -422,9 +422,15 @@ _start_warm:
>         li      ra, 0
>         call    _reset_regs
>
> -       /* Disable and clear all interrupts */
> +       /* Disable all interrupts */
>         csrw    CSR_MIE, zero
> -       csrw    CSR_MIP, zero
> +       /*
> +        * Only clear the MIP_SSIP and MIP_STIP. For the platform like QEMU,
> +        * If we clear other interrupts like MIP_SEIP and the pendings of
> +        * PLIC still exist, the QEMU may not set it back immediately.
> +        */
> +       li      t0, (MIP_SSIP | MIP_STIP)
> +       csrc    CSR_MIP, t0
>
>         /* Find HART count and HART stack size */
>         lla     a4, platform
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

