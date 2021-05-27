From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:35 -0700
Subject: [PATCH v2 06/15] include: Add a list empty check function
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-7-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement a list helper function that checks for empty lists.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_list.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
index 1174ad274c54..b1178dfc9b8e 100644
--- a/include/sbi/sbi_list.h
+++ b/include/sbi/sbi_list.h
@@ -43,6 +43,17 @@ static inline void __sbi_list_add(struct sbi_dlist *new,
 	next->prev = new;
 }
 
+/**
+ * Checks if the list is empty or not.
+ * @param head List head
+ *
+ * Retruns TRUE if list is empty, FALSE otherwise.
+ */
+static inline bool sbi_list_empty(struct sbi_dlist *head)
+{
+	return head->next == head;
+}
+
 /**
  * Adds the new node after the given head.
  * @param new New node that needs to be added to list.
-- 
2.25.1


