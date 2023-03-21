From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 21 Mar 2023 10:08:11 +0100
Subject: [RFC PATCH v1 4/4] NOT_FOR_MERGE: Add test code to emulate CPPC
 extension
In-Reply-To: <20230321042054.579520-5-sunilvl@ventanamicro.com>
References: <20230321042054.579520-1-sunilvl@ventanamicro.com>
 <20230321042054.579520-5-sunilvl@ventanamicro.com>
Message-ID: <20230321090811.3sujkketsmz7wo7u@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sunil,

I know this isn't for merge, but I have comments which apply to
the previous patches here.

On Tue, Mar 21, 2023 at 09:50:54AM +0530, Sunil V L wrote:
> This is a test code to emulate the CPPC extension and it is
> not for merge.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
...
> +static int sbi_cppc_test_probe(unsigned long reg)
> +{
> +	int ret = SBI_SUCCESS;
> +
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
> +		ret = 32;
> +		break;
> +	case SBI_CPPC_REFERENCE_CTR:
> +	case SBI_CPPC_DELIVERED_CTR:
> +		ret = 64;
> +		break;
> +	case SBI_CPPC_GUARANTEED_PERF:
> +	case SBI_CPPC_MIN_PERF:
> +	case SBI_CPPC_MAX_PERF:
> +	case SBI_CPPC_PERF_REDUC_TOLERANCE:
> +	case SBI_CPPC_TIME_WINDOW:
> +	case SBI_CPPC_CTR_WRAP_TIME:
> +	case SBI_CPPC_ENABLE:
> +	case SBI_CPPC_AUTO_SEL_ENABLE:
> +	case SBI_CPPC_AUTO_ACT_WINDOW:
> +	case SBI_CPPC_ENERGY_PERF:

I think we should implement this switch in the main cppc code. Then,
here in the platform-specific code, all optional fields which are
not implemented will return zero, but everything else will use the
common implementation. I.e.

 int my_cppc_probe(unsigned long reg)
 {
    switch (ret) {
    case SBI_CPPC_GUARANTEED_PERF:
    case SBI_CPPC_MIN_PERF:
    case SBI_CPPC_MAX_PERF:
    case SBI_CPPC_PERF_REDUC_TOLERANCE:
    case SBI_CPPC_TIME_WINDOW:
    case SBI_CPPC_CTR_WRAP_TIME:
    case SBI_CPPC_ENABLE:
    case SBI_CPPC_AUTO_SEL_ENABLE:
    case SBI_CPPC_AUTO_ACT_WINDOW:
    case SBI_CPPC_ENERGY_PERF:
        return 0;
    }

    return cppc_probe(reg);
 }

> +		ret = 0;
> +		break;
> +	default:
> +		sbi_printf("Unrecognized FFH register\n");
> +		ret = SBI_ERR_INVALID_PARAM;

This should also be covered by the common code. The platform-specific
read and write functions can call a common function for validation,
so they become something like

   ret = cppc_reg_validate(reg);
   if (ret != SBI_SUCCESS)
       return ret;

   switch (reg) {
   case REG ... REG:
      /* do read or write */
   }


Thanks,
drew

