From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 26 Aug 2024 13:00:58 +0200
Subject: [PATCH] lib: sbi: Add additional range checks for RV32
In-Reply-To: <CAAhSdy2DrwQ94GgOAtAodQ=hxGog8ovmjoR+9+RnXCMx2bmfWw@mail.gmail.com>
References: <20240814122959.49914-2-ajones@ventanamicro.com>
 <CAAhSdy2DrwQ94GgOAtAodQ=hxGog8ovmjoR+9+RnXCMx2bmfWw@mail.gmail.com>
Message-ID: <20240826-e18e6c0b91536fe454490d16@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 24, 2024 at 02:38:31PM GMT, Anup Patel wrote:
> On Wed, Aug 14, 2024 at 6:02?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On RV32, M-mode can only access the first 4G of the physical
> > address space because M-mode does not have an MMU to access the
> > full 34-bit physical address space. While we already ensure
> > the "hi" registers of RV32 physical address inputs are zero we
> > need to also ensure that the low register plus the size does
> > not cross into 4G address space. The check added to
> > sbi_domain_check_addr_range() should be enough for both DBCN
> > and SSE, but DBCN returns a different error code for high
> > addresses, so we patch that check too.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > ---
> >
> > Should the SSE functions return SBI_ERR_FAILED in this case like DBCN
> > does? We'd need to patch the SSE spec to call out SBI_ERR_FAILED as
> > "Failed to write due to I/O errors." like DBCN does too.
> 
> Instead of special-casing wrap-around check separately for each SBI
> extension, I suggest:
> 1) Add one more requirement in section 3.2 of the SBI spec to prevent
> wrap-around
> 2) Update sbi_domain_check_addr_range() like this patch does.

Sounds good to me.

Thanks,
drew

