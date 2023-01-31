From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 31 Jan 2023 18:34:31 +0100
Subject: [PATCH v5 3/8] lib: sbi: Add sbi_ngets() function
In-Reply-To: <20230113114110.1916226-4-apatel@ventanamicro.com>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-4-apatel@ventanamicro.com>
Message-ID: <20230131173431.vaslohetvgyylxnc@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 13, 2023 at 05:11:05PM +0530, Anup Patel wrote:
> We add new sbi_ngets() which help us read characters into a
> physical memory location.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/sbi/sbi_console.h |  2 ++
>  lib/sbi/sbi_console.c     | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

