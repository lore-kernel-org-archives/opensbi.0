From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:10:10 -0800
Subject: [PATCH 9/9] lib: sbi_irqchip: Set the IRQ handler when registering a chip
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <20241105041015.2949808-10-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In addition to saving some code size, this moves the decision about
setting the top-level external interrupt handler to the irqchip core,
not the specific driver, which would be needed to support chained
interrupt handlers.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_irqchip.h | 13 +++----------
 lib/sbi/sbi_irqchip.c     |  9 +++------
 lib/utils/irqchip/imsic.c |  4 +---
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 9d26067f..e0ae12f5 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -22,17 +22,10 @@ struct sbi_irqchip_device {
 
 	/** Initialize per-hart state for the current hart */
 	int (*warm_init)(struct sbi_irqchip_device *dev);
-};
 
-/**
- * Set external interrupt handling function
- *
- * This function is called by OpenSBI platform code to set a handler for
- * external interrupts
- *
- * @param fn function pointer for handling external irqs
- */
-void sbi_irqchip_set_irqfn(int (*fn)(void));
+	/** Handle an IRQ from this irqchip */
+	int (*irq_handle)(void);
+};
 
 /**
  * Process external interrupts
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index ab487d16..0594e05a 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -20,12 +20,6 @@ static int default_irqfn(void)
 
 static int (*ext_irqfn)(void) = default_irqfn;
 
-void sbi_irqchip_set_irqfn(int (*fn)(void))
-{
-	if (fn)
-		ext_irqfn = fn;
-}
-
 int sbi_irqchip_process(void)
 {
 	return ext_irqfn();
@@ -34,6 +28,9 @@ int sbi_irqchip_process(void)
 void sbi_irqchip_add_device(struct sbi_irqchip_device *dev)
 {
 	sbi_list_add_tail(&dev->node, &irqchip_list);
+
+	if (dev->irq_handle)
+		ext_irqfn = dev->irq_handle;
 }
 
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index b5198b43..057b9fa7 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -347,6 +347,7 @@ int imsic_data_check(struct imsic_data *imsic)
 
 static struct sbi_irqchip_device imsic_device = {
 	.warm_init	= imsic_warm_irqchip_init,
+	.irq_handle	= imsic_external_irqfn,
 };
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
@@ -376,9 +377,6 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 			return SBI_ENOMEM;
 	}
 
-	/* Setup external interrupt function for IMSIC */
-	sbi_irqchip_set_irqfn(imsic_external_irqfn);
-
 	/* Add IMSIC regions to the root domain */
 	for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
 		rc = sbi_domain_root_add_memrange(imsic->regs[i].addr,
-- 
2.45.1


