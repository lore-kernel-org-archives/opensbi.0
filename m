From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Tue, 1 Dec 2020 02:00:18 +0000
Subject: [PATCH 04/11] lib: sbi: Auto start domain only if boot HART
 within limits
In-Reply-To: <20201121094756.4154728-5-anup.patel@wdc.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-5-anup.patel@wdc.com>
Message-ID: <0c66e4221b49dca216f4298f4c7f5329560dc837.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-11-21 at 15:17 +0530, Anup Patel wrote:
> The sbi_domain_finalize() should auto start a domain only if the
> boot HART is withing limits (i.e. less than SBI_HARTMASK_MAX_BITS).
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> ?lib/sbi/sbi_domain.c | 4 ++++
> ?1 file changed, 4 insertions(+)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index ac920b8..ecb098c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -403,6 +403,10 @@ int sbi_domain_finalize(struct sbi_scratch
> *scratch, u32 cold_hartid)
> ????????????????/* Domain boot HART */
> ????????????????dhart = dom->boot_hartid;
> ?
> +???????????????/* Ignore of boot HART is off limits */
> +???????????????if (SBI_HARTMASK_MAX_BITS <= dhart)
> +???????????????????????continue;
> +
> ????????????????/* Ignore if boot HART not possible for this domain
> */
> ????????????????if (!sbi_hartmask_test_hart(dhart, dom-
> >possible_harts))
> ????????????????????????continue;

