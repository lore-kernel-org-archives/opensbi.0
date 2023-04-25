From: Xiang W <wxjstz@126.com>
Date: Tue, 25 Apr 2023 16:56:23 +0800
Subject: [PATCH 1/2] lib: sbi: Remove unnecessary semicolon
In-Reply-To: <20230425085625.465921-1-wxjstz@126.com>
References: <20230425085625.465921-1-wxjstz@126.com>
Message-ID: <20230425085625.465921-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_list.h         | 2 +-
 lib/sbi/riscv_asm.c            | 4 ++--
 lib/sbi/sbi_domain.c           | 4 ++--
 lib/sbi/sbi_ecall_legacy.c     | 2 +-
 lib/sbi/sbi_ecall_pmu.c        | 2 +-
 lib/sbi/sbi_ecall_rfence.c     | 2 +-
 lib/sbi/sbi_emulate_csr.c      | 4 ++--
 lib/sbi/sbi_hsm.c              | 2 +-
 lib/sbi/sbi_illegal_insn.c     | 2 +-
 lib/sbi/sbi_init.c             | 2 +-
 lib/sbi/sbi_ipi.c              | 2 +-
 lib/sbi/sbi_trap.c             | 4 ++--
 lib/sbi/sbi_unpriv.c           | 2 +-
 lib/utils/fdt/fdt_helper.c     | 2 +-
 lib/utils/libfdt/fdt_overlay.c | 2 +-
 15 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
index fe735df..9e56c52 100644
--- a/include/sbi/sbi_list.h
+++ b/include/sbi/sbi_list.h
@@ -31,7 +31,7 @@ struct sbi_dlist _lname = SBI_LIST_HEAD_INIT(_lname)
 #define SBI_INIT_LIST_HEAD(ptr)	\
 do { \
 	(ptr)->next = ptr; (ptr)->prev = ptr; \
-} while (0);
+} while (0)
 
 static inline void __sbi_list_add(struct sbi_dlist *new,
 				  struct sbi_dlist *prev,
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index a09cf78..cd56553 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -152,7 +152,7 @@ unsigned long csr_read_num(int csr_num)
 	default:
 		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
 		break;
-	};
+	}
 
 	return ret;
 
@@ -220,7 +220,7 @@ void csr_write_num(int csr_num, unsigned long val)
 	default:
 		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
 		break;
-	};
+	}
 
 #undef switchcase_csr_write_64
 #undef switchcase_csr_write_32
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 67b87f3..c55e192 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -261,7 +261,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
 				   "hart %d\n", __func__, dom->name, i);
 			return SBI_EINVAL;
 		}
-	};
+	}
 
 	/* Check memory regions */
 	if (!dom->regions) {
@@ -451,7 +451,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	default:
 		sbi_printf("Unknown\n");
 		break;
-	};
+	}
 
 	sbi_printf("Domain%d SysReset    %s: %s\n",
 		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index e20de76..8237498 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -112,7 +112,7 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
-	};
+	}
 
 	return ret;
 }
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 8f91f9c..367e927 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -76,7 +76,7 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
-	};
+	}
 
 	return ret;
 }
diff --git a/lib/sbi/sbi_ecall_rfence.c b/lib/sbi/sbi_ecall_rfence.c
index 8f0e3d7..6334c00 100644
--- a/lib/sbi/sbi_ecall_rfence.c
+++ b/lib/sbi/sbi_ecall_rfence.c
@@ -74,7 +74,7 @@ static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
-	};
+	}
 
 	return ret;
 }
diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index 64bebd8..da81165 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -149,7 +149,7 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 	default:
 		ret = SBI_ENOTSUPP;
 		break;
-	};
+	}
 
 	if (ret)
 		sbi_dprintf("%s: hartid%d: invalid csr_num=0x%x\n",
@@ -187,7 +187,7 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
 	default:
 		ret = SBI_ENOTSUPP;
 		break;
-	};
+	}
 
 	if (ret)
 		sbi_dprintf("%s: hartid%d: invalid csr_num=0x%x\n",
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index b261410..f870ca7 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -172,7 +172,7 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 	/* Wait for state transition requested by sbi_hsm_hart_start() */
 	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
 		wfi();
-	};
+	}
 
 	/* Restore MIE CSR */
 	csr_write(CSR_MIE, saved_mie);
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 9691bce..2be4757 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -90,7 +90,7 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 		break;
 	default:
 		return truly_illegal_insn(insn, regs);
-	};
+	}
 
 	if (do_write && sbi_emulate_csr_write(csr_num, regs, new_csr_val))
 		return truly_illegal_insn(insn, regs);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5db8e7f..539f824 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -200,7 +200,7 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 			wfi();
 			cmip = csr_read(CSR_MIP);
 		 } while (!(cmip & (MIP_MSIP | MIP_MEIP)));
-	};
+	}
 
 	/* Acquire coldboot lock */
 	spin_lock(&coldboot_lock);
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 4f94bce..ba83f24 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -233,7 +233,7 @@ void sbi_ipi_process(void)
 skip:
 		ipi_type = ipi_type >> 1;
 		ipi_event++;
-	};
+	}
 }
 
 int sbi_ipi_raw_send(u32 target_hart)
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 025cf61..dbf307c 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -212,7 +212,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 		return sbi_irqchip_process(regs);
 	default:
 		return SBI_ENOENT;
-	};
+	}
 
 	return 0;
 }
@@ -320,7 +320,7 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 
 		rc = sbi_trap_redirect(regs, &trap);
 		break;
-	};
+	}
 
 trap_error:
 	if (rc)
diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 9a34a71..2a55d9d 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -163,7 +163,7 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 		break;
 	default:
 		break;
-	};
+	}
 
 	return insn;
 }
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 48bc2fe..a88a4ba 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -689,7 +689,7 @@ int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic)
 			break;
 		regs->addr = reg_addr;
 		regs->size = reg_size;
-	};
+	}
 	if (!imsic->regs[0].size)
 		return SBI_EINVAL;
 
diff --git a/lib/utils/libfdt/fdt_overlay.c b/lib/utils/libfdt/fdt_overlay.c
index d217e79..0871e26 100644
--- a/lib/utils/libfdt/fdt_overlay.c
+++ b/lib/utils/libfdt/fdt_overlay.c
@@ -404,7 +404,7 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 						   name, name_len, poffset,
 						   &phandle_prop,
 						   sizeof(phandle_prop));
-};
+}
 
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
-- 
2.39.2


