From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Sep 2021 15:33:23 +0800
Subject: [PATCH 3/5] lib: sbi: Print timer frequency at boot time
In-Reply-To: <20210915092128.1029868-4-anup.patel@wdc.com>
References: <20210915092128.1029868-1-anup.patel@wdc.com>
 <20210915092128.1029868-4-anup.patel@wdc.com>
Message-ID: <CAEUhbmV_EtCW_HV-oiRP7=y22J6frsG_HR05DFqGtQr8PLm2iw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 5:22 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We now have frequency in timer device instance provided by platform
> so let's print timer frequency as part of the boot prints.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_init.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

