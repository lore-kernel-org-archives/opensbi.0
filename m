From: Conor Dooley <conor@kernel.org>
Date: Fri, 24 May 2024 14:17:35 +0100
Subject: [PATCH v2 0/5] Add Svadu extension support
In-Reply-To: <20240524-confident-preset-450b414aad35@spud>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
 <CAAhSdy2ALrnjXMUoA0AondR1-pEPyLCafsZX=N=d2gN7WL3nGQ@mail.gmail.com>
 <20c80bc9-e5a0-4173-9546-061eff7add43@ghiti.fr>
 <20240524-glacier-squeeze-a91550fb4c00@spud>
 <944df96d-b9b0-4e90-b194-8cb7b6ba8d8d@ghiti.fr>
 <20240524-confident-preset-450b414aad35@spud>
Message-ID: <20240524-narrow-deferral-6ed9217aa6aa@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 24, 2024 at 02:11:57PM +0100, Conor Dooley wrote:
> On Fri, May 24, 2024 at 02:47:05PM +0200, Alexandre Ghiti wrote:
> > Hi Conor,
> > 
> > On 24/05/2024 14:06, Conor Dooley wrote:
> > > On Fri, May 24, 2024 at 01:31:29PM +0200, Alexandre Ghiti wrote:
> > > > Hi Anup,
> > > > 
> > > > On 14/11/2023 17:45, Anup Patel wrote:
> > > > > On Tue, Oct 24, 2023 at 3:42?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> > > > > > This series enables Svadu extension support by configuring the menvcfg
> > > > > > CSR and, if available, displays the Svadu extension in the boot log.
> > > > > > 
> > > > > > Additionally, we've made some programming improvements in
> > > > > > lib/sbi/sbi_hart.c and lib/utils/fdt/fdt_helper.c.
> > > > > > 
> > > > > > ---
> > > > > > v2:
> > > > > > - Rearrange the patches to do the code refactoring first before adding
> > > > > >     new features
> > > > > > - Suggested by Anup and Atish, detect extensions from DT instead of
> > > > > >     menvcfg CSR
> > > > > > - Enable access to some extensions through menvcfg CSR if they are
> > > > > >     present in the device tree.
> > > > > > 
> > > > > > Yong-Xuan Wang (5):
> > > > > >     lib: sbi: Improve the code of privilege mode and extensions detection
> > > > > >     lib: sbi: Refactor the code for enable extensions in menvfg CSR
> > > > > >     lib: sbi: Using one array to define the name of extensions
> > > > > >     lib: sbi: Detect extensions from the ISA string in DT
> > > > > >     lib: sbi: Add support for Svadu extension
> > > > > For backward compatibility with existing OSes, it is better to have
> > > > > supervisor OS explicitly enable Svadu using the upcoming SBI
> > > > > FWFT extension instead of enabling it unconditionally whenever
> > > > > Svadu extension is available.
> > > > 
> > > > I find this weird because maintaining backward compatibility here means
> > > > "continue ignoring svadu present in the device tree".
> > > > 
> > > > Why should we treat svadu differently than svpbmt? I understand FWFT will
> > > > fix this, but will that be available?
> > > > 
> > > > To me, enabling svadu when present in the device tree is more a fix than an
> > > > issue: if enabling it breaks something, that means svadu is broken on your
> > > > platform so just remove that from your dt or enable the support in your
> > > > kernel.
> > > > 
> > > > In a nutshell, if asked by the dt, that means the support is present in the
> > > > kernel and then it expects it and should be enabled.
> > > I think I agree with Anup here. OpenSBI is not aware of what is going to
> > > come along later in the boot chain and should try not to enable extensions
> > > that would cause an OS unaware of them to fall over. Say Linux has
> > > support for Svadu and FreeBSD does not. Do you expect that people would
> > > have to change the firmware on their devices because they want to run
> > > another operating system?
> > 
> > 
> > On the other hand, an operating system can think the extension is enabled
> > and rely on it: so should we favour the OS that does not implement the
> > feature over the one that does?
> 
> I think you've missed my point. I was saying that if there are
> extensions that the SBI firmware can optionally enable that would cause
> an OS without support for them to fall over, then we should document
> that the property for the extension means they're present in the
> hardware and must be enabled before use.
> 
> In fact the binding says nothing about whether or not the extension is
> enabled, just that the extension is supported by the hart. I'd argue
> that passing a dtb containing an extension to a privilege level means
> that an extension should available at that level - but compatibility is
> a more important factor and we shouldn't define any properties that mean
> non-implementers fall over.
> 
> Given there'd be a FWFT mechanism for enabling the extension, I don't
> think either implementers or non-implementers are being favoured here.
> The latter carries on like nothing has changed and the former does an
> ecall during boot and gets the fancy new toy.
> 
> > > Unfortunately I don't think we can apply the Zkr treatment here and skip
> > > something like FWFT. I guess we should document in the binding that
> > > Svadu only means that the hardware supports it and that an additional
> > > mechanism may be required to flip it on?
> > 
> > 
> > In this case, Svadu can not break anything, so if we do this case by case
> > without general rules, I'd be in favor of enabling it (like Zicbom, Zicboz,
> > Svpbmt...).
> 
> I must have misunderstood then based Anup's original objection. If an OS
> that's unaware of what Svadu is will run just fine with it enabled by
> m-mode then sure.

I think this might have been the compatibility in question?
https://lore.kernel.org/lkml/d141062b-e3e0-45ce-bc61-3404417c7d7c at app.fastmail.com/T/#m5c8417be951447568b119bec3c148a5f0a49c5ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20240524/8f69135c/attachment-0001.sig>
