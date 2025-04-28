Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F538C369D5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uDH/kI59Vg2rHGquRnzmZ4KPjDHk8Jvcynvj0gMiFQ=; b=uuRju8yOWCXL6c
	puhaRTr18HitU1zA3+pzkvwVD5AJUml29gf9D1cO81BlpQtE+yKBahofTQnOnunOgcIjfApVkOxGn
	yv8KNQ2F4XT6zo8Vdw7AX4/iOSfOc43Ngw+UaDBtGQFlvi7aAw4BiL6VU1SQ8AmISORrpPIKu7uA6
	ecIF+cSPpT94HxfS9Nx7sQ1dRzYZNi6nb9xDf6Wt5hwV0UEDbCZHxcczj/pnZpXOLaRjyzCflcHko
	SUDPm6q8Ymcpk9SRdoeNRmFNJX3alXkOZ6N2fGu+kgiQalrORCTBmC4v+BQ2omEtggfBgkzTd1YZ4
	8V3wazxlOXrF5u1T+pDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OCg-00000006N8D-14so;
	Mon, 28 Apr 2025 13:07:22 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nkd-00000006Djw-3dPr
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:38:25 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3d812103686so12617215ab.0
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843903; x=1746448703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62ppekoiwRaLohs5bYjnJ5xGl83go9RVO+ts/iAlb8M=;
        b=f49kP+i1JnhAk/dT+iqWnmW8D0nERtg1NQ3EmlxR3JTB758eZWwwXPyisQ3BmSyJNv
         dJAYa5BffwBnma3y8JkbpysXU/q4r91aodxUWLvsxPkssIB69c31acW3AnH1lT7sgvb6
         Y4QWJPVJSCNyn2Wob6XFgQbPHDPDFdQjRry/KtOBuxHh/TRnlT/JQ4jUn5MCku6jJPrz
         J472+1kHcHpXXNoiuKB3fwo4LjWomXT/OR2shzL2AALOTpkyqe8oN3gV3Or5TqyTxm6R
         3vbnzwOG86bIqwWESmRh8A1/E6jxpGxIT/17ockG29xE/20KaKA964CLd969DBsLvENg
         xDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843903; x=1746448703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62ppekoiwRaLohs5bYjnJ5xGl83go9RVO+ts/iAlb8M=;
        b=j4gbDR1j/DaPPlU5BIcefKUzDpnrzuUa30AT7gL131v+E0MyWcvl9LLvrGEiUfhqNU
         KkM+b7bjBEZ276Nqjw272EFr5+7SXmICOcJaFC+6S5vk94pXsdvE0ES1BvDOnz2KcNpx
         WmRu1w58JMfDz2joOtbnM6tiYeS9gdgTTs1OSptjIAXGNtnerqoXUKDaoSgdU/xLoL2B
         oY8tA3NAuE8mSL+ur/bAOYooWbimnnMzAJfJolJw4Pb/feAigRRoeGZl8Y3EX6N6ns1a
         Pbs/EChs6M9PG/Bm/cGHoD1IzwuEh/DPwMbRop0PV/X6gXnE/C5Vnw8ykA5t+thHxOl6
         4zRA==
X-Gm-Message-State: AOJu0YzA+h0QazrJbFdK7fYeyRqWdARxR2Z7ujqxpmAhd6mShfljdoKV
	HM/rgKlS3BYJIFd6iUsvD1B0s3QSIDaJIULBDdtL69g/Kln/BrlMIzk6yDrE6euEarE3XtB7Y/b
	ZON4HlIvHt2UrRtsSOYoqmlw4mS7iYF8HK9yjyg==
X-Gm-Gg: ASbGncuAlXEw4MNRkorBNV2FCGBrAQEid+nSpSifKWhRT9Y2OqYR2XRn3G3anlIjSsx
	kpItbFOzIpm6wZibVrfU9hd5R2RbLFDloH6z+vnf+r6squsTOwZf+ilIDVRYlNj2zcjZLdugrEp
	oAJRucQX+lc/NKlCt9hqVbbqU=
X-Google-Smtp-Source: AGHT+IEO4SaQwNstrL8RKVzU+zLP3HIrMm4WxIAHZf4nS8uRZPeom/MWongT46mwz2u5DQje8lsh30dliH7DojScxUc=
X-Received: by 2002:a05:6e02:1488:b0:3d3:fa69:6755 with SMTP id
 e9e14a558f8ab-3d93b845774mr108168315ab.5.1745843902848; Mon, 28 Apr 2025
 05:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-9-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-9-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 18:08:12 +0530
X-Gm-Features: ATxdqUEga5UlJk0VPeuemuQno3FIrvkp3eUunCtb2K_kX4Dj-vm6vVBMtd8GZ2U
Message-ID: <CAAhSdy0_3DrkKWTcA57KDmCgEWV+1Be2hkh8LxrnyO_RXSjzog@mail.gmail.com>
Subject: Re: [PATCH 7/8] lib: sbi_hart: add Ssstateen extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053823_913197_B97DDC52 
X-CRM114-Status: GOOD (  17.15  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlIGFscmVhZHkgZGV0ZWN0IFNtc3RhdGVl
biwgYnV0IFNzc3RhdGVlbiBleGlzdHMgYXMgd2VsbCBhbmQgaXQgZG9lc24ndAo+IGhhdmUgdGhl
IE0tc3RhdGUgQ1NScy4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oIHwgNCAr
KystCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3NiaS9zYmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IGluZGV4IGMzYTdmZWI3
NTNkOS4uMTBkMGNmNDQ3YmE2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgK
PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gQEAgLTMxLDcgKzMxLDcgQEAgZW51bSBz
YmlfaGFydF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9TTUFJQSA9IDAsCj4g
ICAgICAgICAvKiogSEFSVCBoYXMgU21lcG1wICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfU01F
UE1QLAo+IC0gICAgICAgLyoqIEhBUlQgaGFzIFNtc3RhdGVlbiBDU1IgKiovCj4gKyAgICAgICAv
KiogSEFSVCBoYXMgbXN0YXRlZW4qLCBzc3RhdGVlbiosIGFuZCBoc3RhdGVlbiogQ1NScyAqKi8K
CkxldCdzIG5vdCBkZWZpbmUgd2hhdCBTbXN0YXRlZW4gbWVhbnMgaGVyZS4KClNtc3RhdGVlbiBp
bXBsaWVzIG9ubHkgbXN0YXRlZW4gQ1NScyB3aGVyZWFzClNzdGF0ZWVlbiBpbXBsaWVzIFtofHNd
c3RhdGVlbiBDU1JzLgoKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9TTVNUQVRFRU4sCj4gICAgICAg
ICAvKiogSGFydCBoYXMgU3Njb2ZwbXQgZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9F
WFRfU1NDT0ZQTUYsCj4gQEAgLTc5LDYgKzc5LDggQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25z
IHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9TTUNUUiwKPiAgICAgICAgIC8qKiBIQVJUIGhhcyBD
VFIgUy1tb2RlIENTUnMgKi8KPiAgICAgICAgIFNCSV9IQVJUX0VYVF9TU0NUUiwKPiArICAgICAg
IC8qKiBIQVJUIGhhcyBzc3RhdGVlbiogYW5kIGhzdGF0ZWVuKiBDU1JzICoqLwoKU2FtZSBhcyBh
Ym92ZS4gTGV0cyBqdXN0IHNheSAiSEFSVCBoYXMgU3N0YXRlZW4gZXh0ZW5zaW9uIi4KCj4gKyAg
ICAgICBTQklfSEFSVF9FWFRfU1NTVEFURUVOLAo+Cj4gICAgICAgICAvKiogTWF4aW11bSBpbmRl
eCBvZiBIYXJ0IGV4dGVuc2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX01BWCwKPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXgg
NTY5ZjgwMDhiNTIzLi5iYzBhNzNkMTI5OGQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFy
dC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAgLTY5NSw2ICs2OTUsNyBAQCBjb25z
dCBzdHJ1Y3Qgc2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRfZXh0W10gPSB7Cj4gICAgICAgICBf
X1NCSV9IQVJUX0VYVF9EQVRBKHNzZGJsdHJwLCBTQklfSEFSVF9FWFRfU1NEQkxUUlApLAo+ICAg
ICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbWN0ciwgU0JJX0hBUlRfRVhUX1NNQ1RSKSwKPiAg
ICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NjdHIsIFNCSV9IQVJUX0VYVF9TU0NUUiksCj4g
KyAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNzc3RhdGVlbiwgU0JJX0hBUlRfRVhUX1NTU1RB
VEVFTiksCj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJh
eV9zaXplKHNiaV9oYXJ0X2V4dCksCj4gQEAgLTkzNiw2ICs5MzcsOSBAQCBfX3BtcF9za2lwOgo+
ICAgICAgICAgLyogRGV0ZWN0IGlmIGhhcnQgc3VwcG9ydHMgbXN0YXRlZW4gQ1NScyAqLwo+ICAg
ICAgICAgX19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgQ1NSX01TVEFURUVOMCwgU0JJX0hBUlRfRVhUX1NNU1RBVEVFTik7Cj4g
KyAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBzc3RhdGVlbiBDU1JzICovCj4gKyAg
ICAgICBfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfMV8xMiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICBDU1JfU1NUQVRFRU4wLCBTQklfSEFSVF9FWFRfU1NTVEFURUVOKTsKPiAg
ICAgICAgIC8qIERldGVjdCBpZiBoYXJ0IHN1cHBvcnRzIHNtY250cnBtZiAqLwo+ICAgICAgICAg
X19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgQ1NSX01DWUNMRUNGRywgU0JJX0hBUlRfRVhUX1NNQ05UUlBNRik7Cj4gLS0KPiAy
LjQ4LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQoKT3RoZXJ3aXNlLCBMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
