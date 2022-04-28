From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Apr 2022 11:44:14 +0530
Subject: [v2 PATCH] docs: pmu: Improve the PMU DT bindings
In-Reply-To: <20220421024856.3677261-1-atishp@rivosinc.com>
References: <20220421024856.3677261-1-atishp@rivosinc.com>
Message-ID: <CAAhSdy2xTRJDtcXi=ejX82_fs91upRFUF44E3TySNjtiJ11f-Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 21, 2022 at 8:19 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The current DT binding description is misleading and confusing. Clarify
> the text and provide more examples.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

There were some trailing spaces which I have taken care of while merging
this patch. Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/pmu_support.md | 46 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 17 deletions(-)
>
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index 7e3367cffe71..79246c1b7b27 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -51,19 +51,16 @@ shouldn't encode any raw event.
>
>  * **riscv,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
>  or MANY-to-MANY mapping between the raw event(s) and all the MHPMCOUNTERx in
> -a bitmap format that can be used to monitor that raw event, which depends on
> -how the platform encodes the monitor events. Currently, only the following three
> -encoding methods are supported, encoding each event as a number, using a bitmap
> -to encode monitor events, and mixing the previous two methods. The information
> -is encoded in a table format where each row represent the specific raw event(s).
> -The first column represents a 64-bit selector value which can indicate an
> -monitor event ID (encoded by a number) or an event set (encoded by a bitmap).
> -In case of the latter, the lower bits used to encode a set of events should be
> -set to zero. The second column is a 64-bit selector mask where any bits used
> -for event encoding will be cleared. If a platform directly encodes each raw PMU
> -event as a unique ID, the value of select_mask will be 0xffffffff_ffffffff.
> -The third column represent a bitmap of all the MHPMCOUNTERx that can be used for
> -monitoring the specified event(s).
> +a bitmap format that can be used to monitor that raw event. The encoding of the
> +raw events are platform specific. The information is encoded in a table format
> +where each row represent the specific raw event(s). The first column is a 64bit
> +match value where the invariant bits of range of events are set. The second
> +column is a 64 bit mask that will have all the variant bits of the range of
> +events cleared. Every other bits should be set in the mask.
> +The third column is a 32bit value to represent bitmap of all MHPMCOUNTERx that
> +can monitor these set of event(s).
> +If a platform directly encodes each raw PMU event as a unique ID, the value of
> +select_mask must be 0xffffffff_ffffffff.
>
>  *Note:* A platform may choose to provide the mapping between event & counters
>  via platform hooks rather than the device tree.
> @@ -73,15 +70,30 @@ via platform hooks rather than the device tree.
>  ```
>  pmu {
>         compatible                      = "riscv,pmu";
> -       interrupts                      = <0x100>;
> -       interrupt-parent                        = <&plic>
>         riscv,event-to-mhpmevent                = <0x0000B  0x0000 0x0001>,
>         riscv,event-to-mhpmcounters     = <0x00001 0x00001 0x00000001>,
>                                                   <0x00002 0x00002 0x00000004>,
>                                                   <0x00003 0x0000A 0x00000ff8>,
>                                                   <0x10000 0x10033 0x000ff000>,
> -       riscv,raw-event-to-mhpmcounters = <0x0000     0x0002 0xffffffff 0xffffffff 0x00000f8>,
> -                                         <0xffffffff 0xfffffff0 0xffffffff 0xfffffff0 0x00000ff0>,
> +                                       /* For event ID 0x0002 */
> +       riscv,raw-event-to-mhpmcounters = <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
> +                                       /* For event ID 0-4 */
> +                                       <0x0 0x0 0xffffffff 0xfffffff0 0x00000ff0>,
> +                                       /* For event ID 0xffffffff0000000f - 0xffffffff000000ff */
> +                                       <0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>,
> +
>  };
>
> +/* For HiFive Unmatched board. The encodings can be found here
> + * https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf
> + */
> +
> +pmu {
> +       compatible                      = "riscv,pmu";
> +       riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0xc>,
> +                             <0x0 0x1 0xffffffff 0xfff800ff 0xc>,
> +                             <0x0 0x2 0xffffffff 0xffffe0ff 0xc>,
> +};
> +
> +
>  ```
> --
> 2.25.1
>

