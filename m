From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:31:06 +0530
Subject: [PATCH] doc:fix some typos
In-Reply-To: <tencent_469245A41A1D5C9102CBCF0B6B6142196607@qq.com>
References: <tencent_469245A41A1D5C9102CBCF0B6B6142196607@qq.com>
Message-ID: <CAAhSdy11ySZFJfKyzeQMfs-5ka_OYwq2A6ixe2R8JrqkG_GXYA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 28, 2022 at 8:06 AM <dominic_riscx@qq.com> wrote:
>
> From: Dunky-Z <254758318@qq.com>

Please don't leave the commit description empty.

>
> Signed-off-by: zhangdongdong <zhangdongdong@eswincomputing.com>

The From: and Signed-off-by don't match.

> ---
>  docs/domain_support.md        |  6 +++---
>  docs/library_usage.md         |  2 +-
>  docs/platform_requirements.md |  2 +-
>  docs/pmu_support.md           | 10 +++++-----
>  4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index 73931f1..8963b57 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -2,7 +2,7 @@ OpenSBI Domain Support
>  ======================
>
>  An OpenSBI domain is a system-level partition (subset) of underlying hardware
> -having it's own memory regions (RAM and MMIO devices) and HARTs. The OpenSBI
> +having its own memory regions (RAM and MMIO devices) and HARTs. The OpenSBI
>  will try to achieve secure isolation between domains using RISC-V platform
>  features such as PMP, ePMP, IOPMP, SiFive Shield, etc.
>
> @@ -15,7 +15,7 @@ Important entities which help implement OpenSBI domain support are:
>  Each HART of a RISC-V platform must have an OpenSBI domain assigned to it.
>  The OpenSBI platform support is responsible for populating domains and
>  providing HART id to domain mapping. The OpenSBI domain support will by
> -default assign **the ROOT domain** to all HARTs of a RISC-V platform so
> +default assign **the ROOT domain** to all HARTs of a RISC-V platform, so
>  it is not mandatory for the OpenSBI platform support to populate domains.
>
>  Domain Memory Region
> @@ -29,7 +29,7 @@ OpenSBI and has following details:
>  * **base** - The base address of a memory region is **2 ^ order**
>    aligned start address
>  * **flags** - The flags of a memory region represent memory type (i.e.
> -  RAM or MMIO) and allowed accesses (i.e. READ, WRITE, EXECUTE, etc)
> +  RAM or MMIO) and allowed accesses (i.e. READ, WRITE, EXECUTE, etc.)
>
>  Domain Instance
>  ---------------
> diff --git a/docs/library_usage.md b/docs/library_usage.md
> index d5d2ba9..bb64bc4 100644
> --- a/docs/library_usage.md
> +++ b/docs/library_usage.md
> @@ -73,7 +73,7 @@ firmware drivers based on the external firmware architecture.
>  **OPENSBI_EXTERNAL_SBI_TYPES** identifier is introduced to *sbi_types.h* for selecting
>  external header file during the build preprocess in order to define OpensSBI data types
>  based on external firmware data type binding.
> -For example, *bool* is declared as *int* in sbi_types.h. However in EDK2 build system,
> +For example, *bool* is declared as *int* in sbi_types.h. However, in EDK2 build system,
>  *bool* is declared as *BOOLEAN* which is defined as *unsigned char* data type.
>
>  External firmware can define **OPENSBI_EXTERNAL_SBI_TYPES** in CFLAGS and specify it to the
> diff --git a/docs/platform_requirements.md b/docs/platform_requirements.md
> index 68dc393..8735adb 100644
> --- a/docs/platform_requirements.md
> +++ b/docs/platform_requirements.md
> @@ -10,7 +10,7 @@ To handle this, we have two types of RISC-V platform requirements:
>  2. **Release specific platform requirements** which apply to a OpenSBI
>     release and later releases
>
> -Currently, we don't have any **Release specific platform requirements**
> +Currently, we don't have any **Release specific platform requirements**,
>  but such platform requirements will be added in future.
>
>  Base Platform Requirements
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index d79b515..1db36fc 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -1,7 +1,7 @@
>  OpenSBI SBI PMU extension support
>  ==================================
>  SBI PMU extension supports allow supervisor software to configure/start/stop
> -any performance counter at anytime. Thus, an user can leverage full
> +any performance counter at anytime. Thus, a user can leverage full
>  capability of performance analysis tools such as perf if SBI PMU extension is
>  enabled. The OpenSBI implementation makes the following assumptions about the
>  hardware platform.
> @@ -25,7 +25,7 @@ SBI PMU Device Tree Bindings
>  ----------------------------
>
>  Platforms may choose to describe PMU event selector and event to counter mapping
> -values via device tree. The following sections describes the PMU DT node
> +values via device tree. The following sections describe the PMU DT node
>  bindings in details.
>
>  * **compatible** (Mandatory) - The compatible string of SBI PMU device tree node.
> @@ -42,7 +42,7 @@ This property shouldn't encode any raw hardware event.
>  * **riscv,event-to-mhpmcounters**(Optional) - It represents a MANY-to-MANY
>  mapping between a range of events and all the MHPMCOUNTERx in a bitmap format
>  that can be used to monitor these range of events. The information is encoded in
> -a table format where each row represent a certain range of events and
> +a table format where each row represents a certain range of events and
>  corresponding counters. The first column represents starting of the pmu event id
>  and 2nd column represents the end of the pmu event id. The third column
>  represent a bitmap of all the MHPMCOUNTERx. This property is mandatory if
> @@ -53,10 +53,10 @@ shouldn't encode any raw event.
>  or MANY-to-MANY mapping between the raw event(s) and all the MHPMCOUNTERx in
>  a bitmap format that can be used to monitor that raw event. The encoding of the
>  raw events are platform specific. The information is encoded in a table format
> -where each row represent the specific raw event(s). The first column is a 64bit
> +where each row represents the specific raw event(s). The first column is a 64bit
>  match value where the invariant bits of range of events are set. The second
>  column is a 64 bit mask that will have all the variant bits of the range of
> -events cleared. Every other bits should be set in the mask.
> +events cleared. All other bits should be set in the mask.
>  The third column is a 32bit value to represent bitmap of all MHPMCOUNTERx that
>  can monitor these set of event(s).
>  If a platform directly encodes each raw PMU event as a unique ID, the value of
> --
> 2.34.1.windows.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

I have addressed the above comments at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

