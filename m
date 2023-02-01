From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 1 Feb 2023 14:13:57 +0530
Subject: [PATCH 0/2] Not to clear all the bits of mip
In-Reply-To: <CAKddAkDtLOwsT9XTOPY3zpO+h78zGVFx=PtEn-+jafab69ON_Q@mail.gmail.com>
References: <20230117081428.15042-1-nick.hu@sifive.com> <CAKddAkDtLOwsT9XTOPY3zpO+h78zGVFx=PtEn-+jafab69ON_Q@mail.gmail.com>
Message-ID: <CAK9=C2WGnMueTK-aX3LY_emC1_RqPxFAA3szc3S-=gsc3FC9zw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 1, 2023 at 1:52 PM Nick Hu <nick.hu@sifive.com> wrote:
>
> On Tue, Jan 17, 2023 at 4:14 PM Nick Hu <nick.hu@sifive.com> wrote:
>>
>> In generic behavior of QEMU, if we clear the mip.SEIP and the pendings of
>> PLIC still exist, the QEMU may not set the mip.SEIP back immediately. So
>> interrupts won't be handled anymore until the next new device interrupt
>> arrived. We should only clear the SSIP and STIP which set by SW. The rest
>> of the bits should be decided by HW.
>>
>> Nick Hu (2):
>>   firmware: Not to clear all the MIP
>>   lib: sbi_hsm: Use csr_set to restore the MIP
>>
>>  firmware/fw_base.S | 10 ++++++++--
>>  lib/sbi/sbi_hsm.c  |  2 +-
>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> --
>> 2.34.1
>>
> Hi Anup,
>
> Do you have any suggestions on the patches?

This is next on my list. I will review it soon.

Regards,
Anup

