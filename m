From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 22 Feb 2023 08:42:48 +0000
Subject: [PATCH] lib: sbi: sbi_ecall: Improve return SBI error
In-Reply-To: <2c3c52436f6dadf09fe733a257a46943ff57728a.camel@126.com>
References: <20230221104756.28573-1-peterlin@andestech.com>
 <2c3c52436f6dadf09fe733a257a46943ff57728a.camel@126.com>
Message-ID: <Y/XViK1LimqbfwSx@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 21, 2023 at 07:34:46PM +0800, Xiang W wrote:
> ? 2023-02-21???? 18:47 +0800?Yu Chien Peter Lin???
> > We should also check if the return error code is greater than 0
> > (SBI_SUCCESS), as this is an invalid error.
> > 
> > Also rename the variable returned via a0 to 'out_err' and use
> > SBI_ERR_NOT_SUPPORTED when the extension does not have a handler
> > for consistency with the standard SBI errors defined in Table 1
> > of the SBI specification.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > ?lib/sbi/sbi_ecall.c | 18 +++++++++---------
> > ?1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> > index 27ce5d49..8accf675 100644
> > --- a/lib/sbi/sbi_ecall.c
> > +++ b/lib/sbi/sbi_ecall.c
> > @@ -97,34 +97,34 @@ void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
> > ?
> > ?int sbi_ecall_handler(struct sbi_trap_regs *regs)
> > ?{
> > -???????int ret = 0;
> > +???????int out_err = 0;
> There is no need to rename ret to out_err because a0 is not always an
> error code in legacy extensions
> Other than the above, it looks good to me.
> 
> Reviewed-by: Xiang W <wxjstz@126.com>

Hi Xiang, Andrew,

Thanks for the review,
Sure I'll use 'ret' as it is in next patch.

Best regards,
Peter Lin

