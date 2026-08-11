Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F2C5AD55
	for <opensbi@archiver.kernel.org>; Tue, 11 Aug 2026 03:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:Subject:Cc:To:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7VVTVmNkSA/fvwY66r52JWrjG9TPFEKDyDgEIE3uNk=; b=StEOtcBREQ/aQ+
	ZLrVmxehuYw1FzIWWiJgx1G82mFjJRpdVNdCkhcFvc06WM3vOXsRJR4d9EqtR/gVvaZIOIspS9QzD
	QlT0vBJUBW2n+FJfG8m5euC50b7KAw8D0AhyGAaDN7DTfE+Lxczv+85LShLH2+uxGz4yBWyBivKp4
	F2ZYIVrzOqsa7ZOeFUmcA7OBqLQ9Xqn1s56OKS6O8khj7hNgFGSZb48OD4H56iZAnAa9PLlwLXQr8
	5tXmgGeycBAUgNcJf8PzhjfGXN/kEDwS20OXHJeKkEZQYon5SVU6tCU+CJtJ7VMVGcQCyGgGbrg+7
	EWXb5yf3jpvPdITGbULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtczj-0000000DCxL-0Ptp;
	Tue, 11 Aug 2026 03:17:39 +0000
Received: from va-2-18.ptr.blmpb.com ([209.127.231.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtczg-0000000DCwo-2XDp
	for opensbi@lists.infradead.org;
	Tue, 11 Aug 2026 03:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1786418250; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=O7xrCyskDlrouNekdnugQDP2SKbxD6x9rUMUPSlLtpY=;
 b=AEA0z/y6ycczoBvkX6oLzfyO5oNRAmV8M/0LpLZC4dD/eXap+E1NIUzuHokMr//CrIINQ9
 BSYTRVwxxYpZIoQVinAd+ljan1xq7FixhznKbvUtNx+VXeMQgjTHezDLQsJDHaGn+ePrZZ
 LNTeRaKWken4RH2xFjylbPADzU45ta0UUkbTR1O5t8zRLuDvfly1Ym9Uj0F8GYH+Y5qMsO
 e+oiZRO/genBbzfZpbkXo/oL0t7PiLcTxP9HHD447PxJSajo86QvmpTnTQAnbeRPz4VcLC
 Z4NYc++7TYtXTH0dSXc0Cm/PeBNgVf4HWLh8uzjyjCN6d1nwV6SPFYgfQelxBg==
From: "Huamao Wu" <huamao.wu@spacemit.com>
X-Lms-Return-Path: <lba+16a7a9448+0785d3+lists.infradead.org+huamao.wu@spacemit.com>
Date: Tue, 11 Aug 2026 11:17:27 +0800
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Cc: "anup@brainfault.org" <anup@brainfault.org>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>
Subject: [PATCH] lib: Fix MSTATUS_FS bit usage in sbi_fp_save()
Mime-Version: 1.0
Message-Id: <598191cd2102633b80b8890af6c8b3292fb76242.15545c56.8705.442f.b574.8164d38a1edb@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_201736_718923_9B95FA23 
X-CRM114-Status: GOOD (  11.07  )
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

VGhlIHNiaV9mcF9zYXZlKCkgZnVuY3Rpb24gaW5jb3JyZWN0bHkgdXNlcyBNU1RBVFVTX1ZTICgw
eDYwMCwgVmVjdG9yCmV4dGVuc2lvbiBzdGF0ZSkgaW5zdGVhZCBvZiBNU1RBVFVTX0ZTICgweDYw
MDAsIEZsb2F0aW5nLVBvaW50IGV4dGVuc2lvbgpzdGF0ZSkgd2hlbiBlbmFibGluZyBmbG9hdGlu
Zy1wb2ludCBpbnN0cnVjdGlvbnMgYmVmb3JlIHNhdmluZyBGUCByZWdpc3RlcnMuCgpUaGlzIGNh
dXNlcyBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIGV4Y2VwdGlvbiB3aGVuIGV4ZWN1dGluZyB0aGUg
Zmlyc3QgZnNkL2ZzdwppbnN0cnVjdGlvbiwgYmVjYXVzZSB0aGUgRlAgdW5pdCByZW1haW5zIGRp
c2FibGVkIChNU1RBVFVTLkZTPTApIHdoaWxlIHRoZQpjb2RlIGF0dGVtcHRzIHRvIGFjY2VzcyBG
UCByZWdpc3RlcnMuCgpUaGUgYnVnIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCA3MThlMWQxOTRm
NWEgKCJsaWI6IEFkZCBGUCBjb250ZXh0IHNhdmUvcmVzdG9yZQpzdXBwb3J0IiwgMjAyNi0wNS0x
OCkgYW5kIGFmZmVjdHMgT3BlblNCSSB2MS45IGFuZCBsYXRlciB2ZXJzaW9ucy4KClN5bXB0b20g
b2JzZXJ2ZWQgb24gYSBkZXZlbG9wbWVudCBwbGF0Zm9ybSB3aXRoIGR1YWwgNDAtaGFydCBSVkEy
MyBDUFVzIGFuZCBPUC1URUU6Ci0gRG9tYWluIGNvbnRleHQgc3dpdGNoIHRyaWdnZXJzIHNiaV9m
cF9zYXZlKCkKLSBGaXJzdCBmc2QgaW5zdHJ1Y3Rpb24gYXQgUEMgMHgyM2NlNCByYWlzZXMgaWxs
ZWdhbCBpbnN0cnVjdGlvbiB0cmFwCi0gU3lzdGVtIGZhaWxzIHRvIGVudGVyIE9QLVRFRSB0cnVz
dGVkIGRvbWFpbgoKVGhlIHNiaV9mcF9yZXN0b3JlKCkgZnVuY3Rpb24gaW4gdGhlIHNhbWUgZmls
ZSBjb3JyZWN0bHkgdXNlcyBNU1RBVFVTX0ZTCihsaW5lIDExMiksIGNvbmZpcm1pbmcgdGhpcyBp
cyBhIGNvcHktcGFzdGUgZXJyb3IuCgpGaXg6IENoYW5nZSBNU1RBVFVTX1ZTIHRvIE1TVEFUVVNf
RlMgaW4gc2JpX2ZwX3NhdmUoKS4KClNpZ25lZC1vZmYtYnk6IEh1YW1hbyBXdSA8aHVhbWFvLnd1
QHNwYWNlbWl0LmNvbT4KLS0tCsKgbGliL3NiaS9zYmlfZnAuYyB8IDIgKy0KwqAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvc2Jp
L3NiaV9mcC5jIGIvbGliL3NiaS9zYmlfZnAuYwppbmRleCBjODk0MTI1Mi4uMzhmYjdhMDEgMTAw
NjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2ZwLmMKKysrIGIvbGliL3NiaS9zYmlfZnAuYwpAQCAtMjAs
NyArMjAsNyBAQCB2b2lkIHNiaV9mcF9zYXZlKHN0cnVjdCBzYmlfZnBfY29udGV4dCAqZHN0KQrC
oMKgIMKgIMKgwqAgaWYgKCFkc3QpCsKgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCByZXR1cm47Cgot
IMKgIMKgIMKgIG1zdGF0dXNfb3JpZyA9IGNzcl9yZWFkX3NldChDU1JfTVNUQVRVUywgTVNUQVRV
U19WUyk7CisgwqAgwqAgwqAgbXN0YXR1c19vcmlnID0gY3NyX3JlYWRfc2V0KENTUl9NU1RBVFVT
LCBNU1RBVFVTX0ZTKTsKCsKgwqAgwqAgwqDCoCBhc20gdm9sYXRpbGUoCsKgI2lmIGRlZmluZWQo
X19yaXNjdl9kKQotLQoyLjQzLjAKDQoKVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudCBh
cmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2UgcHJvdGVj
dGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50
IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1lbnQgZnJv
bSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmVwbHkg
ZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1c2UsIGNvcHksIGRpc2Ns
b3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3NhZ2Ugb3IgYW55IGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBjYW5ub3QgYmUgZ3VhcmFu
dGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNhbiBiZSBpbnRlcmNlcHRl
ZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hvdWxkIHRha2UgZnVsbCBy
ZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuIAogCuacrOmCruS7tuWPiuWFtuS7
u+S9lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iDveWPl+WFtuS7luS/neaKpOaI
luS4jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumYgeS4i+ivr+aUtuWIsOacrOmC
ruS7tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7tueahOaWueW8j+mAmuefpeWP
keS7tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuS7jumYgeS4i+ezu+e7
n+S4reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmCruS7tuWGmeaYjuS5i+aUtuS7
tuS6uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaKq+mcsuacrOmCruS7tuaIluWF
tuS7u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7tuaIluWFtuS7u+S9leWGheWu
ueiAjOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaXoOazleS/neivgeaYr+S4gOen
jeWuieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmAmuS/oeaWueW8j++8jOWPr+iD
veS8muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wdj++8jOaUtuS7tuS6uumcgOiH
quihjOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAggotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
