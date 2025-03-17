From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 17 Mar 2025 09:45:33 +0100
Subject: [PATCH 2/2] lib: sbi_ipi: Return error for invalid hartids
In-Reply-To: <280f0d644396086c1e70c2ca4353ade3e37e2711.camel@126.com>
References: <20250314163021.154530-4-ajones@ventanamicro.com>
 <20250314163021.154530-6-ajones@ventanamicro.com>
 <280f0d644396086c1e70c2ca4353ade3e37e2711.camel@126.com>
Message-ID: <20250317-a6c4a9822fab93ae96c9337a@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025 at 12:56:59PM +0800, Xiang W wrote:
> ? 2025-03-14?? 17:30 +0100?Andrew Jones???
> > sbi_send_ipi() should return SBI_ERR_INVALID_PARAM if even one hartid
> > constructed from hart_mask_base and hart_mask, is not valid.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> > ?lib/sbi/sbi_ipi.c | 9 +++++++++
> > ?1 file changed, 9 insertions(+)
> > 
> > diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> > index 52898d302376..2de459b089ff 100644
> > --- a/lib/sbi/sbi_ipi.c
> > +++ b/lib/sbi/sbi_ipi.c
> > @@ -116,6 +116,11 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> > ?	struct sbi_domain *dom = sbi_domain_thishart_ptr();
> > ?	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> > ?
> > +	if (hmask == 0 && hbase != -1UL) {
> > +		/* Nothing to do, but it's not an error either. */
> > +		return 0;
> > +	}
> > +
> > ?	/* Find the target harts */
> > ?	rc = sbi_hsm_hart_interruptible_mask(dom, &target_mask);
> > ?	if (rc)
> > @@ -123,6 +128,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> > ?
> > ?	if (hbase != -1UL) {
> > ?		struct sbi_hartmask tmp_mask = { 0 };
> > +		int count = sbi_popcount(hmask);
> > ?
> > ?		for (i = hbase; hmask; i++, hmask >>= 1) {
> > ?			if (hmask & 1UL)
> > @@ -130,6 +136,9 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> > ?		}
> > ?
> > ?		sbi_hartmask_and(&target_mask, &target_mask, &tmp_mask);
> > +
> > +		if (sbi_hartmask_weight(&target_mask) != count)
> > +			return SBI_EINVAL;
> If hmask is equal to 0 and hbase is equal to -1, count will be 0.
> This will always return SBI_EINVAL. Need to add some code to skip 
> this case

Wrong, again, and this time for two reasons. This code is in an
'hbase != -1' block (as can be seen a few lines above). Also, if count
were to equal 0 (which it can't, due to the early out added above), then
the weight of target_mask would also be 0, which means we would never
return SBI_EINVAL, as that would require 0 != 0 to be true.

drew

