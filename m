From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Dec 2022 11:09:00 +0530
Subject: [PATCH v1] docs: pmu: update a reference to a deprecated property name
In-Reply-To: <20221222193913.223114-1-conor@kernel.org>
References: <20221222193913.223114-1-conor@kernel.org>
Message-ID: <CAAhSdy0brgKcXRnzAZom6yu_KUMmPbtF3bBhVzTH6VzTuq=nYg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 23, 2022 at 1:17 AM Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> event-to-mhpmevent was deprecated and replaced by
> riscv,event-to-mhpmevent, but a reference remains to the old name.
> Replace it with the new one.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  docs/pmu_support.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/pmu_support.md b/docs/pmu_support.md
> index 1a16bad..9c79636 100644
> --- a/docs/pmu_support.md
> +++ b/docs/pmu_support.md
> @@ -46,7 +46,7 @@ a table format where each row represents a certain range of events and
>  corresponding counters. The first column represents starting of the pmu event id
>  and 2nd column represents the end of the pmu event id. The third column
>  represent a bitmap of all the MHPMCOUNTERx. This property is mandatory if
> -event-to-mhpmevent is present. Otherwise, it can be omitted. This property
> +riscv,event-to-mhpmevent is present. Otherwise, it can be omitted. This property
>  shouldn't encode any raw event.
>
>  * **riscv,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
> --
> 2.38.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

