From: Inochi Amaoto <inochiama@outlook.com>
Date: Sun, 20 Aug 2023 12:54:50 +0800
Subject: [PATCH V2] platform: generic: allwinner: correct mhpmevent count
In-Reply-To: <CAJF2gTQOdCpKaFDu=W9oKpvj8_u4oOMsANfJiNovHiCvVkS4RQ@mail.gmail.com>
References: <CAJF2gTQOdCpKaFDu=W9oKpvj8_u4oOMsANfJiNovHiCvVkS4RQ@mail.gmail.com>
Message-ID: <IA1PR20MB4953E383790AF9932716F820BB19A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks. This is good for me. And the patch does not need any further changes.

>On Sun, Aug 20, 2023 at 8:53?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>>
>> Thanks, but now I have a small problem: wheather the bit cycles and bit
>> instructions should be set in soc extensions init? Or these two bits should
>> be handled in sbi pmu init?
>
>The mphm_mask only represents the available HPM counters. The fixed
>counters are assumed to be available.
>
>This is already taken care by ib/sbi/sbi_pmu.c in the pmu_add_hw_event_map().
>
>Regards,
>Anup

