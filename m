From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 21:28:25 -0500
Subject: [PATCH 1/1] lib: sbi: Allow programmable counters to monitor
 cycle/instret events for Andes PMU
In-Reply-To: <20250324051531.2592949-1-ycliang@andestech.com>
References: <20250324051531.2592949-1-ycliang@andestech.com>
Message-ID: <e88108f6-e8ac-4e2c-901e-23d1f71daeb4@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-03-24 12:15 AM, Leo Yu-Chi Liang wrote:
> Referencing commit 0c304b661965
> ("lib: sbi: Allow programmable counters to monitor cycle/instret events")
> to support this functionality for Andes PMU.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  lib/sbi/sbi_pmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


