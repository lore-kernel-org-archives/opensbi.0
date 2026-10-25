Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE7606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eaEcaIO9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=GpuYGBWe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eG2mexqNmyI/yLQFHtpTzJBR8IdLXDailyKRlhyiSRQ=; b=eaEcaIO9J31ZbXC/bcgRo596rb
	KcbY9ROMeQNUj9qsO15QfwntZHgj5EVf9QI1bPIrj4sMWShjgL/DfXkRL3eLEz2PFAiezHiFx6+kz
	lUP4j4F9dmoVHppX3DrG73Wj+c9basxtkUCrHICQCSUJXF0n41sCHiumKEiX96/0Ow224dJhoW/bc
	42luQSN7BgYQWOX7BxPlIOL7NOUhAaOgOsmmyG520mnlV1lFX3FPC+/OfzveiuNZXWqL24O76b5mw
	JqFJFgT3FMGpUbAyZiZgoPbLuCcSWVp5M3Oiyj3S6Qn3+7qknuUBh67Ol9whaJybH3Bh7a9282/+S
	LyUKrFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKuR9-00000000v8j-3690;
	Sun, 25 Oct 2026 09:22:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKuR6-00000000v8K-2jtp
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 09:22:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a210470b49so16440465e9.2
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 02:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792920158; cv=none;
        d=google.com; s=arc-20260327;
        b=Zcgc2Q5aMnAmVGiUbrPk51iamla8S7PdhEz6N5JwtPW/s/h/8LL4Ezuo6DL0Guu8cz
         bVdohji28zc1KvzSkS9eQPRm5EJUAscHI9WnO9lBMbXKiNVmahVhpTjLhajxHQ386jef
         QP9c/xjuj3iYhLuZethh320J7QFOLK5Yc7tgdL3BnmMeJ6Ix+o4Dv10NjxbxJZrMSVPp
         zb6dPn42KnFxAu0gCTvTuMoL7+y0vErz1DFh5Z6LG8X9jsARcmal8pTddbU0alNamTZ1
         fGVnYyKlcccbJrJ8uivicKLnBLVNi4FiSU9+tMR8GmEvGf/qwvFWjEnKxeQ6vhiSQ4QL
         5zaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0yziQOuJ2aTD+LP5780ToabP/RifoY1VR+kiaXLMB0=;
        fh=RUc66CAeXeOCL2EXc0mW8Sb1Z/QmCre7yCNudM6qEUw=;
        b=lZQLMdInTm9WJ9uNoSvAnNv33RRPvsBMe7w6/pBzRvZ07ZpQTa0YRE4veWfFhSUbCG
         hH09fLhOt2t+T++wnuKh0gLXhLms6WHYwO4ii9V8AkXYMc1p3MUFwWrseDIkIEQDPQmn
         qdYW6T4CIcIBFTgemPpYIJpazfdukn1h0t7dTCZi0gh92xokjRQZeAMplG+h0ZiRs8MR
         mVVnUVmk1hQm2HzSdrPCrNZDmzwgVUMUbnWvx2aInd5WftWfBVtyg+OoE6VfdlPiQrVN
         1ek9PmexsoYB/KcyOBvpUjXFAvn99ECvnoSdCFnMptRL7qQLNjC8R6XJJ7v+D7NtEGYb
         d4xA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792920158; x=1793524958; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0yziQOuJ2aTD+LP5780ToabP/RifoY1VR+kiaXLMB0=;
        b=GpuYGBWeM0t70VyPoaVUGqcDQRwrVtDMAWPQdGKSgo25H/TYLMaxx76k123dO8dng9
         I+es3SVqGfcg4BjMGVtZtkuz1mcuDGiX5UIkkHfqXcWArQu76dqOVvQw9o3Bn42R8hGb
         EQNNSs4DYtZkJDMVFEWawfRBh2iqr6YwdhPFAggWHn39/IkpNVbS4zGYwXoRy56jXhv0
         q5VM4U58Kf1Xwji23VJlPja+QVe3dKXYTDwuW1YL0uCyA6lEny9Y61aFNwsx720Hxar5
         46vCYYOgfxQuSUKYOcJw8DLDmpA6JbWazIjn/b8wiWm0uZBz8HP0kKzh2R8u9jIJPp+h
         gCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792920158; x=1793524958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0yziQOuJ2aTD+LP5780ToabP/RifoY1VR+kiaXLMB0=;
        b=0q32xPnzpz5pVm1gXjsWhi7QmFeYisATzUCuT9nA+uSVs1fozEY034fXSCyjuypQ7g
         1IZJPt2BY+l+m6fAXSBZ3HEAmLqYrAKicphvQIAABontSKrdut4Qp/7r/l5nXr+OZ/+Z
         tr6Kus5NOjKrqo3GtfcBaAzAcy+j52GttT3PB1fJW5ml6wo3+5aQ8J4r2onX77ApWBaU
         ouLXFeNsP0XCpGaz4aRyD9ZZLJWcqyF9gijQrUcCAyQEqqNtiYSK6LH1UcefG1PxI2UG
         bNKcEkuARWDA/uOT9vFTBHIGESD7Frg80zX7YUcJNWCim7LQDGOo0lVV6om6pw7O0S6Q
         6LlA==
X-Gm-Message-State: AFq9FYL0XGP/Lgge3NI/ZOHW9deRLKZftVR4YGo0vqLLKgs2U6gVWcmB
	PFaD9cxJp/uju9AJOn15SxRyvUmWcP5GWldwwuZWt2YYe4BgdtG6y9jE63ieaulakXR2kRa5sKZ
	v04J8af235F2/Nz+99Rkq+f3sanewfXkuxmZQUmYo4w==
X-Gm-Gg: AYBFou1vYKoFdxlWwFNlVIixBvzfH20Kd7bwiT5lq+V006M+QBwgV2ilpSZiVjvpHzo
	bm5eMwWx84ev3+DDVzanqxzvWrBOMN2kOpBMHJkQ7Ji9RU2MzS8NdY5h09dBETwLPpN1/3ZlmiZ
	guAD0/ULu3syGPV0M3JkecMe4qV+2h3yjdKREZTghxjlIcFrh60WKaXxBh9G3dpZPWHtxFQJM6p
	1M7MdTILDeqckFM2ixZejBOp+dC9rFPEUsP+LgjKMH7Q7r8PhF8exVhOYTgs2hcbMFwBYRU6IHp
	0l/CHH7Un7afmATvuAHk45AP3VGwKJwg0UaKZ17zcWGEvP8M56VLB+PdTr4a6P+ZHb6LG477+Sg
	ulmo8kp0iZi9zz8s3IMLDHjTm5El9MCmC5HGYrk99KEplk8nwH2405h3vT7/0/+YOdXnl80N0xq
	zQWQRm8+b7oPu6InwCq/9gStB/cD5ABzRdu4X68LVcY7nUiEsj/eN0kVCJwS3aNmOUHf5VvqCsT
	mGCEQ==
X-Received: by 2002:a05:600c:870f:b0:4a2:150f:1613 with SMTP id
 5b1f17b1804b1-4a35ac9983emr63115705e9.7.1792920158325; Sun, 25 Oct 2026
 02:22:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 14:52:27 +0530
X-Gm-Features: AclHuK_ABPjhsf8VwOBhi62VJjUElPBzYDrVTRw0AJ-mpqB9xoyZcigL0-penHI
Message-ID: <CAAhSdy387Gb6pJ12zeJwAJ1kvfShkY46sWv-D7At60dYk--q+w@mail.gmail.com>
Subject: Re: [PATCH 0/5] RPMI REQUEST_FORWARD service group in OpenSBI
To: marouene.boubakri@oss.nxp.com
Cc: opensbi@lists.infradead.org, ranbir.singh@oss.qualcomm.com, 
	sunilvl@oss.qualcomm.com, maroueneboubakri@gmail.com, 
	Marouene Boubakri <marouene.boubakri@nxp.com>, Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_022240_763248_A71D0B98 
X-CRM114-Status: GOOD (  29.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFyb3VlbmUgQm91YmFrcmksCgpPbiBNb24sIFNlcCA3LCAyMDI2IGF0IDU6MTXigK9QTSA8
bWFyb3VlbmUuYm91YmFrcmlAb3NzLm54cC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTWFyb3VlbmUg
Qm91YmFrcmkgPG1hcm91ZW5lLmJvdWJha3JpQG54cC5jb20+Cj4KPiBIaSBhbGwsCj4KPiBJIG1h
aW50YWluIHRoZSBSSVNDLVYgcG9ydCBvZiBPUC1URUUuIFdlIGFyZSBhZGRpbmcgTWFuYWdlbWVu
dCBNb2RlCj4gc3VwcG9ydCB0byBpdCBzbyB0aGF0IGEgbm9uLXNlY3VyZSBzdXBlcnZpc29yIGNh
biBpbnZva2UgTU0gc2VydmljZXMKPiBpbXBsZW1lbnRlZCBpbiBPUC1URUUsIGFuZCBSUE1JIGFs
cmVhZHkgZGVmaW5lcyB0aGUgaW50ZXJmYWNlIGZvciB0aGF0Ogo+IE1BTkFHRU1FTlRfTU9ERSAo
MHgwMDBCKSBvbiB0aGUgY2FsbGluZyBzaWRlLCBhbmQgUkVRVUVTVF9GT1JXQVJECj4gKDB4MDAw
RCkgb24gdGhlIHNpZGUgdGhhdCBzZXJ2ZXMgdGhlIGNhbGxzLgoKVmVyeSBoYXBweSB0byBzZWUg
dGhhdCBOWFAgd29ya2luZyB0b3dhcmRzIHN1cHBvcnRpbmcgT1AtVEVFIGZvciBSSVNDLVYuCgpP
emEgKFF1YWxjb21tKSBmcm9tIG91ciBzaWRlIGhhcyBhbHJlYWR5IGJlZW4gcG9zdGluZyBhIG1v
cmUgZ2VuZXJpYwpNUFhZIFJQTUkgYnJpZGdlIGRyaXZlciB3aXRoIG9uZSBkZXN0aW5hdGlvbiBN
UFhZIGNoYW5uZWwgZm9yIHRoZQpkb21haW4gaGFuZGxpbmcgZm9yd2FyZWQgUlBNSSByZXF1ZXN0
cyBhbmQgbXVsdGlwbGUgc291cmNlIE1QWFkKY2hhbm5lbHMgZm9yIGRvbWFpbnMgc2VuZGluZyBS
UE1JIHJlcXVlc3RzLiBUbyBzdGFydCB3aXRoLCBPemEncyBzZXJpZXMKY3VycmVudGx5IHN1cHBv
cnQgTUFOQUdFTUVOVF9NT0RFIHNvdXJjZSBjaGFubmVscyBidXQgaGUgYWxzbwpoYXMgd29yay1p
bi1wcm9ncmVzcyBzZXJpZXMgdG8gc3VwcG9ydCB1cGNvbWluZyBURUUgc291cmNlIGNoYW5uZWxz
LgoKKFBsZWFzZSBub3RlIHRoZSBSUE1JIFRFRSBzZXJ2aWNlIGdyb3VwIGlzIGFscmVhZHkgYXZh
aWxhYmxlIGluIHRoZQpsYXRlc3QgUlBNSSB2Mi4wIGRyYWZ0KQoKPgo+IFRoZSBwaWVjZSBpbiBi
ZXR3ZWVuIGlzIG1pc3NpbmcuIE9wZW5TQkkgc2VydmVzIE1BTkFHRU1FTlRfTU9ERSB0b2RheQo+
IG9ubHkgYnkgcGFzc2luZyBNTV9DT01NVU5JQ0FURSB0byBhIHBsYXRmb3JtIG1pY3JvY29udHJv
bGxlciBvdmVyIGFuIFJQTUkKPiBtYWlsYm94IChsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
X21tLmMpLCBhbmQgdGhlcmUgaXMgbm8KPiBSRVFVRVNUX0ZPUldBUkQgc3VwcG9ydCBhdCBhbGwu
IFdoZW4gTWFuYWdlbWVudCBNb2RlIHJ1bnMgaW4gc29mdHdhcmUgb24KPiB0aGUgYXBwbGljYXRp
b24gcHJvY2Vzc29yIHRoZXJlIGlzIG5vIG1haWxib3ggYW5kIG5vIG1pY3JvY29udHJvbGxlciwg
YW5kCj4gdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBpdHNlbGYgaGFzIHRvIGJlIHRoZSBmb3J3YXJk
ZXIuIFRoZSBPUC1URUUgc2lkZQo+IGNhbm5vdCBwcm9jZWVkIHVudGlsIHRoYXQgZXhpc3RzIHVw
c3RyZWFtLCB3aGljaCBpcyB3aGF0IHRoaXMgc2VyaWVzCj4gYWRkcy4KClJQTUkgTUFOQUdFTUVO
VF9NT0RFIGlzIG9ubHkgYSBzdG9wLWdhcCBwcm90b2NvbCBmb3IgVEVFIGNvbW11bmljYXRpb24K
c2luY2UgaXQgaXMgdmVyeSBzaW1wbGUgYW5kIG5vdCBkZXNpZ25lZCBmb3IgYWR2YW5jZSBURUUg
Y29tbXVuaWNhdGlvbiB3aGljaApzdXBwb3J0IG1lbW9yeSBzaGFyaW5nIGFuZCBzaWduYWxsaW5n
LgoKPgo+IFRoZSBSUE1JIHYxLjAgc3BlY2lmaWNhdGlvbiBjYWxscyBvdXQgdGhpcyBleGFjdCBh
cnJhbmdlbWVudCBpbiB0aGUKPiBSRVFVRVNUX0ZPUldBUkQgc2VydmljZSBncm91cDogIlRoaXMg
c2VydmljZSBncm91cCBhbHNvIGFsbG93cyBhbiBTQkkKPiBpbXBsZW1lbnRhdGlvbiB0byBmb3J3
YXJkIFJQTUkgcmVxdWVzdCBtZXNzYWdlcyBmcm9tIG9uZSBzeXN0ZW0tbGV2ZWwKPiBwYXJ0aXRp
b24gKG9yIGRvbWFpbikgdG8gYW5vdGhlciB1c2luZyB0aGUgU0JJIE1QWFkgZXh0ZW5zaW9uLiIK
Pgo+IEhvdyBpdCB3b3JrczogYW4gUlBNSSByZXF1ZXN0IHRoYXQgYXJyaXZlcyBvbiBvbmUgTVBY
WSBjaGFubmVsIGlzIHF1ZXVlZAo+IGFuZCBoYW5kZWQgdG8gc29mdHdhcmUgd2hpY2ggcHVsbHMg
aXQgb2ZmIGEgc2Vjb25kIE1QWFkgY2hhbm5lbCBzZXJ2aW5nCj4gUkVRVUVTVF9GT1JXQVJELCBh
bnN3ZXJzIGl0LCBhbmQgY29tcGxldGVzIGl0LiBUaGUgcmVzcG9uc2UgY29tZXMgYmFjayBhcwo+
IHRoZSByZXNwb25zZSBvZiB0aGUgb3JpZ2luYWwgcmVxdWVzdC4gVGhlIHF1ZXVlIGFuZCB0aGUg
UkVRVUVTVF9GT1JXQVJECj4gY2hhbm5lbCBrbm93IG5vdGhpbmcgYWJvdXQgTU07IHRoZSBNQU5B
R0VNRU5UX01PREUgY2hhbm5lbCBvZiBwYXRjaCA1IGlzCj4gc2ltcGx5IHRoZWlyIGZpcnN0IHBy
b2R1Y2VyLgo+Cj4gVGhlIHNlcmllcyB0b3VjaGVzIGluY2x1ZGUvc2JpX3V0aWxzLyBhbmQgbGli
L3V0aWxzL21weHkvIG9ubHkuIFRoZXJlIGlzCj4gbm8gY2hhbmdlIHRvIGxpYi9zYmkvLgo+Cj4g
ICAxICB0aGUgUlBNSSB2MS4wIFJFUVVFU1RfRk9SV0FSRCBzZXJ2aWNlIGdyb3VwIGRlZmluZXMK
PiAgIDIgIGEgcHJlcCBwYXRjaCBtb3ZpbmcgdGhlIFJQTUkgbWVzc2FnZSBwcm90b2NvbCBhdHRy
aWJ1dGVzIG91dCBvZiB0aGUKPiAgICAgIG1haWxib3ggaGVhZGVyLCBzbyBhIGNoYW5uZWwgZHJp
dmVyIHdpdGggbm8gbWFpbGJveCBiZWhpbmQgaXQgZG9lcwo+ICAgICAgbm90IGhhdmUgdG8gaW5j
bHVkZSB0aGUgbWFpbGJveCBoZWFkZXJzLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAgIDMgIHRo
ZSBmb3J3YXJkZWQgbWVzc2FnZSBxdWV1ZQo+ICAgNCAgdGhlIFJFUVVFU1RfRk9SV0FSRCBjaGFu
bmVsIGRyaXZlcgo+ICAgNSAgdGhlIE1BTkFHRU1FTlRfTU9ERSBjaGFubmVsIHRoYXQgZm9yd2Fy
ZHMgdGhyb3VnaCBpdAo+Cj4gTm90ZXMgb24gd2hhdCBpcyBkZWxpYmVyYXRlbHkgbm90IGhlcmU6
Cj4KPiAqIFJFUUZXRF9FTkFCTEVfTk9USUZJQ0FUSU9OIHJlcG9ydHMgUlBNSV9FUlJfTk9UU1VQ
UC4gUkVRRldEX05FV19NRVNTQUdFCj4gICBpcyBhbiBSUE1JIG5vdGlmaWNhdGlvbiBtZXNzYWdl
IGFuZCBTQkkgTVBYWSBkZWxpdmVycyB0aG9zZSB0aHJvdWdoIGFuCj4gICBNU0kgb3IgYW4gU1NF
IGV2ZW50LCBuZWl0aGVyIG9mIHdoaWNoIGlzIHdpcmVkIHVwIGZvciB0aGVzZSBjaGFubmVscywg
c28KPiAgIHNvZnR3YXJlIHBvbGxzIFJFUUZXRF9SRVRSSUVWRV9DVVJSRU5UX01FU1NBR0UuCj4g
KiBCb3RoIGNoYW5uZWxzIGFyZSBvd25lZCBieSB0aGUgcm9vdCBkb21haW4sIGxpa2UgZXZlcnkg
b3RoZXIgTVBYWQo+ICAgY2hhbm5lbCB0b2RheS4gTWFraW5nIGNoYW5uZWwgb3duZXJzaGlwIGZv
bGxvdyB0aGUgZGV2aWNlIHRyZWUgbmVlZHMgdGhlCj4gICBwbGF0Zm9ybSBkb21haW5zIHRvIGV4
aXN0IHdoZW4gTVBYWSBkcml2ZXJzIGFyZSBwcm9iZWQsIHdoaWNoIGlzIGFuIGluaXQKPiAgIG9y
ZGVyIGNoYW5nZSB3b3J0aCBpdHMgb3duIGRpc2N1c3Npb247IGl0IGlzIG5vdCBuZWVkZWQgZm9y
IHRoZQo+ICAgZm9yd2FyZGVyIGl0c2VsZi4KPgo+IFRlc3RlZCBvbiBRRU1VIHZpcnQgd2l0aCB0
d28gYmFyZS1tZXRhbCBTLW1vZGUgcGF5bG9hZHMgb24gdHdvIEhBUlRzOiBvbmUKPiBjYWxscyBN
TV9DT01NVU5JQ0FURSB3aXRoIGEgYnVmZmVyIGluIHRoZSBNTSBzaGFyZWQgbWVtb3J5LCB0aGUg
b3RoZXIKPiBzZXJ2ZXMgdGhlIFJFUVVFU1RfRk9SV0FSRCBjaGFubmVsIGFuZCB0cmFuc2Zvcm1z
IGl0LiBUaGUgZm9yd2FyZGVkCj4gbWVzc2FnZSBpcyByZXRyaWV2ZWQgaW4gdGhyZWUgY2h1bmtz
ICh0aGUgY2hhbm5lbCBNU0dfTUFYX0xFTiBpcyBzZXQgdG8gMjAKPiBieXRlcyBvbiBwdXJwb3Nl
KSwgYSByZXF1ZXN0IG91dHNpZGUgdGhlIE1NIHNoYXJlZCBtZW1vcnkgaXMgcmVmdXNlZCwgYQo+
IHJlc3BvbnNlIGNsYWltaW5nIG1vcmUgb3V0cHV0IHRoYW4gdGhlIHJlcXVlc3QgYWxsb3dlZCBp
cyByZWZ1c2VkLCBhCj4gZHJvcHBlZCByZXF1ZXN0IHRpbWVzIG91dCB3aXRoaW4gTVNHX0NPTVBM
RVRJT05fVElNRU9VVCwgdGhlIGxhdGUKPiBjb21wbGV0aW9uIGlzIHJlZnVzZWQsIGFuZCB0aGUg
cXVldWUgaXMgdXNhYmxlIGFmdGVyd2FyZHMuCgpJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY2Fu
IGhlbHAgcmV2aWV3IE96YSdzIGdlbmVyaWMgTVBYWSBSUE1JIGJyaWRnZQpkcml2ZXIgYW5kIHBy
ZWZlcnJlYmx5IHRlc3QgaXQgYXQgeW91ciBlbmQgYXMgd2VsbCBzbyB0aGF0IHdlIGNhbiBtYWtl
IHByb2dyZXNzCmZhc3Rlci4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
