From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 17:05:35 -0600
Subject: [PATCH 08/12] include: sbi_utils: Include mailbox.h in
 rpmi_mailbox.h header
In-Reply-To: <20250116155651.103782-9-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
 <20250116155651.103782-9-apatel@ventanamicro.com>
Message-ID: <9bc8f00e-aa32-4034-ad6c-008a59c274e5@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-01-16 9:56 AM, Anup Patel wrote:
> The rpmi_mailbox.h uses structures defined in mailbox.h so let's
> include mailbox.h in rpmi_mailbox.h header.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/mailbox/rpmi_mailbox.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


