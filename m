From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 29 Dec 2022 12:33:04 +0000
Subject: [PATCH 1/2] lib: utils: Add fdt_add_cpu_idle_states() helper
 function
In-Reply-To: <20221228191125.37584-1-samuel@sholland.org>
References: <20221228191125.37584-1-samuel@sholland.org>
Message-ID: <Y62JAIU/VBM/jpV+@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Samuel,

On Wed, Dec 28, 2022 at 01:11:23PM -0600, Samuel Holland wrote:
> Since the availability and latency properties of CPU idle states depend
> on the specific SBI HSM implementation, it is appropriate that the idle
> states are added to the devicetree at runtime by that implementation.
> 
> This helper function adds a platform-provided array of idle states to
> the devicetree, following the SBI idle state binding. It makes some
> assumptions for simplicity, but these could be relaxed if needed.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  include/sbi_utils/fdt/fdt_fixup.h | 23 +++++++++
>  lib/utils/fdt/fdt_fixup.c         | 80 +++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
> index fb076ba..cab3f0f 100644
> --- a/include/sbi_utils/fdt/fdt_fixup.h
> +++ b/include/sbi_utils/fdt/fdt_fixup.h
> @@ -9,6 +9,29 @@
>  #ifndef __FDT_FIXUP_H__
>  #define __FDT_FIXUP_H__
>  
> +struct sbi_cpu_idle_state {
> +	const char *name;
> +	uint32_t suspend_param;
> +	bool local_timer_stop;
> +	uint32_t entry_latency_us;
> +	uint32_t exit_latency_us;
> +	uint32_t min_residency_us;
> +	uint32_t wakeup_latency_us;
> +};
> +
> +/**
> + * Add CPU idle states to cpu nodes in the DT
> + *
> + * Add information about CPU idle states to the devicetree. This function
> + * assumes that CPU idle states are not already present in the devicetree, and
> + * that all CPU states are equally applicable to all CPUs.
> + *
> + * @param fdt: device tree blob
> + * @param states: array of idle state descriptions, ending with empty element
> + * @return zero on success and -ve on failure
> + */
> +int fdt_add_cpu_idle_states(void *dtb, const struct sbi_cpu_idle_state *state);
> +
>  /**
>   * Fix up the CPU node in the device tree
>   *
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index 41f6cbb..d9aa0b2 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -18,6 +18,86 @@
>  #include <sbi_utils/fdt/fdt_pmu.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  
> +int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
> +{
> +	int cpu_node, cpus_node, err, idle_states_node;
> +	uint32_t count, phandle;
> +
> +	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 1024);
> +	if (err < 0)
> +		return err;
> +
> +	err = fdt_find_max_phandle(fdt, &phandle);
> +	phandle++;
> +	if (err < 0)
> +		return err;
> +
> +	cpus_node = fdt_path_offset(fdt, "/cpus");
> +	if (cpus_node < 0)
> +		return cpus_node;
> +
> +	/* Create the idle-states node and its child nodes. */
> +	idle_states_node = fdt_add_subnode(fdt, cpus_node, "idle-states");
> +	if (idle_states_node < 0)
> +		return idle_states_node;

It breaks platform final init when the ?idle-states? already exists:

   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

init_coldboot: platform final init failed (error -2)

The error code comes from fdt_add_subnode_namelen():
https://github.com/riscv-software-src/opensbi/blob/v1.2/lib/utils/libfdt/fdt_rw.c#L347

should it return 0 here?

Best regards,
Peter Lin

