From: Bin Meng <bmeng@tinylab.org>
Date: Sat, 31 Dec 2022 01:40:38 +0000
Subject: [PATCH] lib: sbi_domain: Avoid overwriting coldboot hart's scratch->arg1
In-Reply-To: <776535ea-e99a-f887-2825-2912aa3b7f30@sholland.org>
References: <20221230042611.1966361-1-bmeng@tinylab.org>
 <776535ea-e99a-f887-2825-2912aa3b7f30@sholland.org>
Message-ID: <em0eee6780-8a4c-4dfc-b8ea-7ea07a83f6b5@a9022134.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Samuel,

On Sat, Dec 31, 2022 at 12:38 AM Samuel Holland <samuel@sholland.org> 
wrote:
 >
 > Hi Bin,
 >
 > On 12/29/22 22:26, Bin Meng wrote:
 > > In sbi_domain_finalize(), when locating the coldboot hart's domain,
 > > the coldboot hart's scratch->arg1 will be overwritten by the domain
 > > configuration. scratch->arg1 holds the FDT address of the coldboot
 > > hart, and in later boot process OpenSBI codes still read the FDT
 > > here and there, which leads to a crash.
 >
 > It sounds to me like the bug is in fdt_get_address(), not here. We
 > should save off the FDT address in some global variable, and not
 > continue getting it from next_arg1. Then there is no problem updating
 > next_arg1 from the domain configuration.
 >

Yep, I thought about this and felt that might change a lot of places. I 
will have a try in v2.

Regards,
Bin

