Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A735606A31B
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lV+cZY9k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3EYOG+VxsWB05Q/KYpbVzlkuFke/5ZTRNZx9E6QL0gM=; b=lV+cZY9kQUkri0n16XJH3SZDHn
	f8TmNhp2WSXRzJSZzI/IsN2jAWlEzyzAyncOboE4R5e7KkyPO8Y7UdgKa8rvlhqJk54E/z7t3kmoV
	wS0mmKqbz4j2tR542t5a5s//vrxGxqiva0CFtO3lG5Spa+1dp4/bLV+r6iBMc4JyV0f/Gcg5HWc8B
	b2+fHUkYHkZ/k2gSPBIe2KRLohVAC0UawPeUBRJks4nrEljVRXfERTG9p+2APJO3W9dE/EU2fTcQJ
	c9o1p8gypot7/Go86C1X3KluLdda4CQhEE3CaEMu4Mfey6CuopTb7w3SZwhFRg17WFwFVAXSVqWlT
	GlHqMw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDuZ-00000001mQD-3seA;
	Mon, 26 Oct 2026 06:10:23 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDuV-00000001mPq-46Dq
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 06:10:22 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAX6u3G7t5qpyC8Cw--.46901S2;
	Mon, 26 Oct 2026 14:10:14 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH v3 4/4] lib: sbi_mpxy: fix integer overflow in attribute range endpoint
Date: Mon, 26 Oct 2026 06:10:04 +0000
Message-Id: <20261026061004.2955544-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy15MDJB09AUCuMuG1xtPxAyJUHtM5jDcquZ3t_2PvGMOA@mail.gmail.com>
References: <20260910052629.3359493-1-liutong@iscas.ac.cn> <CAAhSdy15MDJB09AUCuMuG1xtPxAyJUHtM5jDcquZ3t_2PvGMOA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAX6u3G7t5qpyC8Cw--.46901S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF17XFWrWryxKw4fGr17ZFb_yoWktFg_ur
	4Fgwn8Ka1UKFWqqasxtw1YkFs5Grs2yas8XwnYqF17ZryqyFy0qa1Iy3s5ArnrJasFy3Z5
	Gwn3WrWxuwnIyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFNVyUUUUU
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_231020_387474_EBFC04BA 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anup,

Thanks for applying these. Before this one goes out, please hold it -
as sent it does not actually fix the overflow.

Widening end_id is not enough. base_attr_id and attr_count are both
u32, so

	end_id = base_attr_id + attr_count - 1;

is evaluated in 32-bit arithmetic and wraps there; the already-wrapped
result is then widened on assignment. With base_attr_id = 0xffffffff
and attr_count = 2 the expression still yields 0, and the msgproto
range check still passes.

	u64 end_id = base + cnt - 1       -> 0x0
	u64 end_id = (u64)base + cnt - 1  -> 0x100000000

The fix is a cast at both sites, lines 500 and 653:

	-	end_id = base_attr_id + attr_count - 1;
	+	end_id = (u64)base_attr_id + attr_count - 1;

I checked that the wider value cannot escape into an index or a loop
bound. In write_attrs() the two loops over attr_id are only reached
after end_id >= SBI_MPXY_ATTR_STD_ATTR_MAX_IDX has been rejected, and
the msgproto branch passes base_attr_id and attr_count to the driver
rather than end_id. read_attrs() has no loop over it.

Happy to send this as a follow-up patch, or you can fold it in with the
2/4 comments, whichever suits you. Sorry for not catching it before
sending.

Regards,
liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
