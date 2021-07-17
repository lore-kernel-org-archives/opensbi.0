From: Anup Patel <anup@brainfault.org>
Date: Sat, 17 Jul 2021 17:29:42 +0530
Subject: [PATCH 2/2] docs: firmware: Document parameters passed to
 firmware and alignment requirement
In-Reply-To: <20210710142821.4168-2-bmeng.cn@gmail.com>
References: <20210710142821.4168-1-bmeng.cn@gmail.com>
 <20210710142821.4168-2-bmeng.cn@gmail.com>
Message-ID: <CAAhSdy3zza8Rzrs_8fJhnLcC61yVo9a68NRO=fxwzB-0vUbBCA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 7:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This updates documentation to describe parameters passed to firmware
> from previous booting stage, and corresponding address alignment
> requirement.

Thanks for updating documentation. We totally forgot to add these
details.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

I have reduced the length of the patch subject at the time of merging
this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> This also fixes a typo in fw_dynamic.md (it's => its).
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  docs/firmware/fw.md         | 7 +++++++
>  docs/firmware/fw_dynamic.md | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
> index cc0cc9e..a3bb70c 100644
> --- a/docs/firmware/fw.md
> +++ b/docs/firmware/fw.md
> @@ -9,6 +9,13 @@ OpenSBI generic library code. The supported firmwares type will differ in how
>  the arguments passed by the platform early boot stage are handled, as well as
>  how the boot stage following the firmware will be handled and executed.
>
> +The previous booting stage will pass information via the following registers
> +of RISC-V CPU:
> +
> +* hartid via *a0* register
> +* device tree blob address in memory via *a1* register. The address must be
> +  aligned to 8 bytes.
> +
>  OpenSBI currently supports three different types of firmwares.
>
>  Firmware with Dynamic Information (*FW_DYNAMIC*)
> diff --git a/docs/firmware/fw_dynamic.md b/docs/firmware/fw_dynamic.md
> index 01f43f9..7b9b192 100644
> --- a/docs/firmware/fw_dynamic.md
> +++ b/docs/firmware/fw_dynamic.md
> @@ -6,8 +6,9 @@ information about next booting stage (e.g. a bootloader or an OS) and runtime
>  OpenSBI library options from previous booting stage.
>
>  The previous booting stage will pass information to *FW_DYNAMIC* by creating
> -*struct fw_dynamic_info* in memory and passing it's address to *FW_DYNAMIC*
> -via *a2* register of RISC-V CPU.
> +*struct fw_dynamic_info* in memory and passing its address to *FW_DYNAMIC*
> +via *a2* register of RISC-V CPU. The address must be aligned to 8 bytes on
> +RV64 and 4 bytes on RV32.
>
>  A *FW_DYNAMIC* firmware is particularly useful when the booting stage executed
>  prior to OpenSBI firmware is capable of loading both the OpenSBI firmware and
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

