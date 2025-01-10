From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 9 Jan 2025 17:20:08 -0800
Subject: [PATCH] Work with hartid equal to or greater than SBI_HARTMASK_MAX_BITS.
In-Reply-To: <xg5stvhp7uqggy2mr3jtloueoqxyfjqezc3ohgrhyvpqmbgbpn@6qqfwuvw5gfm>
References: <20250109230853.2440-1-cfu@mips.com> <xg5stvhp7uqggy2mr3jtloueoqxyfjqezc3ohgrhyvpqmbgbpn@6qqfwuvw5gfm>
Message-ID: <CAM1rFzHCYzZh1mzrHv3MOojgeHT4v4TPC7sK2Nu5Mbn4pT_YKw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 4:43?PM Inochi Amaoto <inochiama@gmail.com> wrote:
>
> On Thu, Jan 09, 2025 at 03:08:53PM -0800, Chao-ying Fu wrote:
> > Some platforms use hartid that is equal to greater than SBI_HARTMASK_MAX_BITS,
> > so we should remove the check.
> > ---
> >  lib/utils/fdt/fdt_domain.c  | 3 ---
> >  lib/utils/fdt/fdt_helper.c  | 9 ---------
> >  platform/generic/platform.c | 3 ---
> >  3 files changed, 15 deletions(-)
> >
>
> Is there a specific platform to test this patch? This also applies
> to your other patches.
>
> Regards,
> Inochi
We run OpenSBI and Linux on FPGA boards, RTL simulations, or QEMU. One
example of 24 hart ids is as follows.
0x0, 0x1, 0x10, 0x11, 0x20, 0x21, 0x30, 0x31,
0x10000, 0x10001, 0x10010, 0x10011, 0x10020, 0x10021, 0x10030, 0x10031,
0x20000, 0x20001, 0x20010, 0x20011, 0x20020, 0x20021, 0x20030, 0x20031.
After removing the hart id check, OpenSBI is fine.
Note that last year OpenSBI changed to use hart index to access the array.
Thanks!

Regards,
Chao-ying

