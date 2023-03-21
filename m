From: Cheehong Ang <cheehong.ang@starfivetech.com>
Date: Tue, 21 Mar 2023 02:58:10 +0000
Subject: [PATCH] Makefile: Generate Map file for each firmware
In-Reply-To: <ADA54967-387A-4A40-A444-E767D4A9915A@jrtc27.com>
References: <20230319182252.5862-1-junliang.tan@starfivetech.com>
 <ADA54967-387A-4A40-A444-E767D4A9915A@jrtc27.com>
Message-ID: <26b6331f1ca04c228db1050ca4fe873f@EXMBX168.cuchost.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Jessica Clarke <jrtc27@jrtc27.com>
> Sent: Tuesday, March 21, 2023 12:33 AM
> To: JunLiang Tan <junliang.tan@starfivetech.com>
> Cc: opensbi at lists.infradead.org; Cheehong Ang
> <cheehong.ang@starfivetech.com>
> Subject: Re: [PATCH] Makefile: Generate Map file for each firmware
> 
> On 19 Mar 2023, at 18:22, Jun Liang Tan <junliang.tan@starfivetech.com>
> wrote:
> >
> > Currently, OpenSBI does not generate Map file.
> > This patch allows OpenSBI generates Map file for each firmware. This
> > comes in handy in debugging process as Map file gives detailed
> > information about the symbols in our program.
> 
> How and why? Isn?t this just a bunch of tracing for how the linker laid the binary
> out? I really don?t see how this is particularly useful, it definitely shouldn?t be on
> by default and the file format varies wildly between GNU ld and LLVM LLD
> anyway.
> 
> What are you trying to do that you can?t do with an unstripped ELF?
Yes. We knew there are other ways to trace the binary layout.
We find it handy to generate .map file (just like U-Boot did) for quick reference in editor.
Just pass this one if it's not relevant.
> 
> > Signed-off-by: Jun Liang Tan <junliang.tan@starfivetech.com>
> > Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
> > ---
> > Makefile | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index a26a39b..e46b67a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -445,7 +445,7 @@ compile_as = $(CMD_PREFIX)mkdir -p `dirname $(1)`;
> \
> > 	     $(AS) $(ASFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
> > compile_elf = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> > 	     echo " ELF       $(subst $(build_dir)/,,$(1))"; \
> > -	     $(CC) $(CFLAGS) $(3) $(ELFFLAGS) -Wl,-T$(2) -o $(1)
> > +	     $(CC) $(CFLAGS) -Wl,-Map=$(basename $(1)).map $(3) $(ELFFLAGS)
> > +-Wl,-T$(2) -o $(1)
> 
> This is clearly not the right path to use.
> 
> Jess
> 
> > compile_ar = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> > 	     echo " AR        $(subst $(build_dir)/,,$(1))"; \
> > 	     $(AR) $(ARFLAGS) $(1) $(2)
> > @@ -669,6 +669,8 @@ clean:
> > 	$(CMD_PREFIX)find $(build_dir) -type f -name "*.bin" -exec rm -rf {} +
> > 	$(if $(V), @echo " RM        $(build_dir)/*.dtb")
> > 	$(CMD_PREFIX)find $(build_dir) -type f -name "*.dtb" -exec rm -rf {}
> > +
> > +	$(if $(V), @echo " RM        $(build_dir)/*.map")
> > +	$(CMD_PREFIX)find $(build_dir) -type f -name "*.map" -exec rm -rf {}
> > ++
> >
> > # Rule for "make distclean"
> > .PHONY: distclean
> > --
> > 2.38.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

