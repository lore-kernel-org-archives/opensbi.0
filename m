From: Xiang W <wxjstz@126.com>
Date: Fri, 03 Jan 2025 11:50:17 +0800
Subject: [PATCH] lib: utils/irqchip: Optimize `fdt_parse_aplic_node`
 function
In-Reply-To: <82f2ee54-8040-40e8-8cbe-b6e9dc55f58f.huangborong@bosc.ac.cn>
References: <20241231081223.111470-1-huangborong@bosc.ac.cn>
	,<039a16dc607747517c6f1421f8320c9b6eaa886b.camel@126.com>
	 <82f2ee54-8040-40e8-8cbe-b6e9dc55f58f.huangborong@bosc.ac.cn>
Message-ID: <95e67eb744ebb4f4c0f8be175a48d261612e93c0.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-01-03?? 10:21 +0800???????
> Hi Xiang,
> 
> "Is it because the passed in apic is created using sbi_zalloc?"
> Yes, The memory for 'aplic' is allocated using 'sbi_zalloc()' by the caller function?'irqchip_aplic_cold_init()',
> which ensures that it is already initialized to 0.
> 
> In other FDT node parsing functions, such as 'fdt_parse_imsic_node()' and 'fdt_parse_uart_node()',
> ?there is no use of 'memset()' to initialize the memory in the function body before parsing.?
> Therefore, I suspect that the callers of these functions are responsible for initializing the?
> memory that will contain the information they parse.

fdt_parse_imsic_node has an else branch when property is missing.
fdt_parse_uart_node uses DEFAULT_UART_REG_XXX when property is missing.

But fdt_parse_aplic_node doesn't has an else branch when the property is missing,
because there is memset initialisation

Regards,
Xiang W
> 
> Best regards,
> Huang Borong
> 
> > ------------------------------------------------------------------
> > From:Xiang W <wxjstz@126.com>
> > Send Time:2025 Jan. 1 (Wed.) 20:23
> > To:"???"<huangborong@bosc.ac.cn>; opensbi<opensbi@lists.infradead.org>
> > Subject:Re: [PATCH] lib: utils/irqchip: Optimize `fdt_parse_aplic_node` function
> > 
> > ? 2024-12-31?? 16:12 +0800?Huang Borong???
> > > - Remove redundant memset for the "aplic" parameter
> > > - Initialize "imsic" with zero
> > > 
> > > Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
> > > ---
> > > ? lib/utils/fdt/fdt_helper.c | 3 +--
> > > ? 1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > > index cb350e5..e92484c 100644
> > > --- a/lib/utils/fdt/fdt_helper.c
> > > +++ b/lib/utils/fdt/fdt_helper.c
> > > @@ -630,14 +630,13 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
> > > ? bool child_found;
> > > ? const fdt32_t *val;
> > > ? const fdt32_t *del;
> > > - struct imsic_data imsic;
> > > + struct imsic_data imsic = { 0 };
> > > ? int i, j, d, dcnt, len, noff, rc;
> > > ? uint64_t reg_addr, reg_size;
> > > ? struct aplic_delegate_data *deleg;
> > > ? 
> > > ? if (nodeoff < 0 || !aplic || !fdt)
> > > ? ? return SBI_ENODEV;
> > > - memset(aplic, 0, sizeof(*aplic));
> > Why?
> > Is it because the passed in apic is created using sbi_zalloc?
> > I think it should be kept to ensure that there are no problems
> > when calling fdt_parse_aplic_node elsewhere.
> > 
> > Regards,
> > Xiang W
> > 
> > > ? 
> > > ? rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
> > > ? if (rc < 0 || !reg_addr || !reg_size)
> > > -- 
> > > 2.34.1
> > > 
> > > 
> 
> 


