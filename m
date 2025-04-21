Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B37C369AB
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5bfDne47kvS+m357Z1zgPHbn/L1lmBHNUBvkZbSNNKc=; b=mpi7iYJ1NbHJv6
	VqzfL21gSvzhiTsG2BnMl5EJyJ3t+gcFBFw8DAq1uZGTSVvoHGT9NMZd3HleLi8DpiLi4H+jZN4lr
	WO7XezBO+5b6/N6SOWo/Gca/baUGKufa5wN1i6C/mE+2+6/oXtoMJfKB/rYUwjm5N2YZIyybuYwYg
	gewELyDJOvmjnL3HRiiQcgh8JDoq40+EKJ0fPNotoGj0e64fuKWjvvO7nkfUYhrNBIG10bYraK/EF
	hhSpCcaGDtFHSa59LvEDEGJpx7i+ALvcIk+DE2kwvFbLre5ytJcVnWBt4wXAbBXrrE0qtmaPL3SML
	7crqFyu/FIn2PTS0DTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6qYr-00000004I7U-1nnC;
	Mon, 21 Apr 2025 12:47:45 +0000
Received: from m.syntacore.com ([178.249.69.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6qYn-00000004I6f-3tLy
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 12:47:43 +0000
Received: from pmg.syntacore.com (localhost.localdomain [127.0.0.1])
	by m.syntacore.com (Proxmox) with ESMTP id 622C8B41C98
	for <opensbi@lists.infradead.org>; Mon, 21 Apr 2025 15:47:39 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:from:from:message-id:mime-version:reply-to:subject:subject
	:to:to; s=m; bh=HzIsBnhhB+9QjP9NkkdZEf9jV+uIQ8AX1Qvy7iJkIz8=; b=
	GDzSJuW1jwFJTNBTRoiuVMVB+I0iJ9hQeDHzxog4UiM8/WA9IbC+la3xCiNpAF6f
	pUmK/7Vle9v/PA5hWN0kYxpqonAs4sDkyw3Y5velmGA65PvsWTvpY7t6m53odru4
	YxyYpMyVS/ArSAaZ8EKiWKTMa4tKwDwAaaE0/BI2Fsqh7guTqJKKIDcbccSgehQz
	LhqrifMbAqSteYbr/x0VNP6VVxi3cTcuaT5UlL4gQJoKKZhmM4ynhrDmMXWofReC
	n8JekIrvkdK/AGwnidjC5dMLscWr9Dqq1rmpvLcSuM/ws6smaJFuMKoPk5IsvdDY
	ZnX8Gmf0TL17M/TgEA9TkQ==
Received: from S-SC-EXCH-01.corp.syntacore.com (exchange.syntacore.com [10.76.202.20])
	by m.syntacore.com (Proxmox) with ESMTPS id 44E1AB41BF3
	for <opensbi@lists.infradead.org>; Mon, 21 Apr 2025 15:47:39 +0300 (MSK)
Received: from ouran.high.school.host.club (172.17.15.172) by
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Apr 2025 15:46:16 +0300
From: Parshintsev Anatoly <anatoly.parshintsev@syntacore.com>
To: <opensbi@lists.infradead.org>
CC: Parshintsev Anatoly <anatoly.parshintsev@syntacore.com>
Subject: [PATCH] fix missing .debug_frame DWARF section if gcc-based toolchain is used
Date: Mon, 21 Apr 2025 15:47:29 +0300
Message-ID: <20250421124729.36364-1-anatoly.parshintsev@syntacore.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [172.17.15.172]
X-ClientProxiedBy: S-SC-EXCH-01.corp.syntacore.com (10.76.202.20) To
 S-SC-EXCH-01.corp.syntacore.com (10.76.202.20)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_054742_133617_74092D93 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

V2hlbiBPcGVuU0JJIGlzIGJ1aWx0IHdpdGggYSByZWxhdGl2ZWx5IG5ldyBjb21waWxlciAoZ2Nj
LTEzIGFuZCBncmVhdGVyKQpJIG9ic2VydmVkIHRoYXQgR0RCIGlzIHVuYWJsZSB0byBwcm9kdWNl
IHByb3BlciBiYWNrdHJhY2VzIGFuZCBzb21lCnZhcmlhYmxlIHZhbHVlcyBhcHBlYXIgY29ycnVw
dGVkIChldmVuIGlmIHRoZSBhc3NvY2lhdGVkIERXQVJGCmxvY2F0aW9uIGRlc2NyaXB0b3IgaXMg
Y29ycmVjdCkuCgpUdXJucyBvdXQgdGhhdCB0byBwcm9wZXJseSB3b3JrIHdpdGggZGVidWcgaW5m
b3JtYXRpb24sIGRlYnVnZ2VycyBvZnRlbgpuZWVkIHRvIHVud2luZCB0aGUgc3RhY2suIFRoZXkg
Z2VuZXJhbGx5IHJlbHkgb24gQ2FsbCBGcmFtZSBJbmZvcm1hdGlvbgooQ0ZJKSByZWNvcmRzIHBy
b3ZpZGVkIGJ5IHRoZSBjb21waWxlciB0byBmYWNpbGl0YXRlIHRoaXMgdGFzay4KQ3VycmVudGx5
LCB0aGUgR0NDIGNvbXBpbGVyIG9mZmVycyB0d28gbWVjaGFuaXNtczoKCi0gYC5kZWJ1Z19mcmFt
ZWAgc2VjdGlvbiAoYXMgZGVzY3JpYmVkIGluIHRoZSBEV0FSRiBzcGVjaWZpY2F0aW9uKS4KLSBg
LmVoX2ZyYW1lYCBzZWN0aW9ucyAoYXMgZGVzY3JpYmVkIGluIExTQiBkb2N1bWVudHMpLgoKVGhl
IGxhdHRlciAoYC5laF9mcmFtZWApIHN1cHBvcnRzIHN0YWNrIHVud2luZGluZyBhdCBydW50aW1l
LCBwcm92aWRpbmcKYSBmcmFtZXdvcmsgZm9yIEMrKyBleGNlcHRpb25zIG9yIGVuYWJsaW5nIGJh
Y2t0cmFjZSBnZW5lcmF0aW9uIHVzaW5nCmxpYnJhcmllcyBsaWtlIGxpYnVud2luZC4gSG93ZXZl
ciwgdGhlIGRvd25zaWRlIG9mIHRoaXMgYXBwcm9hY2ggaXMgdGhhdAp0aGVzZSBzZWN0aW9ucyBz
aG91bGQgYmUgcGFydCBvZiBsb2FkYWJsZSBzZWdtZW50cy4KClRoZSBmb3JtZXIgKGAuZGVidWdf
ZnJhbWVgKSBpcyBzaW1wbHkgYW4gb3JkaW5hcnkgZGVidWcgc2VjdGlvbi4KClN0YXJ0aW5nIGZy
b20gR0NDIDEzLCBMaW51eCB0YXJnZXRzIGVuYWJsZSB0aGUgYC1mYXN5bmNocm9ub3VzLXVud2lu
ZC10YWJsZXNgCmFuZCBgLWZ1bndpbmQtdGFibGVzYCBmbGFncyBieSBkZWZhdWx0LiBSZWxldmFu
dCBjb21taXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9nY2MtbWlycm9yL2djYy9jb21taXQvM2NkMDhm
NzE2OAoKV2hlbiB0aGVzZSBmbGFncyBhcmUgYWN0aXZlLCB0aGUgY29tcGlsZXIgZ2VuZXJhdGVz
IGAuZWhfZnJhbWVgIHNlY3Rpb25zCmluc3RlYWQgb2YgYC5kZWJ1Z19mcmFtZWAuIFNpbmNlIE9w
ZW5TQkkgaXMgYnVpbHQgdXNpbmcgdGhlICoqTGludXgKdG9vbGNoYWluKiosIHRoaXMgYmVoYXZp
b3IgYXBwbGllcyB0byBPcGVuU0JJIGFzIHdlbGwuCgpUaGUgcHJvYmxlbSBhcmlzZXMgYmVjYXVz
ZSB0aGUgU0JJIGJ1aWxkIHN5c3RlbSB1c2VzIGAtV2wsLS1nYy1zZWN0aW9uc2AsIHdoaWNoCmRp
c2NhcmRzIHRoZSBgLmVoX2ZyYW1lYCBzZWN0aW9uLgoKUG9zc2libGUgRml4ZXM6CgoxLiBFbmZv
cmNlIGAuZGVidWdfZnJhbWVgIGdlbmVyYXRpb24g4oCTIE1vZGlmeSBjb21waWxlciBmbGFncyB0
byBnZW5lcmF0ZQpgLmRlYnVnX2ZyYW1lYCBpbnN0ZWFkIG9mIGAuZWhfZnJhbWVgLgoyLiBQcmVz
ZXJ2ZSBgLmVoX2ZyYW1lYCBpbiB0aGUgbGlua2VyIHNjcmlwdCDigJMgQWRkIGBLRUVQKCooLmVo
X2ZyYW1lKSlgIHRvCmVuc3VyZSB0aGUgc2VjdGlvbiBpcyBub3QgZGlzY2FyZGVkLgoKSSBjaG9z
ZSBPcHRpb24gMSBiZWNhdXNlIGl0IGF2b2lkcyBhbnkgcnVudGltZSBvdmVyaGVhZC4KClNpZ25l
ZC1vZmYtYnk6IFBhcnNoaW50c2V2IEFuYXRvbHkgPGFuYXRvbHkucGFyc2hpbnRzZXZAc3ludGFj
b3JlLmNvbT4KLS0tCiBNYWtlZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQppbmRleCBlOTA4MzZjLi44NTc0
OGJjIDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtMzYyLDYgKzM2Miw3
IEBAIEdFTkZMQUdTCSs9CSQoZmlybXdhcmUtZ2VuZmxhZ3MteSkKIAogQ0ZMQUdTCQk9CS1nIC1X
YWxsIC1XZXJyb3IgLWZmcmVlc3RhbmRpbmcgLW5vc3RkbGliIC1mbm8tc3RhY2stcHJvdGVjdG9y
IC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25z
CiBDRkxBR1MJCSs9CS1mbm8tb21pdC1mcmFtZS1wb2ludGVyIC1mbm8tb3B0aW1pemUtc2libGlu
Zy1jYWxscworQ0ZMQUdTCQkrPQktZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIC1mbm8t
dW53aW5kLXRhYmxlcwogIyBPcHRpb25hbGx5IHN1cHBvcnRlZCBmbGFncwogaWZlcSAoJChDQ19T
VVBQT1JUX1ZFQ1RPUikseSkKIENGTEFHUwkJKz0JLURPUEVOU0JJX0NDX1NVUFBPUlRfVkVDVE9S
Ci0tIAoyLjQzLjAKCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
