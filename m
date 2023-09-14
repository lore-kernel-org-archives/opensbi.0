From: Icenowy Zheng <uwu@icenowy.me>
Date: Thu, 14 Sep 2023 12:12:52 +0800
Subject: [RFC PATCH v2 1/2] include: Move trap handle helper functions
 to sbi_trap.h
In-Reply-To: <IA1PR20MB4953B74F3E63333BCF7CDF93BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <5720A227-2520-4651-87B6-F7F8B61ECD45@jrtc27.com>
	 <IA1PR20MB4953B74F3E63333BCF7CDF93BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <de4121bf909c3da41cc6aecb2adc8c4097988aae.camel@icenowy.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-09-14???? 11:55 +0800?Inochi Amaoto???
> > On 14 Sep 2023, at 03:40, Inochi Amaoto <inochiama@outlook.com>
> > wrote:
> > > 
> > > The trap handle helper macros can help platform make a compatible
> > > trap
> > > handler, this is helpful if a platform need a custom trap
> > > handler. So
> > > move these helper macro into sbi_trap.h to allow platforms to use
> > > them.
> > 
> > Why? What?s wrong with:
> > 
> > _thead_trap_handler:
> > ?? sfence.vma
> > ?? j _trap_handler
> > 
> > No modification of any code outside of T-HEAD platform code
> > required.
> > 
> > Jess
> > 
> 
> The inst j only can access 1 MiB offset from the pc, I am not sure
> whether

1M OpenSBI sounds quite weird, and shouldn't happen in near future.

> this will cause some problem in the future. If this does not matter,
> I agree
> to use direct jmp to get less code.


