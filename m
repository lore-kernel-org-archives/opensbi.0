From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Feb 2024 16:29:44 +0530
Subject: [PATCH v2 2/4] firmware: Add relocatable FW_PAYLOAD_FDT_ADDR
In-Reply-To: <IA1PR20MB4953A6803AB85AB9EF9447BEBB552@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495379ECC11096AEEBC4C691BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953A6803AB85AB9EF9447BEBB552@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2pm_NU+G_MB_0yX3DcYk_Li4jxOfMQ-HB2UNAHBBOz5w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 23, 2024 at 1:48?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> The fw_payload.bin has the same issue as described in previous patch.
> But only FW_PAYLOAD_FDT_ADDR is affected.
>
> Add FW_PAYLOAD_FDT_OFFSET to identify relocatable payload fdt address.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_payload.S | 4 ++++
>  firmware/objects.mk   | 3 +++
>  2 files changed, 7 insertions(+)
>
> diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
> index c53a3bb..3c8433e 100644
> --- a/firmware/fw_payload.S
> +++ b/firmware/fw_payload.S
> @@ -46,6 +46,10 @@ fw_save_info:
>  fw_next_arg1:
>  #ifdef FW_PAYLOAD_FDT_ADDR
>         li      a0, FW_PAYLOAD_FDT_ADDR
> +#elif defined(FW_PAYLOAD_FDT_OFFSET)
> +       lla     a0, _fw_start
> +       li      a1, FW_PAYLOAD_FDT_OFFSET
> +       add     a0, a0, a1
>  #else
>         add     a0, a1, zero
>  #endif
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index fef090a..3ae0a28 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -65,6 +65,9 @@ ifdef FW_PAYLOAD_ALIGN
>  firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_ALIGN=$(FW_PAYLOAD_ALIGN)
>  endif
>
> +ifdef FW_PAYLOAD_FDT_OFFSET
> +firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_FDT_OFFSET=$(FW_PAYLOAD_FDT_OFFSET)
> +endif
>  ifdef FW_PAYLOAD_FDT_ADDR
>  firmware-genflags-$(FW_PAYLOAD) += -DFW_PAYLOAD_FDT_ADDR=$(FW_PAYLOAD_FDT_ADDR)
>  endif
> --
> 2.43.2
>

