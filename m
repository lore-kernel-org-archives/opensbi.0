From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 13 Aug 2020 17:36:07 +0100
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <20200813162415.124469-1-xypron.glpk@gmx.de>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
Message-ID: <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 13 Aug 2020, at 17:24, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> 
> OpenSBI hangs in wake_coldboot_harts() indefinitely on the MaixDuino board
> when trying to boot U-Boot as FW_PAYLOAD.

This smells of there being a more fundamental issue that's not being
addressed which this manages to work around, either reliably or by
chance. What is the actual deadlock condition you observe?

> Even if reading and writing coldboot_done is not atomic it is safe to check
> it without using a spinlock.

Maybe microarchitecturally on the specific hardware in question (though
I wouldn't even be so certain about that), but definitely not in C. You
now have a data race in reading coldboot_done, which isn't even
volatile^, so a sufficiently smart compiler would be completely within
its right to do whatever it wants to the code, including things like
delete the loop entirely (or, slightly less dramatic, turn it into an
if). This patch introduces undefined behaviour.

Jess

^ Please do not make it volatile as a workaround, that is not the right
  way to "fix" such issues. 

> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> lib/sbi/sbi_init.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index a7fb848..a0e4f11 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -106,14 +106,14 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
> 	sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
> 
> 	/* Wait for coldboot to finish using WFI */
> +	spin_unlock(&coldboot_lock);
> 	while (!coldboot_done) {
> -		spin_unlock(&coldboot_lock);
> 		do {
> 			wfi();
> 			cmip = csr_read(CSR_MIP);
> 		 } while (!(cmip & MIP_MSIP));
> -		spin_lock(&coldboot_lock);
> 	};
> +	spin_lock(&coldboot_lock);
> 
> 	/* Unmark current HART as waiting */
> 	sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
> --
> 2.28.0
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

