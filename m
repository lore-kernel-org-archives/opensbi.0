From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 18 Oct 2024 10:29:47 +0800
Subject: [PATCH 1/1] lib: sbi_misaligned_ldst: Add handling of vector load/store
In-Reply-To: <45e143e8-309c-474a-8399-054b9d2f25a1@dram.page>
References: <20241016103558.1745563-1-nylon.chen@sifive.com> <45e143e8-309c-474a-8399-054b9d2f25a1@dram.page>
Message-ID: <CAHh=Yk81p1jYt+C2C3mdzsoZhtDb-Dhy7dSBySbYJZix_szjXA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Vivian Wang <uwu@dram.page> ? 2024?10?17? ?? ??3:34???
>
> On 10/16/24 18:35, Nylon Chen wrote:
> > Add exception handling vector instructions from
> >
> > the vector extension to the sbi_misaligned_ldst library.
> >
> > This implementation references the misaligned_vec_ldst
> > implementation in the riscv-pk project.
> >
> > Co-developed-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> > Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  Makefile                     |  15 +-
> >  include/sbi/riscv_encoding.h | 385 ++++++++++++++++++++++++++++++++++-
> >  include/sbi/sbi_trap_ldst.h  |   9 +
> >  lib/sbi/Kconfig              |   4 +
> >  lib/sbi/objects.mk           |   1 +
> >  lib/sbi/sbi_trap_ldst.c      |  23 ++-
> >  lib/sbi/sbi_trap_v_ldst.c    | 341 +++++++++++++++++++++++++++++++
> >  7 files changed, 766 insertions(+), 12 deletions(-)
> >  create mode 100644 lib/sbi/sbi_trap_v_ldst.c
> >
> > *snip*
>
Hi Vivian, Thank you for your question regarding my patch.
> I didn't see any mention of mstatus in the patch. Maybe I missed it but
> since we eventually reload mstatus, we should explicitly set mstatus.VS
> to "Dirty" (both bits 1) in the saved registers. See [1] for handling of
> mstatus.FS.
>
> [1]: https://patchwork.ozlabs.org/project/opensbi/patch/20230906090114.24625-1-greentime.hu at sifive.com/
>
I appreciate your attention to detail, and I will take some time to
check the specifics you've mentioned. If it's right, I'll make the
corresponding modifications.

Specifically, I will update the code to set mstatus explicitly.VS to
"Dirty" to notify the system to save the vector register state,
similar to how mstatus.FS.

e.g.
int sbi_misaligned_v_ld/st_emulator() {
        SET_VS_DIRTY(regs)
        ...
}

