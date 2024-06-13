From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 13 Jun 2024 19:58:29 +0200
Subject: [PATCH v1 0/5] Add SBI FWFT extension support
In-Reply-To: <CAAhSdy2tV68_Q0mkBceDzJEyNv3AGerNwuZVjfvGJhhVvoyXsQ@mail.gmail.com>
References: <20240521135835.371485-1-cleger@rivosinc.com>
 <CAAhSdy2tV68_Q0mkBceDzJEyNv3AGerNwuZVjfvGJhhVvoyXsQ@mail.gmail.com>
Message-ID: <0f28664b-63f6-429e-849d-3b331385083e@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 10/06/2024 12:33, Anup Patel wrote:
>  Hi Clement,
> 
> On Tue, May 21, 2024 at 8:31?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>
>> This series adds support for SBI FWFT extension. SVADU ISA extension is
>> added in order to add support for FWFT SBI_FWFT_PTE_AD_HW_UPDATING
>> feature.
>>
>> FWFT extension is not yet ratified but will be present in SBI V3.0 [1]
>>
>> Link: https://lists.riscv.org/g/tech-prs/message/924 [1]
>>
>> ---
>>
>> Cl?ment L?ger (5):
>>   lib: sbi: Add SVADU extension support
>>   lib: sbi: add support for firmware features extension
>>   lib: sbi: fwft: add support for SBI_FWFT_MISALIGNED_EXC_DELEG
>>   lib: sbi: fwft: add support for SBI_FWFT_PTE_AD_HW_UPDATING
>>   lib: sbi: implement SBI FWFT extension
> 
> Can you update this series based on the latest SBI FWFT extension draft ?

Yes sure.

> 
> Also, this series conflicts with Yong-Xuan Wang's series for Svadu
Acked, I'll apply it on top of Yong-Xuan Wang series then.

> 
> Regards,
> Anup
> 
>>
>>  include/sbi/riscv_encoding.h      |   1 +
>>  include/sbi/sbi_ecall_interface.h |  28 +++
>>  include/sbi/sbi_fwft.h            |  23 +++
>>  include/sbi/sbi_hart.h            |   2 +
>>  lib/sbi/Kconfig                   |   4 +
>>  lib/sbi/objects.mk                |   4 +
>>  lib/sbi/sbi_ecall_fwft.c          |  49 ++++++
>>  lib/sbi/sbi_fwft.c                | 272 ++++++++++++++++++++++++++++++
>>  lib/sbi/sbi_hart.c                |   9 +
>>  lib/sbi/sbi_hsm.c                 |  15 ++
>>  lib/sbi/sbi_init.c                |  11 ++
>>  11 files changed, 418 insertions(+)
>>  create mode 100644 include/sbi/sbi_fwft.h
>>  create mode 100644 lib/sbi/sbi_ecall_fwft.c
>>  create mode 100644 lib/sbi/sbi_fwft.c
>>
>> --
>> 2.43.0
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi

