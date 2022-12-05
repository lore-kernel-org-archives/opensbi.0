From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 17:40:18 +0530
Subject: [PATCH v2 2/4] docs: platform: Update AE350 and generic platform documentation
In-Reply-To: <20221205020400.28712-3-peterlin@andestech.com>
References: <20221205020400.28712-1-peterlin@andestech.com> <20221205020400.28712-3-peterlin@andestech.com>
Message-ID: <CAAhSdy1XJik0cy_L1hjuXGNphig2vsnEJWQjOFWT4XQXS9ahVA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 5, 2022 at 7:35 AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Update compile option and platform compatible string for AE350 and
> add it to the generic platform list.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes v1 -> v2
> - Add Bin Meng's review tag
> - Insert AE350 platform in alphabetical order
> ---
>  docs/platform/andes-ae350.md | 5 +++--
>  docs/platform/generic.md     | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
> index ec241ec..4739951 100644
> --- a/docs/platform/andes-ae350.md
> +++ b/docs/platform/andes-ae350.md
> @@ -8,7 +8,7 @@ AHB/APB IPs suites a majority embedded systems, and the verified platform serves
>  as a starting point to jump start SoC designs.
>
>  To build platform specific library and firmwares, provide the
> -*PLATFORM=andes/ae350* parameter to the top level make command.
> +*PLATFORM=generic* parameter to the top level `make` command.
>
>  Platform Options
>  ----------------
> @@ -23,13 +23,14 @@ AE350's dts is included in https://github.com/andestech/linux/tree/RISCV-Linux-5
>  **Linux Kernel Payload**
>
>  ```
> -make PLATFORM=andes/ae350 FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
> +make PLATFORM=generic FW_PAYLOAD_PATH=<linux_build_directory>/arch/riscv/boot/Image FW_FDT_PATH=<ae350.dtb path>
>  ```
>
>  DTS Example: (Quad-core AX45MP)
>  -------------------------------
>
>  ```
> +       compatible = "andestech,ae350";
>         cpus {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> diff --git a/docs/platform/generic.md b/docs/platform/generic.md
> index 73a8afa..e8a3296 100644
> --- a/docs/platform/generic.md
> +++ b/docs/platform/generic.md
> @@ -45,12 +45,14 @@ The *Generic* platform does not have any platform-specific options.
>  RISC-V Platforms Using Generic Platform
>  ---------------------------------------
>
> +* **Andes AE350 Platform** (*[andes-ae350.md]*)
>  * **QEMU RISC-V Virt Machine** (*[qemu_virt.md]*)
>  * **Shakti C-class SoC Platform** (*[shakti_cclass.md]*)
>  * **SiFive HiFive Unleashed** (*[sifive_fu540.md]*)
>  * **Spike** (*[spike.md]*)
>  * **T-HEAD C9xx series Processors** (*[thead-c9xx.md]*)
>
> +[andes-ae350.md]: andse-ae350.md
>  [qemu_virt.md]: qemu_virt.md
>  [shakti_cclass.md]: shakti_cclass.md
>  [sifive_fu540.md]: sifive_fu540.md
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

