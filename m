From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 May 2023 09:32:05 +0530
Subject: [PATCH v[3]] Makefile: Dereference symlinks on install
In-Reply-To: <f1f64a61af00804405177f249c8505163dfaff72.camel@126.com>
References: <d0e964ee7ecc2d3dd782f0f19b253b129419fbd2.camel@126.com>
 <20230516014203.1899731-1-fmil@google.com> <f1f64a61af00804405177f249c8505163dfaff72.camel@126.com>
Message-ID: <CAAhSdy31yz4GgB70U9qGouPOfgdrCNQ3fxqiaWsyFB=XM_fOgw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 16, 2023 at 8:04?AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2023-05-16???? 01:42 +0000?Filip Filmar???
> > Adds the `-L` flag (follow symlinks) to the `cp` commands used to
> > install `libsbi.a` and `include/sbi/*`.
> >
> > This should make no difference in regular compilation. However,
> > it does make a difference when compiling with bazel.  Namely,
> > bazel's sandboxing will turn all the source files into symlinks.
> > After installation with `cp` the destination files will be
> > symlinks pointing to the sandbox symlinks. As the sandbox files
> > are removed when compilation ends, the just-copied symlinks
> > become dangling symlinks.
> >
> > The resulting include files will be
> > unusable due to the dangling symlink issues. Adding `-L` when
> > copying ensures that the files obtained by executing the `install`
> > targets are always dereferenced to files, rather than symlinks,
> > eliminating this issue.
> >
> > Signed-off-by: Filip Filmar <fmil@google.com>
> > Reviewed-by: Xiang W <wxjstz@126.com>

Somehow, this patch did not land in my inbox.

This looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> Sorry, I probably didn't express myself clearly enough.
> What I wanted to say was:
> [PATCH] Makefile: Dereference symlinks on install
> [PATCH v2] Makefile: Dereference symlinks on install
> [PATCH v3] Makefile: Dereference symlinks on install
> ...
>
> Regards,
> Xiang W
> > ---
> >  Makefile | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index a26a39b..730dbd9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -401,10 +401,10 @@ merge_deps = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> >              cat $(2) > $(1)
> >  copy_file =  $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> >              echo " COPY      $(subst $(build_dir)/,,$(1))"; \
> > -            cp -f $(2) $(1)
> > +            cp -L -f $(2) $(1)
> >  inst_file =  $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> >              echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
> > -            cp -f $(2) $(1)
> > +            cp -L -f $(2) $(1)
> >  inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
> >              mkdir -p $(1)/$(3); \
> >              for file in $(4) ; do \
> > @@ -413,12 +413,12 @@ inst_file_list = $(CMD_PREFIX)if [ ! -z "$(4)" ]; then \
> >              dest_dir=`dirname $$dest_file`; \
> >              echo " INSTALL   "$(3)"/"`echo $$rel_file`; \
> >              mkdir -p $$dest_dir; \
> > -            cp -f $$file $$dest_file; \
> > +            cp -L -f $$file $$dest_file; \
> >              done \
> >              fi
> >  inst_header_dir =  $(CMD_PREFIX)mkdir -p $(1); \
> >              echo " INSTALL   $(subst $(install_root_dir)/,,$(1))"; \
> > -            cp -rf $(2) $(1)
> > +            cp -L -rf $(2) $(1)
> >  compile_cpp_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
> >              echo " CPP-DEP   $(subst $(build_dir)/,,$(1))"; \
> >              printf %s `dirname $(1)`/  > $(1) && \
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

