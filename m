From: Leo Liang <ycliang@andestech.com>
Date: Thu, 22 Sep 2022 06:29:33 +0000
Subject: [PATCH 08/12] platform: ae350: Add fw_platform_init for platform
 initialization
In-Reply-To: <20220915015121.27596-9-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-9-peterlin@andestech.com>
Message-ID: <YywAzVJR4WKX68TD@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:17AM +0800, Yu Chien Peter Lin wrote:
> This patch adds fw_platform_init() to initialize ae350 platform.name
> and platform.hart_count by parsing device tree.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  platform/andes/ae350/platform.c | 51 +++++++++++++++++++++++++++++++--
>  platform/andes/ae350/platform.h |  2 --
>  2 files changed, 49 insertions(+), 4 deletions(-)

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

