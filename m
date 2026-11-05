Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77860606A32D
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Esvj06BS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGugjUh1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MK4Z+ljnhDPlrWn7ZwSMaKJX3+7vgE7DUey/FptXPZ4=; b=Esvj06BSttqdaS2B6QJy5G/4pY
	mSZ4Dr6ijHuTHILW/BPf7quGnSeRMhgJN1mVvFQxYh63ECB/SL3TkR/hoqcSQHanMVuwSgu1PzgPN
	Bmf+Cfza8uW/tGe/jehhXJJyBCaJO6cQr6O2m/QfChlpg3y5aF7tQXQ5JeFEgXIgjfwEA8pKtU3hH
	edvGKrnxJKbNPdZpoeod+Nag5O6XY/V+8pnnaK45b8HZh8V+Xrp61Rhwjx8DhZ/8LILZqxm3OvoJw
	Jjmc8oH0uvhBCABNLfIWaBOTs8V5x6c0R0wH8VHESucXcfhTaAwtS/pWqKhSMphizo1ey7RjxMPV7
	qylr84VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKR-00000007o5J-29mY;
	Thu, 05 Nov 2026 04:43:59 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKM-00000007o0o-2hhd
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:56 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36a1947498bso3929963eec.1
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853834; x=1794458634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dditCIhyY75lL209BXk3ThJr4jNjAnLNXEGLjatCrA=;
        b=SGugjUh1LXmOu42gR1nDxYBoq8S38/KnnWTlDf2qj3FjwJ5dJpbAEsK0E79/4KS8O2
         VXIoSeKKi+YsaRBycpNtvb8pkv1w6xNQ/HHDeNja5im6cnaK6ARv29m6LiIkpgceKj31
         3Hy0EYMR/ZlXgM/6CATYaQc4w1bsjhERRNFzLVQKiVuv4rbFaxnPp0Sm97D1Yf4A5Tzy
         lWUUv280awlK0zHLLl7mjBprBv8b+CSZd1cqNWTAYINUwUqIbU9wkz2A3EVXBWwyt1wQ
         INSYE7/s2snjtJVB19rBj1YrRKZNAWNv87u+2CoUdcz4sT2tWSgvuMJAB9CtOCrS/hkN
         E0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853834; x=1794458634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9dditCIhyY75lL209BXk3ThJr4jNjAnLNXEGLjatCrA=;
        b=dwiNZdcC7HLUbePItKroCIZ+vZr0j8cVN+SiZiP5nZjUaG00R4VtWGgfkeLY8RDyuL
         GjXMnWQtPeDrVYwWWs/cLacX+I2e2/Kyp7PUHtRsOIyvpQ1Gjfvb4quIjMdUHdUkB7JQ
         Qga39HSv4jYgrg+mNrDTx5RxxMWEL9tFtoGqP7nsSNxo05A6e8QrQ8ua35S5feCCmhgS
         cAdhh1MS77ndlP7pM2iBZc7ykWb6N8mGWkcC6yCxqZwRwYNBe4Sac67Aq5Ljsi6nFKAM
         XGMCx+cQBqGYR6FVMhCSsAw96xN/SgV+cSJ2egP43/4Y07g/Sx9X6DWm7L6scNzC5hCT
         P1Yg==
X-Gm-Message-State: APuU4Z+Yq9pvCvJixenNpL1TKOIEhJv0feztNSv9M+YOxayVEpB8RYhQ
	mEWUQG21CEQIpUVkfHqcOfuoSGOpp7uR6uzfnAVAt3DqLlwdeYliiV/nrc0SYHv3
X-Gm-Gg: AYBFou0fza9UT4xc6cIcWAfRvR36pRa/Ex3DZHx0W3Im7QR9Y7+JA4PkkVgaJD0osEf
	V7xN6aXBBBmH04IfP6A4xOiVv3RCCseDEGT3KlLasog++K7EKNPHGPQC7a7FDUdAknaPd6ZhXmC
	9DFjVe8CcT/4N/sxmO92/mBK0EL4q8Kq55SbfTIGE9eUz10ef1j+ClMzyHnIXdOUE2fs9SwtNz8
	2Y5Z0V5QKkKNJ3WUohBBlfOaP0+Q2h32nPjjbn9Langep+9QLRRu0sKVe8c36edG0wJeMUQWNGa
	D3/gGuSEQsHrnvCgc+DnjohctEZCFTjaQE1SciTgIt2i+44mYZQds2k8lbiFRirC8VjWPecz8gY
	NDx9i6SqrOkU0v1jIa3MMZ+hkON6/LXrkOsBfWB3ohpysw2U9SowtSoOyNF22whUhCVlrESXd5J
	3s7A6hI6C7K6TaU6tdF39YAyzvcyVeosFf+FBF/p9RRV/9Y1Gjnoq0xLBr5WK8KzsSflFe4Mkfb
	rAacFu59yZMO2FO7N16WXUDIRcoV47NVmgUjXuYsCjNXJH5c+eCDLgdQg8tKvMbQ1PZuVX9x3A7
	JbPnQUO7Os6q/c2xpl+Q4UlCUOtSUmjq8O1D294PNnKT/AcPDN6EC+XXIsCTzYet9Pa4cEAXVXq
	+dpqaJShkwYYexOoPbbP1K/5PBmGf0Z2F9mHbGWFsABashAUF4rmx
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr16156604eec.17.1793853833499;
        Wed, 04 Nov 2026 20:43:53 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:52 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 6/6] lib: sbi: Preserve vl and vtype during domain switches
Date: Wed,  4 Nov 2026 21:43:39 -0700
Message-ID: <20261105044339.435711-7-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204354_714104_480C31E6 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Save vl and vtype as part of the Vector domain context.

Restore both CSRs using vsetvl after restoring the Vector register
file. Restore vstart after vsetvl because Vector configuration
instructions reset vstart.

Link: https://github.com/riscv-software-src/opensbi/issues/434
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 include/sbi/sbi_vector.h |  2 ++
 lib/sbi/sbi_vector.c     | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index c14f3174..480f9ac3 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -15,6 +15,8 @@
 struct sbi_vector_context {
 	unsigned long vcsr;
 	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
 
 	/* size depends on VLEN */
 	uint8_t vregs[];
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
index 1f9e01cf..53c2e5a7 100644
--- a/lib/sbi/sbi_vector.c
+++ b/lib/sbi/sbi_vector.c
@@ -33,6 +33,8 @@ void sbi_vector_save(struct sbi_vector_context *dst)
 	/* Step 2: Save CSRs */
 	dst->vcsr = csr_read(vcsr);
 	dst->vstart = csr_read(vstart);
+	dst->vl = csr_read(vl);
+	dst->vtype = csr_read(vtype);
 
 	/* Step 3: Save vector registers */
 #define SAVE_VREG(i)							\
@@ -86,6 +88,15 @@ void sbi_vector_restore(const struct sbi_vector_context *src)
 
 	/* Step 3: Restore CSR's last */
 	/* Restore CSRs first */
+	asm volatile(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvl zero, %0, %1\n\t"
+		".option pop\n\t"
+		:
+		: "r"(src->vl), "r"(src->vtype)
+		: "memory");
+
 	csr_write(vcsr,   src->vcsr);
 	csr_write(vstart, src->vstart);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
