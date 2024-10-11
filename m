From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 11 Oct 2024 17:21:04 +0530
Subject: [PATCH 13/16] lib: sbi: Add SBI Message Proxy (MPXY) framework
In-Reply-To: <ZwkLX_zeRwFSXBNb@APC323>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
 <20240806073338.1856901-14-apatel@ventanamicro.com> <ZwkLX_zeRwFSXBNb@APC323>
Message-ID: <CA+Oz1=b2FHsSDJ6+XdQ=DxQhx1B8WZyTJqdi2_tzVu_R3i=A4w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 11, 2024 at 4:57?PM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Anup,
>
> On Tue, Aug 06, 2024 at 01:03:35PM +0530, Anup Patel wrote:
> > From: Rahul Pathak <rpathak@ventanamicro.com>
> >
> > Introduce SBI Message Proxy (MPXY) framework which allows platform specific
> > code or drivers to register message protocol specific channels.
> >
> > This framework enables the supervisor software to send messages belonging
> > to different message protocols via OpenSBI firmware.
> >
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> <...>
> > +/** Disable hart shared memory */
> > +static inline void sbi_mpxy_shmem_disable(struct mpxy_state *rs)
> > +{
> > +     rs->shmem.shmem_size = 0;
> > +     rs->shmem.shmem_addr_lo = INVALID_ADDR;
> > +     rs->shmem.shmem_addr_hi = INVALID_ADDR;
>
> nitpicking: if the abbreviation "rs" representing the RPXY state, would it be renamed as "ms"?

It's the remnant of that only. And noted. If another version of the
series happens, I will change it.

>
> Best regards,
> Peter Lin



Thanks
Rahul Pathak

