From: Xiang W <wxjstz@126.com>
Date: Wed, 19 Mar 2025 20:39:38 +0800
Subject: [PATCH] lib: sbi: Remove unnecessary SBI_INIT_LIST_HEAD
Message-ID: <20250319123944.505756-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No need to initialise the nodes to be added to the linked list

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_ecall.c         | 1 -
 lib/sbi/sbi_heap.c          | 1 -
 lib/sbi/sbi_mpxy.c          | 1 -
 lib/utils/fdt/fdt_fixup.c   | 1 -
 lib/utils/mailbox/mailbox.c | 2 --
 5 files changed, 6 deletions(-)

diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 3fa3a9e8..745fa313 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -93,7 +93,6 @@ int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
 			return SBI_EINVAL;
 	}
 
-	SBI_INIT_LIST_HEAD(&ext->head);
 	sbi_list_add_tail(&ext->head, &ecall_exts_list);
 
 	return 0;
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 6d08e448..646c2e0b 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -244,7 +244,6 @@ int sbi_heap_init_new(struct sbi_heap_control *hpctrl, unsigned long base,
 	/* Prepare free node list */
 	for (i = 0; i < (hpctrl->hksize / sizeof(*n)); i++) {
 		n = (struct heap_node *)(hpctrl->hkbase + (sizeof(*n) * i));
-		SBI_INIT_LIST_HEAD(&n->head);
 		n->addr = n->size = 0;
 		sbi_list_add_tail(&n->head, &hpctrl->free_node_list);
 	}
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index c5d9d1bb..a706cb6a 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -234,7 +234,6 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 		mpxy_shmem_size = (mpxy_shmem_size + (PAGE_SIZE - 1)) / PAGE_SIZE;
 	}
 
-	SBI_INIT_LIST_HEAD(&channel->head);
 	sbi_list_add_tail(&channel->head, &mpxy_channel_list);
 
 	return SBI_OK;
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 192d6dd5..e237dd07 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -415,7 +415,6 @@ int fdt_register_general_fixup(struct fdt_general_fixup *fixup)
 			return SBI_EALREADY;
 	}
 
-	SBI_INIT_LIST_HEAD(&fixup->head);
 	sbi_list_add_tail(&fixup->head, &fixup_list);
 
 	return 0;
diff --git a/lib/utils/mailbox/mailbox.c b/lib/utils/mailbox/mailbox.c
index 2ea7a005..b3f7e8b9 100644
--- a/lib/utils/mailbox/mailbox.c
+++ b/lib/utils/mailbox/mailbox.c
@@ -34,7 +34,6 @@ int mbox_controller_add(struct mbox_controller *mbox)
 	if (mbox_controller_find(mbox->id))
 		return SBI_EALREADY;
 
-	SBI_INIT_LIST_HEAD(&mbox->node);
 	ATOMIC_INIT(&mbox->xfer_next_seq, 0);
 	SBI_INIT_LIST_HEAD(&mbox->chan_list);
 	sbi_list_add(&mbox->node, &mbox_list);
@@ -80,7 +79,6 @@ struct mbox_chan *mbox_controller_request_chan(struct mbox_controller *mbox,
 	if (!ret)
 		return NULL;
 
-	SBI_INIT_LIST_HEAD(&ret->node);
 	ret->mbox = mbox;
 	sbi_memcpy(ret->chan_args, chan_args, sizeof(ret->chan_args));
 	sbi_list_add(&ret->node, &mbox->chan_list);
-- 
2.47.2


