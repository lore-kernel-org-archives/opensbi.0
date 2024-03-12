From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 12 Mar 2024 11:55:21 -0500
Subject: [PATCH v2 03/10] include: sbi: Add trap_context pointer in struct
 sbi_scratch
In-Reply-To: <20240312102804.1436376-4-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-4-apatel@ventanamicro.com>
Message-ID: <c6af2081-399c-4b84-9933-076bb6b2c23c@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-12 5:27 AM, Anup Patel wrote:
> To track nested traps, the struct sbi_scratch needs a pointer the
> current trap context so add trap_context pointer in struct sbi_context.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  firmware/fw_base.S        |  3 ++-
>  include/sbi/sbi_scratch.h | 15 ++++++++++++---
>  2 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


