From: dramforever <dramforever@live.com>
Date: Thu, 4 Aug 2022 17:27:44 +0800
Subject: [PATCH 0/5] Set hstatus.GVA for traps going to HS-mode
In-Reply-To: <20220804080932.byjewm2c6gdlfwhz@kamzik>
References: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220804080932.byjewm2c6gdlfwhz@kamzik>
Message-ID: <TYYP286MB143999B2ACEA775488307007C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/4/22 16:09, Andrew Jones wrote:
> On Thu, Aug 04, 2022 at 11:15:50AM +0800, Vivian Wang wrote:
>> The privileged spec specifies that on a trap to HS-mode, hstatus.GVA
>> should be set to 1 if stval is written with a guest virtual address, and
>> to 0 otherwise.
>>
>> Implement this by adding a field to sbi_trap_info called gva, which
>> indicates if tval is a guest virtual address, and set it appropriately.
>> When redirecting traps to HS-mode, set hstatus.GVA to trap->gva.
>>
>> Patch 4 is a bugfix. The hypervisor CSRs should be set for all traps to
>> HS-mode, not just those coming from VS/VU-mode. Since it is closely
>> related to this series and makes the structure for patch 5 clearer, I
>> have included it in this series.
>>
>> Changes since RFC:
>>
>> - Fixed names used in sign-off lines
>> - Added more detailed commit messages
>> - Separated out the hypervisor CSR bugfix into a separate patch
>>
>> Vivian Wang (5):
>>   include: Add mstatus[h].GVA encodings
>>   lib: sbi_trap: Save mstatus[h].GVA in trap->gva
>>   lib: sbi: Set gva when creating sbi_trap_info
>>   lib: sbi_trap: Set hypervisor CSRs for HS-mode
>>   lib: sbi_trap: Set hstatus.GVA when going to HS-mode
>>
>>  include/sbi/riscv_encoding.h  |  4 ++++
>>  include/sbi/sbi_trap.h        |  6 +++++-
>>  lib/sbi/sbi_expected_trap.S   | 17 +++++++++++++++--
>>  lib/sbi/sbi_illegal_insn.c    |  1 +
>>  lib/sbi/sbi_misaligned_ldst.c |  2 ++
>>  lib/sbi/sbi_trap.c            | 21 ++++++++++++++++-----
>>  6 files changed, 43 insertions(+), 8 deletions(-)
>>
> FYI,
>
> At least on my end, it looks like patches 2-5 are in-reply-to patch 1
> instead of the cover-letter, which causes the thread to be a bit odd.

Sorry for the inconvenience.

My mail provider mangles Message-ID on outbound emails, so until I
disable that or find myself a better service, I need to work around it
by sending the rest of the patches In-Reply-To the cover letter. It
seems that git-send-email defaults to sending the rest of the series
In-Reply-To patch 1 instead.

I'll fix it next time.

dram

> Thanks,
> drew

