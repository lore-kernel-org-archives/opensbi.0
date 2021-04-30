From: Daniel Cederman <cederman@gaisler.com>
Date: Fri, 30 Apr 2021 13:52:40 +0200
Subject: [PATCH 1/1] lib: utils/serial: Add support for Gaisler APBUART
In-Reply-To: <CAEUhbmVcLuuJ+yCjBj8O_LdK_etN0+BU+auU3FPVL23Gb3876w@mail.gmail.com>
References: <20210430063556.4153719-1-cederman@gaisler.com>
 <CAEUhbmVcLuuJ+yCjBj8O_LdK_etN0+BU+auU3FPVL23Gb3876w@mail.gmail.com>
Message-ID: <f47e5aea805f009c2a9b3df0dc568eb1@gaisler.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Bin,

2021-04-30 11:16 Bin Meng wrote:
> On Fri, Apr 30, 2021 at 2:37 PM Daniel Cederman <cederman@gaisler.com> 
> wrote:
>> 
>> +
>> +static const struct fdt_match serial_gaisler_match[] = {
>> +       { .compatible = "gaisler,apbuart" },
> 
> Is this an approved compatible string? I did not find such in the
> upstream Linux kernel.
> 

This is the corresponding Linux driver: drivers/tty/serial/apbuart.c. It 
was originally written for SPARC and does not have a compatible string. 
We have a patch to make the driver usable with RISC-V, but we have not 
upstreamed it yet. I agree with you that it is probably best not to 
commit this patch until the Linux patch has been accepted to avoid name 
conflicts.

Other than the compatible string, does the patch look ok?

Regards,
Daniel

