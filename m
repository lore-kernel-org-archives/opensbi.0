From: Leo Liang <ycliang@andestech.com>
Date: Tue, 20 Sep 2022 03:34:03 +0000
Subject: [PATCH 01/12] platform: ae350: Remove enabling cache from
 platform final initailzation
In-Reply-To: <20220915015121.27596-2-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-2-peterlin@andestech.com>
Message-ID: <Yyk0q/ziWe6JYpnM@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:10AM +0800, Yu Chien Peter Lin wrote:
> Boot-time cache operations have been handled by U-boot SPL, so we
> can drop duplicate code.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  platform/andes/ae350/platform.c | 19 -------------------
>  1 file changed, 19 deletions(-)
>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

