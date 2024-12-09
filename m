From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 9 Dec 2024 04:48:05 +0000
Subject: [PATCH v2] lib: sbi_misaligned_ldst: Add handling of vector
 load/store
In-Reply-To: <CAAhSdy27MK21MF5a4g-6PywToe82=QoTYM7b_Da0D7oVf50dVQ@mail.gmail.com>
References: <20241206032149.1828583-1-nylon.chen@sifive.com>
 <CAAhSdy3uNa9JDeV6OUFSaUgFa7OMN_p6kbQtcAvjKfB1J7CWww@mail.gmail.com>
 <810ba88d-9a67-44c7-9b13-f17f3e603c82@rivosinc.com>
 <CAK9=C2ULHsQNAiWLXO-XLUC96Q-VsaTMXFL7SYcbOLRALoSYXw@mail.gmail.com>
 <184B496F-4FF4-4F5A-9B81-14E2A3F4CADC@jrtc27.com>
 <CAAhSdy27MK21MF5a4g-6PywToe82=QoTYM7b_Da0D7oVf50dVQ@mail.gmail.com>
Message-ID: <EAF39516-599A-41D3-9039-504801477074@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Dec 2024, at 03:56, Anup Patel <anup@brainfault.org> wrote:
> 
> On Mon, Dec 9, 2024 at 1:57?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 7 Dec 2024, at 14:31, Anup Patel <apatel@ventanamicro.com> wrote:
>>> 
>>> On Sat, Dec 7, 2024 at 2:27?AM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>>>> 
>>>> Hi Anup & Nylon,
>>>> 
>>>> This commits breaks openSBI boot on my setup. A quick analysis of the
>>>> problem shows that the changes to objects.mk now allows GCC to generate
>>>> vector assembly in OpenSBI. It now crashes in bitmap_zero() really early
>>>> (Used in fw_platform_coldboot_harts_init()) due to vector instructions
>>>> being used:
>>>> 
>>>>  0x0000000080007800 <+474>:   mv      a0,s2
>>>>  0x0000000080007802 <+476>:   sw      a5,88(s4)
>>>>  0x0000000080007806 <+480>:   jal     0x8001adbe <fdt_check_imsic_mlevel>
>>>> => 0x000000008000780a <+484>:   vsetivli        zero,2,e64,m1,ta,ma
>>>>  0x000000008000780e <+488>:   vmv.v.i v1,0
>>>>  0x0000000080007812 <+492>:   mv      a5,a0
>>>> 
>>>> 
>>>> And then it raises an illegal instruction probably because V isn't
>>>> enabled. But I'm guessing we do not expect to use vector code in OpenSBI
>>>> at all ? I'm using a fairly new qemu if that is of any help
>>>> (248f9209edfd289e7d97fb323e5075ccd55cc157).
>>> 
>>> Ahh, it seems auto-vectorization is enabled by default.
>>> 
>>> We certainly don't want to use vector code in OpenSBI
>>> at the moment.
>>> 
>>> How about using the compiler command-line option to
>>> force disable auto-vectorization ?
>> 
>> Just don?t put V in the ISA string? The assembly already does
>> 
>>    .option arch, +v
>> 
>> AFAICT there?s no reason for any C to be compiled with V.
> 
> This is certainly another way but my worry is compilation would
> fail for older toolchains without vector support hence my suggestion
> to disable auto-vectorization.

You still check it?s supported as an option. You just don?t actually
enable it globally, only on the assembly you need it for.

Jess


