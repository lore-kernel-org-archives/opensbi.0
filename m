From: Leo Liang <ycliang@andestech.com>
Date: Thu, 22 Sep 2022 06:33:25 +0000
Subject: [PATCH 11/12] platform: ae350: Add AE350 domain support
In-Reply-To: <20220915015121.27596-12-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
 <20220915015121.27596-12-peterlin@andestech.com>
Message-ID: <YywBtdNbjL6X2nQY@ubuntu01>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:51:20AM +0800, Yu Chien Peter Lin wrote:
> Add domains_init platform hook for Andes AE350, users can add domain
> description in device tree and select FDT domain support in Kconfig
> to achieve system-level partitioning.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  platform/andes/ae350/platform.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>


