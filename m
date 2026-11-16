Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4B606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4qGoRjJC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=G9cfibHSgK7u0AnTbacP4vReQLQ8PK21fCTiytLtU10=; b=4qGoRjJCjzUXNRIHi0Nl9lB07d
	s+Vsn0dc7uUnrZVcMMuI9o+mrtXKBFy/OTpr3z2By7NnM4vucBUJ6h/QByjJd5OLNu7nBkYBsX4X5
	F/jo7zsBV+GVOjUizTHonYiK4TgmXZhHqaKz97zkif5KimOmBAJnl7idTzy1VA8nRD6ZGPjqCy4jX
	eN4cPFyAEkXFxm/ZgOjZb1UmEmsYSjAz98eA28coHepkGzrc6gUCLsodXmWVSgZzXU7RtB324S8mD
	a2HNJEXussti8LXpmNuHWO2yA1e0ri+eUPvM5VdmpEqylhGoVWyRWOcgQMrLEDgit2c5XQuL0jg/n
	+W/KUejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw1s-00000002Rav-23XG;
	Mon, 16 Nov 2026 12:41:48 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw1n-00000002RYx-430B
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 12:41:47 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSw1l-006ISd-GU;
	Mon, 16 Nov 2026 07:41:41 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH] lib: sbi: Add read-write locks
Date: Mon, 16 Nov 2026 07:41:41 -0500
Message-ID: <20261116124141.51756-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_044144_085553_EDEB1A7B 
X-CRM114-Status: GOOD (  17.71  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add rwlock_t with read_lock()/read_unlock(), write_lock()/write_unlock()
and trylock variants. Readers share the lock and a writer has it alone.
Writers have priority, so a stream of readers cannot hold one off.

The lock word holds a writer bit and a reader count. A writer sets the
bit, which turns new readers away, and waits for the readers already
in to leave. A reader does not touch the count while the bit is set;
otherwise it adds itself and backs out if a writer set the bit in the
meantime. This needs only fetch-and-add/or/and, which map to AMOs with
A or Zaamo and to LR/SC loops with Zalrsc, as in spin_lock().

Add SBIUnit cases for both modes and for a reader meeting a waiting
writer.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Tested on QEMU virt: the SBIUnit locks suite passes; an 8-hart stress
    run at boot (mixed readers and writers) shows no exclusion violations;
    with 7 harts looping on read_trylock(), a writer gets through, where a
    reader-preferring version starves it. Built for rv32 and rv64 with
    clang and GCC; the lock code also builds for Zaamo-only and
    Zalrsc-only ISA strings. The fence and .aqrl ordering was checked with
    litmus tests against the RISC-V memory model.
    
    This patch was written with the assistance of an AI agent.

 include/sbi/riscv_locks.h        |  36 +++++++++
 include/sbi/sbi_visibility.h     |   4 +
 lib/sbi/riscv_locks.c            | 134 +++++++++++++++++++++++++++++++
 lib/sbi/tests/riscv_locks_test.c |  46 +++++++++++
 4 files changed, 220 insertions(+)

diff --git a/include/sbi/riscv_locks.h b/include/sbi/riscv_locks.h
index a0a34c04..bb1fea48 100644
--- a/include/sbi/riscv_locks.h
+++ b/include/sbi/riscv_locks.h
@@ -42,4 +42,40 @@ void spin_lock(spinlock_t *lock) ACQUIRE(*lock) MUST_NOT_HOLD(*lock);
 
 void spin_unlock(spinlock_t *lock) RELEASE(*lock);
 
+/*
+ * Readers share the lock; a writer has it alone. Writers have priority:
+ * once a writer waits for the lock, new readers wait until it has
+ * released it. So a hart must not take a read lock it already holds.
+ */
+typedef struct {
+	/* RWLOCK_WRITER while a writer holds or waits for it, plus readers */
+	u32 val;
+} CAPABILITY("rwlock") rwlock_t;
+
+#define RWLOCK_WRITER		(1u << 31)
+
+#define __RW_LOCK_UNLOCKED	\
+	(rwlock_t) { 0 }
+
+#define RW_LOCK_INIT(x)	\
+	x = __RW_LOCK_UNLOCKED
+
+#define RW_LOCK_INITIALIZER	\
+	__RW_LOCK_UNLOCKED
+
+#define DEFINE_RW_LOCK(x)	\
+	rwlock_t RW_LOCK_INIT(x)
+
+bool read_trylock(rwlock_t *lock) TRY_ACQUIRE_SHARED(true, *lock);
+
+void read_lock(rwlock_t *lock) ACQUIRE_SHARED(*lock) MUST_NOT_HOLD(*lock);
+
+void read_unlock(rwlock_t *lock) RELEASE_SHARED(*lock);
+
+bool write_trylock(rwlock_t *lock) TRY_ACQUIRE(true, *lock);
+
+void write_lock(rwlock_t *lock) ACQUIRE(*lock) MUST_NOT_HOLD(*lock);
+
+void write_unlock(rwlock_t *lock) RELEASE(*lock);
+
 #endif
diff --git a/include/sbi/sbi_visibility.h b/include/sbi/sbi_visibility.h
index 993561ef..503249f4 100644
--- a/include/sbi/sbi_visibility.h
+++ b/include/sbi/sbi_visibility.h
@@ -27,9 +27,13 @@
 #define PT_GUARDED_BY(x) TSA_ATTR(pt_guarded_by(x))
 #define ACQUIRE(...) TSA_ATTR(acquire_capability(__VA_ARGS__))
 #define RELEASE(...) TSA_ATTR(release_capability(__VA_ARGS__))
+#define ACQUIRE_SHARED(...) TSA_ATTR(acquire_shared_capability(__VA_ARGS__))
+#define RELEASE_SHARED(...) TSA_ATTR(release_shared_capability(__VA_ARGS__))
 #define MUST_HOLD(...) TSA_ATTR(requires_capability(__VA_ARGS__))
 #define MUST_NOT_HOLD(...) TSA_ATTR(locks_excluded(__VA_ARGS__))
 #define TRY_ACQUIRE(b, ...) TSA_ATTR(try_acquire_capability(b, __VA_ARGS__))
+#define TRY_ACQUIRE_SHARED(b, ...) \
+	TSA_ATTR(try_acquire_shared_capability(b, __VA_ARGS__))
 #define NO_THREAD_SAFETY_ANALYSIS TSA_ATTR(no_thread_safety_analysis)
 
 #endif
diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
index fa624a94..03040747 100644
--- a/lib/sbi/riscv_locks.c
+++ b/lib/sbi/riscv_locks.c
@@ -88,3 +88,137 @@ void spin_unlock(spinlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
 {
 	__smp_store_release(&lock->owner, lock->owner + 1);
 }
+
+#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "need A or Zaamo or Zalrsc"
+#endif
+
+/* Atomic fetch-and-add/or/and on the lock word, returning the old value */
+static u32 rwlock_fetch_add(rwlock_t *lock, u32 v)
+{
+	u32 old;
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
+	__asm__ __volatile__("	amoadd.w.aqrl	%0, %2, %1\n"
+			     : "=r"(old), "+A"(lock->val)
+			     : "r"(v)
+			     : "memory");
+#else
+	u32 tmp;
+
+	__asm__ __volatile__("1:	lr.w.aqrl	%0, %2\n"
+			     "	add	%1, %0, %3\n"
+			     "	sc.w.aqrl	%1, %1, %2\n"
+			     "	bnez	%1, 1b\n"
+			     : "=&r"(old), "=&r"(tmp), "+A"(lock->val)
+			     : "r"(v)
+			     : "memory");
+#endif
+	return old;
+}
+
+static u32 rwlock_fetch_or(rwlock_t *lock, u32 v)
+{
+	u32 old;
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
+	__asm__ __volatile__("	amoor.w.aqrl	%0, %2, %1\n"
+			     : "=r"(old), "+A"(lock->val)
+			     : "r"(v)
+			     : "memory");
+#else
+	u32 tmp;
+
+	__asm__ __volatile__("1:	lr.w.aqrl	%0, %2\n"
+			     "	or	%1, %0, %3\n"
+			     "	sc.w.aqrl	%1, %1, %2\n"
+			     "	bnez	%1, 1b\n"
+			     : "=&r"(old), "=&r"(tmp), "+A"(lock->val)
+			     : "r"(v)
+			     : "memory");
+#endif
+	return old;
+}
+
+static u32 rwlock_fetch_and(rwlock_t *lock, u32 v)
+{
+	u32 old;
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
+	__asm__ __volatile__("	amoand.w.aqrl	%0, %2, %1\n"
+			     : "=r"(old), "+A"(lock->val)
+			     : "r"(v)
+			     : "memory");
+#else
+	u32 tmp;
+
+	__asm__ __volatile__("1:	lr.w.aqrl	%0, %2\n"
+			     "	and	%1, %0, %3\n"
+			     "	sc.w.aqrl	%1, %1, %2\n"
+			     "	bnez	%1, 1b\n"
+			     : "=&r"(old), "=&r"(tmp), "+A"(lock->val)
+			     : "r"(v)
+			     : "memory");
+#endif
+	return old;
+}
+
+static u32 rwlock_read(rwlock_t *lock)
+{
+	return *(volatile u32 *)&lock->val;
+}
+
+bool read_trylock(rwlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
+{
+	/* Leave the count alone while a writer holds or waits for the lock */
+	if (rwlock_read(lock) & RWLOCK_WRITER)
+		return false;
+	if (!(rwlock_fetch_add(lock, 1) & RWLOCK_WRITER))
+		return true;
+
+	/* A writer set its bit after the check above */
+	rwlock_fetch_add(lock, -1);
+	return false;
+}
+
+void read_lock(rwlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
+{
+	while (!read_trylock(lock))
+		;
+}
+
+void read_unlock(rwlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
+{
+	rwlock_fetch_add(lock, -1);
+}
+
+bool write_trylock(rwlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
+{
+	u32 old = rwlock_fetch_or(lock, RWLOCK_WRITER);
+
+	if (old & RWLOCK_WRITER)
+		return false;
+	if (!old)
+		return true;
+
+	/* Readers hold the lock and this must not wait for them */
+	rwlock_fetch_and(lock, ~RWLOCK_WRITER);
+	return false;
+}
+
+void write_lock(rwlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
+{
+	/* Claim the writer bit, which keeps new readers out */
+	while (rwlock_fetch_or(lock, RWLOCK_WRITER) & RWLOCK_WRITER) {
+		while (rwlock_read(lock) & RWLOCK_WRITER)
+			;
+	}
+
+	/* Wait for the readers that got in before the bit was set */
+	while (rwlock_read(lock) & ~RWLOCK_WRITER)
+		;
+	RISCV_FENCE(r, rw);
+}
+
+void write_unlock(rwlock_t *lock) NO_THREAD_SAFETY_ANALYSIS
+{
+	/* Not a plain store: a failing reader may have the count raised */
+	rwlock_fetch_and(lock, ~RWLOCK_WRITER);
+}
diff --git a/lib/sbi/tests/riscv_locks_test.c b/lib/sbi/tests/riscv_locks_test.c
index 2cbba3da..3f8bfde7 100644
--- a/lib/sbi/tests/riscv_locks_test.c
+++ b/lib/sbi/tests/riscv_locks_test.c
@@ -34,10 +34,56 @@ static void spin_trylock_success(struct sbiunit_test_case *test)
 	spin_unlock(&test_lock);
 }
 
+static rwlock_t test_rwlock = RW_LOCK_INITIALIZER;
+
+static void read_lock_shared(struct sbiunit_test_case *test)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+	read_lock(&test_rwlock);
+	SBIUNIT_EXPECT(test, read_trylock(&test_rwlock));
+	SBIUNIT_EXPECT(test, !write_trylock(&test_rwlock));
+	read_unlock(&test_rwlock);
+	SBIUNIT_EXPECT(test, !write_trylock(&test_rwlock));
+	read_unlock(&test_rwlock);
+
+	SBIUNIT_ASSERT(test, write_trylock(&test_rwlock));
+	write_unlock(&test_rwlock);
+}
+
+static void write_lock_exclusive(struct sbiunit_test_case *test)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+	write_lock(&test_rwlock);
+	SBIUNIT_EXPECT(test, !read_trylock(&test_rwlock));
+	SBIUNIT_EXPECT(test, !write_trylock(&test_rwlock));
+	write_unlock(&test_rwlock);
+
+	SBIUNIT_ASSERT(test, read_trylock(&test_rwlock));
+	read_unlock(&test_rwlock);
+}
+
+static void read_trylock_writer_waiting(struct sbiunit_test_case *test)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+	read_lock(&test_rwlock);
+
+	/* What a writer waiting for this reader leaves in the lock word */
+	test_rwlock.val |= RWLOCK_WRITER;
+	SBIUNIT_EXPECT(test, !read_trylock(&test_rwlock));
+	SBIUNIT_EXPECT_EQ(test, test_rwlock.val, RWLOCK_WRITER | 1);
+	test_rwlock.val &= ~RWLOCK_WRITER;
+
+	read_unlock(&test_rwlock);
+	SBIUNIT_ASSERT_EQ(test, test_rwlock.val, 0);
+}
+
 static struct sbiunit_test_case locks_test_cases[] = {
 	SBIUNIT_TEST_CASE(spin_lock_test),
 	SBIUNIT_TEST_CASE(spin_trylock_fail),
 	SBIUNIT_TEST_CASE(spin_trylock_success),
+	SBIUNIT_TEST_CASE(read_lock_shared),
+	SBIUNIT_TEST_CASE(write_lock_exclusive),
+	SBIUNIT_TEST_CASE(read_trylock_writer_waiting),
 	SBIUNIT_END_CASE,
 };
 

base-commit: ed70256dd22c09962d146e433834239825ef0616
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
