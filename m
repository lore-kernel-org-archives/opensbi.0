From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 11 Oct 2024 19:26:23 +0800
Subject: [PATCH 13/16] lib: sbi: Add SBI Message Proxy (MPXY) framework
In-Reply-To: <20240806073338.1856901-14-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
 <20240806073338.1856901-14-apatel@ventanamicro.com>
Message-ID: <ZwkLX_zeRwFSXBNb@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Tue, Aug 06, 2024 at 01:03:35PM +0530, Anup Patel wrote:
> From: Rahul Pathak <rpathak@ventanamicro.com>
> 
> Introduce SBI Message Proxy (MPXY) framework which allows platform specific
> code or drivers to register message protocol specific channels.
> 
> This framework enables the supervisor software to send messages belonging
> to different message protocols via OpenSBI firmware.
> 
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
<...>
> +/** Disable hart shared memory */
> +static inline void sbi_mpxy_shmem_disable(struct mpxy_state *rs)
> +{
> +	rs->shmem.shmem_size = 0;
> +	rs->shmem.shmem_addr_lo = INVALID_ADDR;
> +	rs->shmem.shmem_addr_hi = INVALID_ADDR;

nitpicking: if the abbreviation "rs" representing the RPXY state, would it be renamed as "ms"?

Best regards,
Peter Lin

