Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF2606A321
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yb9vkXvS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Va2XebU0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=55Pn7XVZtk1IVUdWexjYSkexk+RSMOf7MqiK78ZqsFE=; b=Yb9vkXvSKL5UvjGXt4c9A6pV28
	Y1KdBYuZhWA6ApjbJOK2hzw7YZRd7H8Zmx0/9anIe01qbPTBPNZqf2cEyYjpwIUzrJOi7IjW3NaLb
	NxUox+SqbrJL/4l4JrDgEz7eWYCgrBS4GD9j3DYUyhKQCfQuJDiolAUR1zjfw80ihX5AF/Ht64+0H
	tAMTBslQACYHTIHksv8HlBm60zYw58Nv69sz8o9H5nYaG83V5mCig8FjhhI6jF1GHwiXOxTUw9PID
	2iTGRDQ9EzEkeZfgkIQuET2qDhxAqTHHFjJI5vDWq/8NIBILSqquWtRLAwIRJ793BgU3S7gPBzG+S
	3o4wjkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsu3-00000007211-2tBV;
	Tue, 24 Nov 2026 15:57:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssg-000000070iq-0gRi
	for opensbi@bombadil.infradead.org;
	Tue, 24 Nov 2026 15:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zaUoqSC5c5Fzj/SN2JvyM/HpsSbTBwq4Yy8gYW7AHG0=; b=Va2XebU0N8HR2MREXjFhgiaoz2
	dzETaNwfzTVzP+3Lb9t/N6r+ZXf0IfyTJXMSxH0UIqzPlYNqrns0WaTZQoU/ObvndTcZqaxzO6cd/
	1lYXzCajKbkD+qPIU+L0ANrYaGcOE+DlCyNIFPHDQFZJ8814sRy5mTVJDUkm2qkc4099pY0AXSQp5
	sLhabivq2F5PsxnJ6q5QGB5FmDrRRI1o26eBtMSUJpXdgjLoQaKVSxh8EnTWWcnPq0UpYRgICwdpn
	IdMLLyyOKeNvkyAklDvPPy2N6KT2iOyGWOtnXEEodbvF883MlRCbMMk3rUlV6SGFNqqiPAdtBYK5T
	QEtrCVKQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssc-00000004IuE-0lMM
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 15:56:28 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADHYrieswVr1Q3YAQ--.7609S2;
	Tue, 24 Nov 2026 23:56:14 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: heinrich.schuchardt@canonical.com
Cc: pengpeng@iscas.ac.cn,
	himanshu.chauhan@oss.qualcomm.com,
	atishp@atishpatra.org,
	anup@brainfault.org,
	opensbi@lists.infradead.org,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH 3/7] lib: sbi: dbtr: check the whole shared memory range in SETUP_SHMEM
Date: Tue, 24 Nov 2026 15:55:58 +0000
Message-Id: <20261124155558.3260520-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8e42c97a-11d1-4ab2-8ecb-3624b56ee944@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com> <20261120231119.90214-4-heinrich.schuchardt@canonical.com> <awP13Tc5cpXdRJIy@hu-himchau-blr.qualcomm.com> <8e42c97a-11d1-4ab2-8ecb-3624b56ee944@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADHYrieswVr1Q3YAQ--.7609S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1xCF1rCry5AFWrCrW3Jrb_yoW3Wrb_GF
	y0vFykGas0qF4xWa10kr40vry7KayDuwnxJrnrZr4Sg343JFWkX3s8XrnY9F4xKw48KFWD
	Kw4vgrZIkFy7ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1pnQUUUUU
	U==
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_155626_536033_075BB2B0 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 10:48, Heinrich Schuchardt wrote:
> I wonder why Pengpeng's patch was not merged.

It has Himanshu's Reviewed-by from 3 September, and I withdrew my own
competing patch on 9 September. It was not applied after that.

Its second hunk has since been overtaken. That hunk added

	if (trig_count >= hs->total_trigs)
		return SBI_ERR_BAD_RANGE;

to install_trig, following the >= in the error tables of DBTR 19.4 and
19.5; Pengpeng noted in the patch that the surrounding prose disagrees
with those tables. ed70256dd22c ("lib: sbi: fix trigger
read/update/install range check") took the other reading and uses > in
read, install and update.

So the setup_shmem hunk is what is left, and that is your 3/7. Please
add a Link: to Pengpeng's patch.

liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
