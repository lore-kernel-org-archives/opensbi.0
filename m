From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 17:07:58 -0600
Subject: [PATCH 11/12] include: sbi_utils: Update RPMI service group IDs
 and BASE service group
In-Reply-To: <20250116155651.103782-12-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-12-apatel@ventanamicro.com>
Message-ID: <f0978cbe-dc03-4586-a2b7-0219147abde1@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-01-16 9:56 AM, Anup Patel wrote:
> The service group ID assignment and some of the BASE services have
> changes in the latest RPMI specification so let's update the RPMI
> implementation accordingly.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/mailbox/rpmi_msgprot.h   | 16 +++++++---------
>  lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c |  4 ----
>  2 files changed, 7 insertions(+), 13 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


