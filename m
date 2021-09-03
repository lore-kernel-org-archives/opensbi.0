From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 3 Sep 2021 09:32:22 +0200
Subject: [RISC-V] [tech-unixplatformspec] [RFC 1/1] fw_base: header for
 vendor information
In-Reply-To: <CAAhSdy3OFVoH6Qpuq5btrwWpkTUScts0ZzaO=LkJVYGodJp38w@mail.gmail.com>
References: <20210831170927.93019-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy3OFVoH6Qpuq5btrwWpkTUScts0ZzaO=LkJVYGodJp38w@mail.gmail.com>
Message-ID: <e36670d5-ac4a-bb99-e69f-96caab7c47d5@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 9/3/21 9:09 AM, Anup Patel wrote:
> On Tue, Aug 31, 2021 at 10:39 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> To implement secure boot OpenSBI should provide a well defined header
>> structure with reserved space in which a vendor can place information
>> related to a signature that the boot ROM code can check.
> 
> I totally agree.
> 
>>
>> Typically this space will be used to add
>>
>> * vendor magic
>> * type of signature
>> * offset to signature
> 
> Better to include few other stuff like size of image including the header.
> 
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>> Ideally such a header would be standardized. This would allow alternative
>> firmware to be validated by the same boot ROM.
>>
>> Could this be a topic for the platform specification?
> 
> The platform specification only points to SBI specification and sets
> expectations around SBI extensions available to the S-mode software.
> 
> A standard OpenSBI image header format is more of an OpenSBI
> specific topic.
> 
> I suggest the following:
> 1) We define the OpenSBI image header format in docs/firmware/fw.md
> 2) Update fw_base.S (like this patch) to use the OpenSBI image header
> 3) Provide a reference C header (i.e. include/sbi/fw_image.h)  for the
>      OpenSBI image format.
> 4) Provide scripts/tools for vendors to embed vendor specific data in
>      the OpenSBI image header
> 
> Vendors can certainly re-use OpenSBI image header format (and tools)
> for their vendor-specific early booting stages as well.
> 
> If OpenSBI image header format becomes widely used then we can
> even create a dedicated RISC-V project to host this as well.

The question of file headers goes beyond SBI.

Kumar Sankara suggested that the topic of file headers for secure boot 
should be taken to the TEE TG.

> 
>>
>> Best regards
>>
>> Heinrich
>> ---
>>   firmware/fw_base.S | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
>> index 1569e60..e2cc5cb 100644
>> --- a/firmware/fw_base.S
>> +++ b/firmware/fw_base.S
>> @@ -13,6 +13,7 @@
>>   #include <sbi/sbi_platform.h>
>>   #include <sbi/sbi_scratch.h>
>>   #include <sbi/sbi_trap.h>
>> +#include <sbi/sbi_version.h>
>>
>>   #define BOOT_STATUS_RELOCATE_DONE      1
>>   #define BOOT_STATUS_BOOT_HART_DONE     2
>> @@ -47,6 +48,15 @@
>>          .globl _start
>>          .globl _start_warm
>>   _start:
>> +       j       _real_start
>> +       .align  2
>> +       .ascii  "OpenSBI\0"
>> +       .short  OPENSBI_VERSION_MAJOR
>> +       .short  OPENSBI_VERSION_MINOR
> 
> I think we should also have:
> 1) Firmware size in bytes
> 2) 32bit type field (where type == 0 means no vendor data)
> 
>> +       /* Space reserved for vendor information, e.g. offset to a signature */
>> +       .long   0
>> +       .skip   12
> 
> Is 12 longs sufficient ??

For adding a pointer to a table placed behind the binary it would be 
enough. But we should first define requirements in the TEE TG.

Best regards

Heinrich

> 
>> +_real_start:
>>          /* Find preferred boot HART id */
>>          MOV_3R  s0, a0, s1, a1, s2, a2
>>          call    fw_boot_hart
>> --
>> 2.30.2
>>
>>
>>
>> ------------
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#1291): https://lists.riscv.org/g/tech-unixplatformspec/message/1291
>> Mute This Topic: https://lists.riscv.org/mt/85281393/6366717
>> Group Owner: tech-unixplatformspec+owner at lists.riscv.org
>> Unsubscribe: https://lists.riscv.org/g/tech-unixplatformspec/unsub [anup at brainfault.org]
>> ------------
>>
>>
> 
> Regards,
> Anup
> 

