From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 9 Sep 2024 15:21:34 +0200
Subject: [PATCH] lib: sbi: Add additional range checks for RV32
In-Reply-To: <20240826-e18e6c0b91536fe454490d16@orel>
References: <20240814122959.49914-2-ajones@ventanamicro.com>
 <CAAhSdy2DrwQ94GgOAtAodQ=hxGog8ovmjoR+9+RnXCMx2bmfWw@mail.gmail.com>
 <20240826-e18e6c0b91536fe454490d16@orel>
Message-ID: <20240909-efe23e5cd68ff494369d5f91@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 26, 2024 at 01:00:58PM GMT, Andrew Jones wrote:
> On Sat, Aug 24, 2024 at 02:38:31PM GMT, Anup Patel wrote:
> > On Wed, Aug 14, 2024 at 6:02?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On RV32, M-mode can only access the first 4G of the physical
> > > address space because M-mode does not have an MMU to access the
> > > full 34-bit physical address space. While we already ensure
> > > the "hi" registers of RV32 physical address inputs are zero we
> > > need to also ensure that the low register plus the size does
> > > not cross into 4G address space. The check added to
> > > sbi_domain_check_addr_range() should be enough for both DBCN
> > > and SSE, but DBCN returns a different error code for high
> > > addresses, so we patch that check too.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > >
> > > ---
> > >
> > > Should the SSE functions return SBI_ERR_FAILED in this case like DBCN
> > > does? We'd need to patch the SSE spec to call out SBI_ERR_FAILED as
> > > "Failed to write due to I/O errors." like DBCN does too.
> > 
> > Instead of special-casing wrap-around check separately for each SBI
> > extension, I suggest:
> > 1) Add one more requirement in section 3.2 of the SBI spec to prevent
> > wrap-around
> > 2) Update sbi_domain_check_addr_range() like this patch does.
> 
> Sounds good to me.
>

I've created https://github.com/riscv-non-isa/riscv-sbi-doc/pull/164 for
the spec side of things. For v2 of this patch I think it's best to
change sbi_domain_check_addr_range() to return an error rather than a
boolean and then for cases like hi != 0 and lo + size > max-lo we can
return errors other than SBI_ERR_INVALID_ADDR without having to duplicate
checks which are currently outside the function.

Thanks,
drew

