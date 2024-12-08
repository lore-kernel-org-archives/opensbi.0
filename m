From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 8 Dec 2024 20:28:02 +0000
Subject: [PATCH v2] lib: sbi_misaligned_ldst: Add handling of vector
 load/store
In-Reply-To: <CAAhSdy3uNa9JDeV6OUFSaUgFa7OMN_p6kbQtcAvjKfB1J7CWww@mail.gmail.com>
References: <20241206032149.1828583-1-nylon.chen@sifive.com>
 <CAAhSdy3uNa9JDeV6OUFSaUgFa7OMN_p6kbQtcAvjKfB1J7CWww@mail.gmail.com>
Message-ID: <6BE06954-1FDD-4D8C-ADB5-DDD7C2B9DE37@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6 Dec 2024, at 12:18, Anup Patel <anup@brainfault.org> wrote:
> 
> On Fri, Dec 6, 2024 at 8:40?AM Nylon Chen <nylon.chen@sifive.com> wrote:
>> 
>> Add exception handling vector instructions from
>> 
>> the vector extension to the sbi_misaligned_ldst library.
>> 
>> This implementation references the misaligned_vec_ldst
>> implementation in the riscv-pk project.
>> 
>> Co-developed-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
> 
> I updated the commit description and replaced spaces with tabs
> for alignment at a few places at the time of merging this patch.
> 
> Applied this patch to the riscv/opensbi repo.
> 
> Thanks,
> Anup
> 
>> ---
>> Makefile                     |  11 +-
>> include/sbi/riscv_encoding.h | 385 ++++++++++++++++++++++++++++++++++-
>> include/sbi/sbi_trap_ldst.h  |   9 +
>> lib/sbi/objects.mk           |   1 +
>> lib/sbi/sbi_trap_ldst.c      |  23 ++-
>> lib/sbi/sbi_trap_v_ldst.c    | 341 +++++++++++++++++++++++++++++++
>> 6 files changed, 758 insertions(+), 12 deletions(-)
>> create mode 100644 lib/sbi/sbi_trap_v_ldst.c
>> 
>> diff --git a/Makefile b/Makefile
>> index d9cee49..5ac95a0 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -189,6 +189,9 @@ CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
>> # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
>> CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep -e "zicsr" -e "zifencei" > /dev/null && echo n || echo y)
>> 
>> +# Check whether the assembler and the compiler support the Vector extension
>> +CC_SUPPORT_VECT := $(shell echo | $(CC) -dM -E -march=rv$(OPENSBI_CC_XLEN)gv - | grep -q riscv.*vector && echo y || echo n)

No 2>/dev/null on that CC invocation?

Jess


