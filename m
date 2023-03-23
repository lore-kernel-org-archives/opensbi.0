From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 23 Mar 2023 18:02:32 +0100
Subject: [RFC PATCH v2 4/4] NOT_FOR_MERGE: Add test code to emulate CPPC
 extension
In-Reply-To: <20230323090320.2489167-5-sunilvl@ventanamicro.com>
References: <20230323090320.2489167-1-sunilvl@ventanamicro.com>
 <20230323090320.2489167-5-sunilvl@ventanamicro.com>
Message-ID: <20230323170232.gyyjtaank2fku3ex@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 23, 2023 at 02:33:20PM +0530, Sunil V L wrote:
> This is a test code to emulate the CPPC extension and it is
> not for merge.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  include/sbi/sbi_cppc.h       |   2 +
>  platform/generic/objects.mk  |   1 +
>  platform/generic/platform.c  |   6 ++
>  platform/generic/test_cppc.c | 204 +++++++++++++++++++++++++++++++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 platform/generic/test_cppc.c
> 
> diff --git a/include/sbi/sbi_cppc.h b/include/sbi/sbi_cppc.h
> index edf73f5..f62d702 100644
> --- a/include/sbi/sbi_cppc.h
> +++ b/include/sbi/sbi_cppc.h
> @@ -32,4 +32,6 @@ int sbi_cppc_write(unsigned long reg, uint64_t val);
>  const struct sbi_cppc_device *sbi_cppc_get_device(void);
>  void sbi_cppc_set_device(const struct sbi_cppc_device *dev);
>  
> +int test_cppc_init(void);
> +
>  #endif
> diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> index 136853e..d9eb959 100644
> --- a/platform/generic/objects.mk
> +++ b/platform/generic/objects.mk
> @@ -20,6 +20,7 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
>  # Objects to build
>  platform-objs-y += platform.o
>  platform-objs-y += platform_override_modules.o
> +platform-objs-$(CONFIG_SBI_ECALL_CPPC) += test_cppc.o
>  
>  # Blobs to build
>  FW_TEXT_START=0x80000000
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index eeefef4..ef85b70 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -14,6 +14,7 @@
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_system.h>
> +#include <sbi/sbi_cppc.h>
>  #include <sbi_utils/fdt/fdt_domain.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> @@ -166,6 +167,11 @@ static int generic_final_init(bool cold_boot)
>  	if (!cold_boot)
>  		return 0;
>  
> +#ifdef CONFIG_SBI_ECALL_CPPC
> +	if (!generic_plat)
> +		test_cppc_init();
> +#endif
> +
>  	fdt = fdt_get_address();
>  
>  	fdt_cpu_fixup(fdt);
> diff --git a/platform/generic/test_cppc.c b/platform/generic/test_cppc.c
> new file mode 100644
> index 0000000..91ee187
> --- /dev/null
> +++ b/platform/generic/test_cppc.c
> @@ -0,0 +1,204 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + */
> +
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_cppc.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_string.h>
> +#include <sbi/sbi_timer.h>
> +
> +struct perf_channel {
> +	unsigned int	highest_perf;
> +	unsigned int	nominal_perf;
> +	unsigned int	lowest_nonlinear_perf;
> +	unsigned int	lowest_perf;
> +	unsigned int	desired_perf;
> +	unsigned int	perf_limited;
> +	unsigned int	reference_perf;
> +	unsigned int	lowest_freq;
> +	unsigned int	nominal_freq;
> +	unsigned int	transition_latency;
> +};
> +
> +static unsigned long cppc_offset;
> +
> +static int sbi_cppc_test_read(unsigned long reg, uint64_t *val)
> +{
> +	struct sbi_scratch *scratch;
> +	struct perf_channel *cppc;
> +	unsigned long hartid;
> +	int ret = SBI_SUCCESS;
> +
> +	hartid = current_hartid();
> +
> +	scratch = sbi_hartid_to_scratch(hartid);
> +	cppc = sbi_scratch_offset_ptr(scratch, cppc_offset);
> +
> +	switch (reg) {
> +	case SBI_CPPC_HIGHEST_PERF:
> +		*val = cppc->highest_perf;
> +		break;
> +	case SBI_CPPC_NOMINAL_PERF:
> +		*val = cppc->nominal_perf;
> +		break;
> +	case SBI_CPPC_LOW_NON_LINEAR_PERF:
> +		*val = cppc->lowest_nonlinear_perf;
> +		break;
> +	case SBI_CPPC_LOWEST_PERF:
> +		*val = cppc->lowest_perf;
> +		break;
> +	case SBI_CPPC_DESIRED_PERF:
> +		*val = cppc->desired_perf;
> +		break;
> +	case SBI_CPPC_REFERENCE_CTR:
> +		*val = sbi_timer_value();
> +		break;
> +	case SBI_CPPC_DELIVERED_CTR:
> +		/*
> +		 * Can't use CYCLE CSR properly in qemu, so just return
> +		 * TIME itself so that delta(delivered) / delta(ref) = 1
> +		 */
> +		*val = sbi_timer_value();
> +		break;
> +	case SBI_CPPC_PERF_LIMITED:
> +		*val = cppc->perf_limited;
> +		break;
> +	case SBI_CPPC_REFERENCE_PERF:
> +		*val = cppc->reference_perf;
> +		break;
> +	case SBI_CPPC_LOWEST_FREQ:
> +		*val = cppc->lowest_freq;
> +		break;
> +	case SBI_CPPC_NOMINAL_FREQ:
> +		*val = cppc->nominal_freq;
> +		break;
> +	case SBI_CPPC_TRANSITION_LATENCY:
> +		*val = cppc->transition_latency;
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sbi_cppc_test_write(unsigned long reg, uint64_t val)
> +{
> +	struct sbi_scratch *scratch;
> +	struct perf_channel *cppc;
> +	unsigned long hartid;
> +	int ret = SBI_SUCCESS;
> +
> +	hartid = current_hartid();
> +
> +	scratch = sbi_hartid_to_scratch(hartid);
> +	cppc = sbi_scratch_offset_ptr(scratch, cppc_offset);
> +
> +	switch (reg) {
> +	case SBI_CPPC_DESIRED_PERF:
> +		cppc->desired_perf = val;
> +		break;
> +	case SBI_CPPC_PERF_LIMITED:
> +		cppc->perf_limited = val;
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sbi_cppc_test_probe(unsigned long reg)
> +{
> +	switch (reg) {
> +	case SBI_CPPC_DESIRED_PERF:
> +	case SBI_CPPC_PERF_LIMITED:
> +	case SBI_CPPC_HIGHEST_PERF:
> +	case SBI_CPPC_NOMINAL_PERF:
> +	case SBI_CPPC_LOW_NON_LINEAR_PERF:
> +	case SBI_CPPC_LOWEST_PERF:
> +	case SBI_CPPC_REFERENCE_PERF:
> +	case SBI_CPPC_LOWEST_FREQ:
> +	case SBI_CPPC_NOMINAL_FREQ:
> +	case SBI_CPPC_TRANSITION_LATENCY:
> +		return 32;
> +	case SBI_CPPC_REFERENCE_CTR:
> +	case SBI_CPPC_DELIVERED_CTR:
> +		return 64;
> +	case SBI_CPPC_GUARANTEED_PERF:
> +	case SBI_CPPC_MIN_PERF:
> +	case SBI_CPPC_MAX_PERF:
> +	case SBI_CPPC_PERF_REDUC_TOLERANCE:
> +	case SBI_CPPC_TIME_WINDOW:
> +	case SBI_CPPC_CTR_WRAP_TIME:
> +	case SBI_CPPC_ENABLE:
> +	case SBI_CPPC_AUTO_SEL_ENABLE:
> +	case SBI_CPPC_AUTO_ACT_WINDOW:
> +	case SBI_CPPC_ENERGY_PERF_PREFERENCE:
> +		return 0;
> +	}
> +
> +	return -1;

I think there was a misunderstanding as to what I was suggesting for
probe. I was thinking the common probe could handle everything that
doesn't change from the spec itself. There was also a misunderstanding
on what I was thinking for read/write, since they can still return
SBI errors rather than 0/-1. Here's a patch that applies on top of
this series which illustrates what I'm thinking.

diff --git a/lib/sbi/sbi_cppc.c b/lib/sbi/sbi_cppc.c
index b177c9b5151e..4002eb189852 100644
--- a/lib/sbi/sbi_cppc.c
+++ b/lib/sbi/sbi_cppc.c
@@ -73,8 +73,32 @@ int sbi_cppc_probe(unsigned long reg)
 	ret = cppc_dev->cppc_probe(reg);
 	if (ret >= 0)
 		return ret;
-	else
-		return SBI_ERR_FAILED;
+
+	switch (reg) {
+	case SBI_CPPC_HIGHEST_PERF:
+	case SBI_CPPC_NOMINAL_PERF:
+	case SBI_CPPC_LOW_NON_LINEAR_PERF:
+	case SBI_CPPC_LOWEST_PERF:
+	case SBI_CPPC_GUARANTEED_PERF:
+	case SBI_CPPC_DESIRED_PERF:
+	case SBI_CPPC_MIN_PERF:
+	case SBI_CPPC_MAX_PERF:
+	case SBI_CPPC_PERF_REDUC_TOLERANCE:
+	case SBI_CPPC_TIME_WINDOW:
+	case SBI_CPPC_PERF_LIMITED:
+	case SBI_CPPC_ENABLE:
+	case SBI_CPPC_AUTO_SEL_ENABLE:
+	case SBI_CPPC_AUTO_ACT_WINDOW:
+	case SBI_CPPC_ENERGY_PERF_PREFERENCE:
+	case SBI_CPPC_REFERENCE_PERF:
+	case SBI_CPPC_LOWEST_FREQ:
+	case SBI_CPPC_NOMINAL_FREQ:
+	case SBI_CPPC_TRANSITION_LATENCY:
+	case SBI_CPPC_NON_ACPI_LAST:
+		return 32;
+	}
+
+	return SBI_ERR_FAILED;
 }
 
 int sbi_cppc_read(unsigned long reg, uint64_t *val)
@@ -94,10 +118,7 @@ int sbi_cppc_read(unsigned long reg, uint64_t *val)
 	if (!sbi_cppc_readable(reg))
 		return SBI_ERR_DENIED;
 
-	if (!cppc_dev->cppc_read(reg, val))
-		return SBI_SUCCESS;
-	else
-		return SBI_ERR_FAILED;
+	return cppc_dev->cppc_read(reg, val);
 }
 
 int sbi_cppc_write(unsigned long reg, uint64_t val)
@@ -117,8 +138,5 @@ int sbi_cppc_write(unsigned long reg, uint64_t val)
 	if (!sbi_cppc_writable(reg))
 		return SBI_ERR_DENIED;
 
-	if (!cppc_dev->cppc_write(reg, val))
-		return SBI_SUCCESS;
-	else
-		return SBI_ERR_FAILED;
+	return cppc_dev->cppc_write(reg, val);
 }
diff --git a/platform/generic/test_cppc.c b/platform/generic/test_cppc.c
index 91ee187915e0..0c5e076057b5 100644
--- a/platform/generic/test_cppc.c
+++ b/platform/generic/test_cppc.c
@@ -33,7 +33,6 @@ static int sbi_cppc_test_read(unsigned long reg, uint64_t *val)
 	struct sbi_scratch *scratch;
 	struct perf_channel *cppc;
 	unsigned long hartid;
-	int ret = SBI_SUCCESS;
 
 	hartid = current_hartid();
 
@@ -82,10 +81,10 @@ static int sbi_cppc_test_read(unsigned long reg, uint64_t *val)
 		*val = cppc->transition_latency;
 		break;
 	default:
-		return -1;
+		return SBI_ERR_FAILED;
 	}
 
-	return ret;
+	return SBI_SUCCESS;
 }
 
 static int sbi_cppc_test_write(unsigned long reg, uint64_t val)
@@ -93,7 +92,6 @@ static int sbi_cppc_test_write(unsigned long reg, uint64_t val)
 	struct sbi_scratch *scratch;
 	struct perf_channel *cppc;
 	unsigned long hartid;
-	int ret = SBI_SUCCESS;
 
 	hartid = current_hartid();
 
@@ -108,26 +106,15 @@ static int sbi_cppc_test_write(unsigned long reg, uint64_t val)
 		cppc->perf_limited = val;
 		break;
 	default:
-		return -1;
+		return SBI_ERR_FAILED;
 	}
 
-	return ret;
+	return SBI_SUCCESS;
 }
 
 static int sbi_cppc_test_probe(unsigned long reg)
 {
 	switch (reg) {
-	case SBI_CPPC_DESIRED_PERF:
-	case SBI_CPPC_PERF_LIMITED:
-	case SBI_CPPC_HIGHEST_PERF:
-	case SBI_CPPC_NOMINAL_PERF:
-	case SBI_CPPC_LOW_NON_LINEAR_PERF:
-	case SBI_CPPC_LOWEST_PERF:
-	case SBI_CPPC_REFERENCE_PERF:
-	case SBI_CPPC_LOWEST_FREQ:
-	case SBI_CPPC_NOMINAL_FREQ:
-	case SBI_CPPC_TRANSITION_LATENCY:
-		return 32;
 	case SBI_CPPC_REFERENCE_CTR:
 	case SBI_CPPC_DELIVERED_CTR:
 		return 64;


Thanks,
drew

