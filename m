From: Leo Liang <ycliang@andestech.com>
Date: Thu, 22 Sep 2022 06:31:18 +0000
Subject: [PATCH 10/12] lib: utils/ipi: Add PLICSW mmio region to root
 domain
In-Reply-To: <20220915015121.27596-11-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-11-peterlin@andestech.com>
Message-ID: <YywBNrgGKq0SgxiI@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:19AM +0800, Yu Chien Peter Lin wrote:
> Add PLICSW as mmio memregion in root domain at boot-time.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  lib/utils/ipi/fdt_ipi_plicsw.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

