From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 9 Mar 2023 10:19:33 +0100
Subject: [PATCH v3 4/8] lib: sbi_pmu: Rename fw_counter_value
In-Reply-To: <20230309055112.1516581-5-mchitale@ventanamicro.com>
References: <20230309055112.1516581-1-mchitale@ventanamicro.com>
 <20230309055112.1516581-5-mchitale@ventanamicro.com>
Message-ID: <20230309091933.35t3gtpqwumyj7wi@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 09, 2023 at 11:21:08AM +0530, Mayuresh Chitale wrote:
> Rename and reuse fw_counter_value arrary to save both the counter values

array

> for the SBI firmware events and event data for the SBI platform specific
> firmware events.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  lib/sbi/sbi_pmu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

