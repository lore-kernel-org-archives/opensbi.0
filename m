From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 Dec 2024 14:25:17 -0800
Subject: [PATCH 0/3] lib: sbi: fix PMU SSE event handling
In-Reply-To: <20241206205958.1055770-1-cleger@rivosinc.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
Message-ID: <CAOnJCUJ8mJF+SYoxC4hkyRTxVJJThGm4hw4CGd5--abEMjfeRw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 6, 2024 at 1:00?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> While reworking the Linux SSE support, it appears that the PMU event
> should not be available if the SSCOFPMF extension is not available since
> there would be no IRQ. The specification isn't really clear on that point
> so this is more like a RFC to check that. Ideally, the sse register call

Can you send a patch for SBI spec ? I think we can call it a local PMU
overflow event
rather than a PMU.

We can add a note about the Sscofpmf dependency as well.

> should allow to refuse registering an event if the dependencies are not
> satisfied but does not allow this yet.
>
> Cl?ment L?ger (3):
>   lib: sbi: sse: Return a value from the register callback
>   lib: sbi: sse: Disable injection if callbacks are set
>   lib: sbi: pmu: Set a SSE register_cb() for event availability
>
>  include/sbi/sbi_sse.h |  2 +-
>  lib/sbi/sbi_pmu.c     | 11 +++++++++++
>  lib/sbi/sbi_sse.c     | 19 +++++++++++++++++--
>  3 files changed, 29 insertions(+), 3 deletions(-)
>
> --
> 2.45.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

