From: dramforever <dramforever@live.com>
Date: Wed, 3 Aug 2022 15:03:07 +0800
Subject: [RFC PATCH 1/3] include: Add mstatus[h].GVA encodings
In-Reply-To: <CAEUhbmUVbs6Z7Z41PKdoQQ+jC4KwOKLCumNZb4Z0bXmXP29YGQ@mail.gmail.com>
References: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14397B18A8B3A9D04105F211C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <CAEUhbmUVbs6Z7Z41PKdoQQ+jC4KwOKLCumNZb4Z0bXmXP29YGQ@mail.gmail.com>
Message-ID: <TYYP286MB1439E18C6D2F9CEF5ED36E64C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/3/22 14:40, Bin Meng wrote:
> On Wed, Aug 3, 2022 at 1:18 PM dramforever <dramforever@live.com> wrote:
>> Signed-off-by: dramforever <dramforever@live.com>
> Is this "dramforever" the real name?

Is 'real name' a requirement? It is not listed in the contributor
guidelines[1] and my several previous patches have been accepted under
this name without issue.

This is the name I use for basically all my open source contributions,
so I had kept using it for convenience. I can change the name in v1 or
next RFC, but I think there should at least some agreement among OpenSBI
maintainers that a real name is required.

Regards,
dram

[1]:
https://github.com/riscv-software-src/opensbi/blob/master/docs/contributing.md

>> ---
>>  include/sbi/riscv_encoding.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
>> index 798afb7..8884301 100644
>> --- a/include/sbi/riscv_encoding.h
>> +++ b/include/sbi/riscv_encoding.h
>> @@ -38,10 +38,14 @@
>>  #define MSTATUS_SXL                    _ULL(0x0000000C00000000)
>>  #define MSTATUS_SBE                    _ULL(0x0000001000000000)
>>  #define MSTATUS_MBE                    _ULL(0x0000002000000000)
>> +#define MSTATUS_GVA                    _ULL(0x0000004000000000)
>> +#define MSTATUS_GVA_SHIFT              38
>>  #define MSTATUS_MPV                    _ULL(0x0000008000000000)
>>  #else
>>  #define MSTATUSH_SBE                   _UL(0x00000010)
>>  #define MSTATUSH_MBE                   _UL(0x00000020)
>> +#define MSTATUSH_GVA                   _UL(0x00000040)
>> +#define MSTATUSH_GVA_SHIFT             6
>>  #define MSTATUSH_MPV                   _UL(0x00000080)
>>  #endif
>>  #define MSTATUS32_SD                   _UL(0x80000000)
>> --
>>
> Regards,
> Bin

