From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Aug 2022 17:15:47 +0200
Subject: [PATCH v7 16/17] docs: Update documentation for kconfig support
In-Reply-To: <20220804143106.64599-17-apatel@ventanamicro.com>
References: <20220804143106.64599-1-apatel@ventanamicro.com>
 <20220804143106.64599-17-apatel@ventanamicro.com>
Message-ID: <20220804151547.cinsxtl46mazaem2@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 04, 2022 at 08:01:05PM +0530, Anup Patel wrote:
> We update all documentation files to:
> 1) Remove references to platform specific config.mk file since it is
>    has been removed.
> 2) Add details about platform specific configs/defconfig and Kconfig
>    files mandatory for each platform.
> 3) Add required packages in top-level README.md
> 4) Fix typo releated to object.mk in docs/platform/platform.md
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Tested-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  README.md                   | 25 +++++++++++++++++++++++--
>  docs/firmware/fw_dynamic.md |  2 +-
>  docs/firmware/fw_jump.md    |  4 ++--
>  docs/firmware/fw_payload.md |  4 ++--
>  docs/platform/platform.md   |  6 +++---
>  docs/platform_guide.md      |  9 +++++----
>  6 files changed, 36 insertions(+), 14 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

