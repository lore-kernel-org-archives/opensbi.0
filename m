From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 14 May 2024 17:59:24 +0100
Subject: [PATCH v4] firmware: remove FW_TEXT_START
In-Reply-To: <tencent_7553DC5290AF126F8FE8B3A160AB566C2309@qq.com>
References: <20240408153013.653350-1-wxjstz@126.com>
 <CAAhSdy0EYuDn_FcPnAMWX0t449iF4eazGEVm1Lhgm63137BkmQ@mail.gmail.com>
 <2d1f2b6b-0feb-4507-b432-6801d4bae490@rivosinc.com>
 <CAAhSdy2E3km1W=LeztDAk+iJe1vZtWZV0OqKB7fDP72iyf0rAA@mail.gmail.com>
 <tencent_7553DC5290AF126F8FE8B3A160AB566C2309@qq.com>
Message-ID: <F2DBBA0E-1EC8-4545-A29A-8D24CEC3E489@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14 May 2024, at 17:50, Cheng Yang <yangcheng.work@foxmail.com> wrote:
> 
> &gt;On Tue, May 14, 2024 at 9:58?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
> &gt;&gt;
> &gt;&gt;
> &gt;&gt;
> &gt;&gt; On 10/04/2024 07:18, Anup Patel wrote:
> &gt;&gt; &gt; On Mon, Apr 8, 2024 at 9:01?PM Xiang W <wxjstz@126.com> wrote:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Now opensbi can run at any address via dynamic relocation. We can
> &gt;&gt; &gt;&gt; remove FW_TEXT_START.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Signed-off-by: Xiang W <wxjstz@126.com>
> &gt;&gt; &gt;
> &gt;&gt; &gt; LGTM.
> &gt;&gt; &gt;
> &gt;&gt; &gt; Reviewed-by: Anup Patel <anup@brainfault.org>
> &gt;&gt; &gt; Tested-by: Anup Patel <anup@brainfault.org>
> &gt;&gt; &gt;
> &gt;&gt; &gt; Applied this patch to the riscv/opensbi repo.
> &gt;&gt; &gt;
> &gt;&gt; &gt; Thanks,
> &gt;&gt; &gt; Anup
> &gt;&gt;
> &gt;&gt; Hi Anup,
> &gt;&gt;
> &gt;&gt; This patch seems to break spike support. The newly created ELF is not
> &gt;&gt; marked as EXEC anymore but DYNAMIC and it fails with the following error:
> &gt;&gt;
> &gt;&gt; spike: ../fesvr/elfloader.cc:45:
> &gt;&gt; std::map<std::__cxx11::basic_string<char>, long unsigned int&gt;
> &gt;&gt; load_elf(const char*, memif_t*, reg_t*, unsigned int): Assertion
> &gt;&gt; `IS_ELF_EXEC(*eh64)' failed.
> &gt;&gt;
> &gt;&gt; Should we fixed OpenSBI or allow spike to load a DYNAMIC elf ?
> &gt;
> &gt;I think it is better to use FW_DYNAMIC in Spike because various
> &gt;other projects (such as U-Boot, QEMU, etc) use it.
> &gt;
> &gt;Also, Spike should support loading M-mode firmware in BIN
> &gt;(flat binary) format as well.
> &gt;
> &gt;Regards,
> &gt;Anup
> &gt;
> &gt;&gt;
> &gt;&gt; Thanks,
> &gt;&gt;
> &gt;&gt; Cl?ment
> &gt;&gt;
> 
> Hi Anup,
> 
> I think this patch is not that necessary, and after applying 
> this patch, we lost an elf file that can disassemble or directly 
> provide symbol addresses to gdb, which caused some difficulties 
> in debugging. In the past, I could pass it in Specify the address 
> of FW_TEXT_START during compilation to generate an ELF file containing 
> accurate symbol addresses, which is useful for debugging OpenSBI.

That?s what symbol-file /path/to/elf -o offset is for.

Jess


