From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Nov 2021 10:38:11 +0800
Subject: [PATCH v4 06/11] lib: sbi: Always enable access for all counters
In-Reply-To: <20211105220527.2771269-7-atish.patra@wdc.com>
References: <20211105220527.2771269-1-atish.patra@wdc.com>
 <20211105220527.2771269-7-atish.patra@wdc.com>
Message-ID: <CAEUhbmVgfi7EER+=eBTSQyr9_5C-V+9i_eAa-Me26_Gag=Sn0A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 6:05 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> OpenSBI don't use any counters for its own usage. Thus, all the counters

This was wrongly replaced. Should be "OpenSBI doesn't". I was asking
below change:

> can be made accessible for lower privilege mode always. However, the
> mcountinhibit must be set so that the counter don't increment.

the counter doesn't increment

> As a result, we don't have to enable/disable mcounteren at every start/stop.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_hart.c | 21 +++++++--------------
>  lib/sbi/sbi_pmu.c  | 16 ++++------------
>  2 files changed, 11 insertions(+), 26 deletions(-)
>

Regards,
Bin

