From: Bin Meng <bmeng@tinylab.org>
Date: Fri, 13 Jan 2023 13:25:46 +0000
Subject: [PATCH] lib: sbi_domain: Avoid overwriting coldboot hart's scratch->arg1
In-Reply-To: <CAAhSdy0OXfbrWRJ4avMAWVrME62GDy=EjnqEWmVF-TRfSa1rMg@mail.gmail.com>
References: <20221230042611.1966361-1-bmeng@tinylab.org>
 <776535ea-e99a-f887-2825-2912aa3b7f30@sholland.org>
 <CAAhSdy0OXfbrWRJ4avMAWVrME62GDy=EjnqEWmVF-TRfSa1rMg@mail.gmail.com>
Message-ID: <em59afd636-68e2-404a-a3ff-4305bb2a36ef@0f6c7a5c.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/1/13 20:42:13, "Anup Patel" <anup@brainfault.org> wrote:

>On Fri, Dec 30, 2022 at 9:56 PM Samuel Holland <samuel@sholland.org> wrote:
>>
>>  Hi Bin,
>>
>>  On 12/29/22 22:26, Bin Meng wrote:
>>  > In sbi_domain_finalize(), when locating the coldboot hart's domain,
>>  > the coldboot hart's scratch->arg1 will be overwritten by the domain
>>  > configuration. scratch->arg1 holds the FDT address of the coldboot
>>  > hart, and in later boot process OpenSBI codes still read the FDT
>>  > here and there, which leads to a crash.
>>
>>  It sounds to me like the bug is in fdt_get_address(), not here. We
>>  should save off the FDT address in some global variable, and not
>>  continue getting it from next_arg1. Then there is no problem updating
>>  next_arg1 from the domain configuration.
>
>I agree with your suggestion.
>
>The fdt_get_address() should return root domains next_arg1 as the
>FDT pointer.
>
>@Bin, will you be sending a v2 patch ?
>

Yes, will do.

Regards,
Bin

