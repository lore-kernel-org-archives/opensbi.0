From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 24 Jun 2022 10:03:03 +0300
Subject: [PATCH] lib: pmu: allow to use the highest available counter
In-Reply-To: <20220624065028.2895176-1-atishp@rivosinc.com>
References: <20220624065028.2895176-1-atishp@rivosinc.com>
Message-ID: <YrVhp3jFrUTR/yhF@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

> Both OpenSBI and OS explicitly assume that there is no hardware counter
> with index 1: hardware uses that bit for TM control. So OpenSBI filters
> out that index in sanity checks.
> However, OpenSBI doesn't consider TM bit while returning the number of
> counters. As a result, the supervisor software is aware of less number
> of firmware counter.
> 
> The simple test is to make sure that there is no counter multiplexing
> in the following command:
> 
> $ perf stat -e \
>         r8000000000000000,r8000000000000001,r8000000000000002,r8000000000000003, \
>         r8000000000000004,r8000000000000005,r8000000000000006,r8000000000000007, \
>         r8000000000000008,r8000000000000009,r800000000000000a,r800000000000000b, \
>         r800000000000000c,r800000000000000d,r800000000000000e,r800000000000000f  \
>         ls
> (16 firmware events with 16 counters won't require multiplexing)
> 
> Return accurate number of counters and update the firmware counter

This is not correct.

> starting index.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

snip

> -		num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 2;
> +		num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;
>  		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
>  	}

I would suggest _not_ to merge this change in its current form. Current
approach reports incorrect number of hardware counters just to make
kernel driver provide accurate counter mask in all the subsequent
SBI requests. That is going to impact all the other SBI implementations
as well: all of them will have to pass incorrect hw counter number in
order to get correct counters mask from the kernel.

Regards,
Sergey

