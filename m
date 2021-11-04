From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 16:36:46 +0800
Subject: [PATCH v3 07/11] lib: sbi: Allow programmable counters to monitor
 cycle/instret events
In-Reply-To: <20211102150959.492991-8-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
 <20211102150959.492991-8-atish.patra@wdc.com>
Message-ID: <CAEUhbmWm0HNJMu_5XknfuxfdNAE7RYEWru9XhLMmy49bBHj_fQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 2, 2021 at 11:11 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> A platform may use programmable counters for cycle/instret events.
> The priv spec allows that provided that cycle/instret also report those
> events in addition to the programmable counters. We should allow that
> functionality in OpenSBI.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/sbi_pmu.h |  1 +
>  lib/sbi/sbi_pmu.c     | 59 +++++++++++++++++++++++++++++++------------
>  2 files changed, 44 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

