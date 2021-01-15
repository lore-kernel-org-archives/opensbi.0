From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 15 Jan 2021 05:16:04 +0000
Subject: [PATCH 1/3] include: sbi: No need to pack struct sbi_trap_regs
In-Reply-To: <fe56588cf8741c7f72c7bca66ac249730f325c92.camel@wdc.com>
References: <20210113100657.809754-1-anup.patel@wdc.com>
 <20210113100657.809754-2-anup.patel@wdc.com>
 <fe56588cf8741c7f72c7bca66ac249730f325c92.camel@wdc.com>
Message-ID: <DM6PR04MB6201D05E0C19BB5E213F43FD8DA70@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Alistair Francis <Alistair.Francis@wdc.com>
> Sent: 14 January 2021 01:14
> To: Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> <Anup.Patel@wdc.com>
> Cc: anup at brainfault.org; opensbi at lists.infradead.org; taniwha at gmail.com
> Subject: Re: [PATCH 1/3] include: sbi: No need to pack struct sbi_trap_regs
> 
> On Wed, 2021-01-13 at 15:36 +0530, Anup Patel wrote:
> > All members in struct sbi_trap_regs are of machine word size so no
> > need to pack this structure. This also allows GCC to generate more
> > optimized instruction sequence when accessing members of struct
> > sbi_trap_regs.
> >
> > Reported-by: Paul Campbell <taniwha@gmail.com>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 
> > ---
> > ?include/sbi/sbi_trap.h | 2 +-
> > ?1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h index
> > 04001df..5fb94f9 100644
> > --- a/include/sbi/sbi_trap.h
> > +++ b/include/sbi/sbi_trap.h
> > @@ -186,7 +186,7 @@ struct sbi_trap_regs {
> > ????????unsigned long mstatus;
> > ????????/** mstatusH register state (only for 32-bit) */
> > ????????unsigned long mstatusH;
> > -} __packed;
> > +};
> >
> > ?/** Representation of trap details */
> > ?struct sbi_trap_info {

Applied this patch to the riscv/opensbi repo

Regards,
Anup

