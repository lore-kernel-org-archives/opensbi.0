From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 21:08:16 +0800
Subject: [PATCH 1/1] firware: use __SIZEOF_LONG__ for field offsets in
 fw_dynamic.h
In-Reply-To: <20210712092405.6772-1-Alexander.Richardson@cl.cam.ac.uk>
References: <20210712092405.6772-1-Alexander.Richardson@cl.cam.ac.uk>
Message-ID: <CAEUhbmX1tNa5NRjxfhiYMX0eoy_1iqKyURQJDkiyUCEGODY=fg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 5:25 PM Alex Richardson
<Alexander.Richardson@cl.cam.ac.uk> wrote:
>
> The fields are of type unsigned long and are not pointers. While this
> happens to be the same for RV32/RV64, it is not correct when compiling
> for a CHERI-RISC-V system where pointers are twice the size of long.
>
> Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
> ---
>  include/sbi/fw_dynamic.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

