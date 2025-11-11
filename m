Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEEECCF9E3
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDRAx38a8KC3qeVHM2mkXZdeAV/13xmZUAx9mZCNzak=; b=uDzVJUHBL18amr
	JPmUqiqmrHxz97n5iJlTILovlcOKG3RNpv42YzX05amY61bdmEBlyILqHN/df1D6Vovr8EuS+D8Sk
	ypGabQUWmtWf+/1pFsbD3MNaKdfj75wcopoHejF0D0pOIa799q8GHK0k40xL/ik5WAu/TFjy7BcAq
	Rvvdr1SdET1DU5chAdI4XPX70UUPLgRJmqxKlIGdfJUVkLw03zlERRtr8iZnpmp8WVR27cxdIZoVm
	b0WMcB4kNTKB2XaRLUP1Q1IfOoKWfQ4yW3nfCcOBoodN1EvygV4EJi5LBYz5I6hTMEc8ZE5SplHHH
	rpq0OuvQtK/IhCjaxMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqe-00000006ymE-2vi8;
	Tue, 11 Nov 2025 10:43:40 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqa-00000006ykN-41sa
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 10:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1762857816; x=1794393816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xeBJx7KIKugO7P7Lgs5GRxY+F/nUMYMDKEZ0zP82KPg=;
  b=QYW6lO4aDxGBnKd89EMQkCo+lgIkQYbeGcV50sB1Qt4eLzqDpShk+hJW
   kIJbOs8WqgPvlVcE83SlOD/xvik+9XnP82/LHg3trKsTppjmsDJafP3un
   2HWFJ4aB4HZjgJbcHYfv+vsRsWGu80xEbbTvVy9WUdRjXJv+CWsTfKOwi
   ZeTeeNufhZblvS/fnnxiQPXqQaOudkVVdCcy49/r8jDKGF38XxNY7w5W6
   3Tres3ZSjwpPXr5pMnbM8bvFiK4hAhpNQo4HqRvBo04Ck5gQULzcksgSu
   nPsYQTeBWYQVTv28R/4vEeJ4oH5iNm06BhCZVt0GS57OAchTlWUfsoDdn
   g==;
X-CSE-ConnectionGUID: 0ZXNx4VTRD+7WkcPoqqGpA==
X-CSE-MsgGUID: oVopZV21RsKO/UmsPbdJlQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 12:43:33 +0200
X-CSE-ConnectionGUID: H3IYugB6QteSfzZcC76pYg==
X-CSE-MsgGUID: mmLzkcD6ScGIn4s9C7ta7Q==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 11 Nov 2025 12:43:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 11 Nov 2025 12:43:31 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org,
	inochiama@outlook.com
Cc: vladimir.kondratiev@mobileye.com,
	opensbi@lists.infradead.org
Subject: [PATCH v2 0/2] Fix domain memory regions handling
Date: Tue, 11 Nov 2025 12:43:25 +0200
Message-ID: <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
References: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024337_470628_CB10D11E 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Patch 1 do a minimal fix for current sanitizing logic

Patch 2 removes static variable "root_memregs_count"

Vladimir Kondratiev (2):
  lib/sbi: fix covered regions handling in sanitize_domain()
  lib/sbi: get rid of static variable to hold root memregions count

 lib/sbi/sbi_domain.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
