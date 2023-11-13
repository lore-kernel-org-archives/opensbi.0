From: Bo Gan <ganboing@gmail.com>
Date: Mon, 13 Nov 2023 04:31:42 -0800
Subject: Security and correctness issues around captured FDT pointers
Message-ID: <4caf2c9d-36ba-c1e8-8e38-ec733a41e74a@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi OpenSBI community again,

It's a little bit unclear to me from design point of view how are we going to
protect the flattened device tree shared with lower privileged modes. I ask
because in several places we have the following

1. generic/platform.c:
> static void fw_platform_lookup_special(void *fdt, int root_offset)
> {
> ...
> 	match = fdt_match_node(fdt, root_offset, plat->match_table);
> 	if (!match)
> 		continue;
> 
> 	generic_plat = plat;
> 	generic_plat_match = match;

`generic_plat_match` captures a data blob inside fdt.

2. generic/starfive/jh7110.c
> static int starfive_jh7110_final_init(bool cold_boot,
> 				      const struct fdt_match *match)
> {
> 	void *fdt = fdt_get_address();
> 
> 	if (cold_boot) {
> 		fdt_reset_driver_init(fdt, &fdt_reset_pmic);
> 		return starfive_jh7110_inst_init(fdt);
> 	}
> 
> static int pm_reset_init(void *fdt, int nodeoff,
> 			 const struct fdt_match *match)
> {
> ...
> 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
> 	if (rc)
> 		return rc;
> 
> 	pmic_inst.dev_addr = addr;
> 	pmic_inst.compatible = match->compatible;

`fdt_reset_pmic` will capture a compatible string in `pmic.compatible`

For 1, it's probably safe unless we are using the same fdt from previous boot-
loader and pass it to the next stage. (Could happen if using fw_jump and not
defining FW_JUMP_FDT_ADDR). For 2, it's very likely unsafe. `fdt_get_address`
will return `root.next_arg1`, which IS the fdt we pass to next stage. I don't
think we can ever made the fdt to next stage as read-only, because they, such
as U-boot or Linux kernel running in S-mode, usually will relocate it and reuse
the memory for something else, or at least probably modify it in-place. When it
happens, the harts, at runtime, regardless of cold/warm booted, will access the
corrupted data. This can also be exploited by malicious actors.

In my opinion, the only place we access fdt should be from code boot hart, and
we should stop accessing it and zero-out pointers captured before it kicks warm
boot harts. If the fdt data is still need afterwards, either parse it or make a
copy (perhaps on the heap). fdt_get_address() can also be enhanced to prevent
it from being called in the wrong places. Please let me know your thoughts, and
I'm looking forward to your ideas. Thanks!

Bo



