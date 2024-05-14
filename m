From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 14 May 2024 18:46:03 +0100
Subject: [PATCH v4] firmware: remove FW_TEXT_START
In-Reply-To: <tencent_7A44C723936C2C58E515EE48783730E49307@qq.com>
References: <20240408153013.653350-1-wxjstz@126.com>
 <CAAhSdy0EYuDn_FcPnAMWX0t449iF4eazGEVm1Lhgm63137BkmQ@mail.gmail.com>
 <2d1f2b6b-0feb-4507-b432-6801d4bae490@rivosinc.com>
 <CAAhSdy2E3km1W=LeztDAk+iJe1vZtWZV0OqKB7fDP72iyf0rAA@mail.gmail.com>
 <tencent_7553DC5290AF126F8FE8B3A160AB566C2309@qq.com>
 <F2DBBA0E-1EC8-4545-A29A-8D24CEC3E489@jrtc27.com>
 <tencent_7A44C723936C2C58E515EE48783730E49307@qq.com>
Message-ID: <13AA9203-5482-4731-8998-1650A167092F@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14 May 2024, at 18:25, Cheng Yang <yangcheng.work@foxmail.com> wrote:
> 
> On 14 May 2024, at 17:50, Cheng Yang <yangcheng.work at="" foxmail.com=""> wrote:
> &gt;&gt; 
> &gt;&gt; &gt;On Tue, May 14, 2024 at 9:58?PM Cl?ment L?ger <cleger at="" rivosinc.com=""> wrote:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; On 10/04/2024 07:18, Anup Patel wrote:
> &gt;&gt; &gt;&gt; &gt; On Mon, Apr 8, 2024 at 9:01?PM Xiang W <wxjstz at="" 126.com=""> wrote:
> &gt;&gt; &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; &gt;&gt; Now opensbi can run at any address via dynamic relocation. We can
> &gt;&gt; &gt;&gt; &gt;&gt; remove FW_TEXT_START.
> &gt;&gt; &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Xiang W <wxjstz at="" 126.com="">
> &gt;&gt; &gt;&gt; &gt;
> &gt;&gt; &gt;&gt; &gt; LGTM.
> &gt;&gt; &gt;&gt; &gt;
> &gt;&gt; &gt;&gt; &gt; Reviewed-by: Anup Patel <anup at="" brainfault.org="">
> &gt;&gt; &gt;&gt; &gt; Tested-by: Anup Patel <anup at="" brainfault.org="">
> &gt;&gt; &gt;&gt; &gt;
> &gt;&gt; &gt;&gt; &gt; Applied this patch to the riscv/opensbi repo.
> &gt;&gt; &gt;&gt; &gt;
> &gt;&gt; &gt;&gt; &gt; Thanks,
> &gt;&gt; &gt;&gt; &gt; Anup
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Hi Anup,
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; This patch seems to break spike support. The newly created ELF is not
> &gt;&gt; &gt;&gt; marked as EXEC anymore but DYNAMIC and it fails with the following error:
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; spike: ../fesvr/elfloader.cc:45:
> &gt;&gt; &gt;&gt; std::map<std::__cxx11::basic_string<char>, long unsigned int&gt;
> &gt;&gt; &gt;&gt; load_elf(const char*, memif_t*, reg_t*, unsigned int): Assertion
> &gt;&gt; &gt;&gt; `IS_ELF_EXEC(*eh64)' failed.
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Should we fixed OpenSBI or allow spike to load a DYNAMIC elf ?
> &gt;&gt; &gt;
> &gt;&gt; &gt;I think it is better to use FW_DYNAMIC in Spike because various
> &gt;&gt; &gt;other projects (such as U-Boot, QEMU, etc) use it.
> &gt;&gt; &gt;
> &gt;&gt; &gt;Also, Spike should support loading M-mode firmware in BIN
> &gt;&gt; &gt;(flat binary) format as well.
> &gt;&gt; &gt;
> &gt;&gt; &gt;Regards,
> &gt;&gt; &gt;Anup
> &gt;&gt; &gt;
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Thanks,
> &gt;&gt; &gt;&gt;
> &gt;&gt; &gt;&gt; Cl?ment
> &gt;&gt; &gt;&gt;
> &gt;&gt; 
> &gt;&gt; Hi Anup,
> &gt;&gt; 
> &gt;&gt; I think this patch is not that necessary, and after applying 
> &gt;&gt; this patch, we lost an elf file that can disassemble or directly 
> &gt;&gt; provide symbol addresses to gdb, which caused some difficulties 
> &gt;&gt; in debugging. In the past, I could pass it in Specify the address 
> &gt;&gt; of FW_TEXT_START during compilation to generate an ELF file containing 
> &gt;&gt; accurate symbol addresses, which is useful for debugging OpenSBI.
> &gt;
> &gt;That?s what symbol-file /path/to/elf -o offset is for.
> &gt;
> &gt;Jess
> &gt;
> 
> Hi Jess,
> 
> Thanks for your tip, it can indeed solve the problem of gdb debugging. 
> But I use vscode to start gdb for opensbi debugging. It reads symbols 
> from the elf file in the specified "program" option by default, so I 
> still need some other settings. I still recommend keeping FW_TEXT_START 
> instead of removing it.

?My editor of choice is deficient? isn?t suitable justification for
imposing complexity like this on everyone IMO. But regardless, Visual
Studio Code has the ability to run custom commands on GDB startup[1].

Jess

[1] https://code.visualstudio.com/docs/cpp/launch-json-reference#_setupcommands


