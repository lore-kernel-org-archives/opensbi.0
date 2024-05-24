From: Conor Dooley <conor@kernel.org>
Date: Fri, 24 May 2024 13:06:49 +0100
Subject: [PATCH v2 0/5] Add Svadu extension support
In-Reply-To: <20c80bc9-e5a0-4173-9546-061eff7add43@ghiti.fr>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
 <CAAhSdy2ALrnjXMUoA0AondR1-pEPyLCafsZX=N=d2gN7WL3nGQ@mail.gmail.com>
 <20c80bc9-e5a0-4173-9546-061eff7add43@ghiti.fr>
Message-ID: <20240524-glacier-squeeze-a91550fb4c00@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 24, 2024 at 01:31:29PM +0200, Alexandre Ghiti wrote:
> Hi Anup,
> 
> On 14/11/2023 17:45, Anup Patel wrote:
> > On Tue, Oct 24, 2023 at 3:42?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> > > This series enables Svadu extension support by configuring the menvcfg
> > > CSR and, if available, displays the Svadu extension in the boot log.
> > > 
> > > Additionally, we've made some programming improvements in
> > > lib/sbi/sbi_hart.c and lib/utils/fdt/fdt_helper.c.
> > > 
> > > ---
> > > v2:
> > > - Rearrange the patches to do the code refactoring first before adding
> > >    new features
> > > - Suggested by Anup and Atish, detect extensions from DT instead of
> > >    menvcfg CSR
> > > - Enable access to some extensions through menvcfg CSR if they are
> > >    present in the device tree.
> > > 
> > > Yong-Xuan Wang (5):
> > >    lib: sbi: Improve the code of privilege mode and extensions detection
> > >    lib: sbi: Refactor the code for enable extensions in menvfg CSR
> > >    lib: sbi: Using one array to define the name of extensions
> > >    lib: sbi: Detect extensions from the ISA string in DT
> > >    lib: sbi: Add support for Svadu extension
> > For backward compatibility with existing OSes, it is better to have
> > supervisor OS explicitly enable Svadu using the upcoming SBI
> > FWFT extension instead of enabling it unconditionally whenever
> > Svadu extension is available.
> 
> 
> I find this weird because maintaining backward compatibility here means
> "continue ignoring svadu present in the device tree".
> 
> Why should we treat svadu differently than svpbmt? I understand FWFT will
> fix this, but will that be available?
> 
> To me, enabling svadu when present in the device tree is more a fix than an
> issue: if enabling it breaks something, that means svadu is broken on your
> platform so just remove that from your dt or enable the support in your
> kernel.
> 
> In a nutshell, if asked by the dt, that means the support is present in the
> kernel and then it expects it and should be enabled.

I think I agree with Anup here. OpenSBI is not aware of what is going to
come along later in the boot chain and should try not to enable extensions
that would cause an OS unaware of them to fall over. Say Linux has
support for Svadu and FreeBSD does not. Do you expect that people would
have to change the firmware on their devices because they want to run
another operating system?

Unfortunately I don't think we can apply the Zkr treatment here and skip
something like FWFT. I guess we should document in the binding that
Svadu only means that the hardware supports it and that an additional
mechanism may be required to flip it on?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20240524/04c70898/attachment.sig>
