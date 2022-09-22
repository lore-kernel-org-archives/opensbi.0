From: Leo Liang <ycliang@andestech.com>
Date: Thu, 22 Sep 2022 06:28:16 +0000
Subject: [PATCH 07/12] platform: andes/ae350: Use fdt irqchip driver
In-Reply-To: <20220915015121.27596-8-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-8-peterlin@andestech.com>
Message-ID: <YywAgIDjYwEOW/3H@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:16AM +0800, Yu Chien Peter Lin wrote:
> Andes PLIC is compatible with plic driver. The PLIC base address and
> number of source can be obtained by parsing the device tree.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  platform/andes/ae350/Kconfig    |  3 ++-
>  platform/andes/ae350/platform.c | 24 ++----------------------
>  platform/andes/ae350/platform.h |  3 ---
>  3 files changed, 4 insertions(+), 26 deletions(-)
>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

