Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D578606A324
	for <opensbi@archiver.kernel.org>; Sun,  1 Nov 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ab/QymMR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=d8TDks81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A+itmQlCwxvUVoGHyCARReQQRgCEQ3ngDb+O60I/u9c=; b=ab/QymMRaWKs2/wK+7arxl8g+5
	c/bFy4bIcISNRdLls60ORq9BSn4K1vrEhaZpH/ARyfCiuw6WpT8rf5yG9KRdwrcrIDzyxX10vX+qX
	wJTuYcT5J77AjXPowaXiGW7OozSqa101RxPg96Nn9dnsX3A17CRgSX/yX11PRY+PrMDrBWC47unz/
	WMx0FF/rlPxD3fbZXJ0A51IRLS3txrMWo25EWCa6gledMl/EmAISEcD0dNLeTpyP9HsYEpTtCbRer
	g/nBr0GPrF3iU5/g4Wizpw4mnTvb5y7mQFu6Nl5YDcP6Gm245wvssodGnIH6PdmtJIDWlm7xADg8U
	5rsPZEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNUjw-0000000ECuk-2HwO;
	Sun, 01 Nov 2026 12:32:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNUju-0000000ECuO-0RZu
	for opensbi@lists.infradead.org;
	Sun, 01 Nov 2026 12:32:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so16742155e9.3
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 04:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793536364; cv=none;
        d=google.com; s=arc-20260327;
        b=HcQsezbjoZJRzOf0KDR81o8sUDtsUVmpkLYKIBmiH2GoBVesgLvdkgtf3XCjZHhWqH
         s5g3N11A53iBxXH64LFiw1HQrYHfKJHa0lR+PgM/02lEN0WtJ65QycXCRY6U5YUtHxZH
         /0lAJChYlqb+D1E6cgqtFPFulRoPsNaq0tpL3NRT+6aVPs92uG9yFGPtmTWuQHfRTZRw
         ccA/QRjbDAjejIIeR4ygq9sVqThy43xRV2eyaRVMrKmYuplQEhwIPrhOfsXOQ1tVZCWV
         xMOKtCEIVShidq12/Mj/TzzWHx3rRRR3CUOVlIp+y/548L8G89L8dvoe4jtD4MsaAGuU
         2CIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AK27UhpsLDLw/Ty83jXk/4sw8i/KRXM4w1SI6QZ+gNQ=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=DwVMQqVlEVhDhtw7Kq9KXMXspsD0q1QpuZ8WaaBqWzJyK4TV/EWpn7k37Zp8JnWNoU
         gRth/ajw64XXQvKgE3UdvOzhOrHQBiRXbSM5JnrfFRoqk0fa/T+7gqFWh+cnTsVMqts2
         3jLHI3HlYhpuk42WgUYETOQ6NDI57IewZY6c4eVye0mpMfEeI5yUxGNqOdA8AgvLEi5w
         yAiw6eb8fOUPRvJNYKVNX2qaZSJVEmUz/ILMupWjmQ9ggKiMKk8psyJKplwgLYCBoeNY
         TMI3qY+6U0egeN/A1Z40UVScMsqKhMEQwTaO+bIQH+iA0FSCPDnBnOHXre+2ZpaDz92h
         4SwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793536364; x=1794141164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AK27UhpsLDLw/Ty83jXk/4sw8i/KRXM4w1SI6QZ+gNQ=;
        b=d8TDks811fCcXgbUxqYseshOY/mIc2ANl99Dx8lxatLtPa26NvstFcGFN2Cr15TMmH
         xWLRBp9YoS/q/t0a2X+z3O66qBGgTAb74sfBYf4IoT/G7Lu+rYftiOkqL5FkdXI8loQ5
         vu65XCEbjmJfYbME6MTDjB62lqyKz1STV3o+0vytrzFBZyVTZxNn9SVxH/hREPfO5CEf
         rUTyeuhPAxaIQbGB6Gj1ydKkRJb5iV/7TxL3T9tVHucNe4va24nI0VcFReSKUWm/cqRl
         5S+GRjEWp+ZDiD+/dnegzfC7xZAKjWJ/cPu7SrpeZrHL745XDPOwdp+jIKxHP4zJ4Pi8
         fVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793536364; x=1794141164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AK27UhpsLDLw/Ty83jXk/4sw8i/KRXM4w1SI6QZ+gNQ=;
        b=f/U3KbcOOkjrz5r6oNCdzdHOv5b9ciAKlUqHUlXPn0jk3dfZUyGo0bJt4Bx8UgxRiP
         8DBHxYufBUVLnHMZEPDRRfnuCuWSfVo0pK4uGtKrvJklzU/zVm2t8znr7qa9tVRT38F8
         gHULrcYldwoVB2AScVurulv8d3eIgg2CSTdM07O3/8hKWBFvmpWeju4RVTLGp8y5ou/V
         9nBjgOgsQKZlHVJHFnqZECrQ7A7l8UBzCuc82fx7db41EL+nOXaGGgzpx6XfvAn+fcdR
         Ctc7IIEDyQX1P9YsrZZDOLPSq72M6xCCuuQ+O/Pv9awUybb3mD2/LOEbNcRdno5Tt7Dd
         N10w==
X-Gm-Message-State: AFq9FYJ5jM+8v/kkfA8Qirp3zGCa2AaOnZd/m/XdON5pUq10Z9lBiGt0
	/AuVRvmInqRnVxMbOQp/FXQQUC/dY+4YkuIHjXcYFc5sT+SllpQlSaHD4GuOJ+a1+TuThH1JBLu
	eLmsg9lCy+gBYMqdabt+FFoMKiDLN/Efr4QpB8zFtNQ==
X-Gm-Gg: AYBFou24Pxtre2ZohDxmMH33IUXi2eejnLcCK8vUTMqvp9uFYTchHvUk2AkJ/WxLTMR
	L7NHJ1eK6dFOde02oKdrIvOwuajLnl+bcK2/tblDtWzElMK6cIHcuwhwr04Ml7GCH0cS7xAx4Tn
	omVg6bZnYlv8Np1HMpH02WmYFHP2jWIthbmBjPvDeN++pGM+ljyfftUr8PA966RR2T7WwURKVmy
	B6M8CEXbX2GKCI2JgQneGdoEbGWr5tLmML560V2kmXSo63Q3/DrUADAlsc9q/DGajlulfYjXFAx
	+R46GFMuL/Mt3qIqdYZ/SOJIpDg5vxTahs/0YEjkGxMlt2+oMiygSde26C4Yo3hiPmpt8JqpAe1
	V9yvGpXAYOpqwmKi2+2kzvp+QemVGutppNb7PwxhAMLXuNxHTpQA9KRN/gECHCWahNmYOl06bC6
	4jsHmyk5M3mRLgfZXKLqnT8ij+y8ooB/MGDhsQwYf9MOVSKUkz1eYM54tKdH7sHrqGITZdWEqph
	kyX
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id
 5b1f17b1804b1-4ac187a6960mr168468655e9.27.1793536363769; Sun, 01 Nov 2026
 04:32:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026161448.938375-1-pawandeep.oza@oss.qualcomm.com> <20261026161448.938375-2-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261026161448.938375-2-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 1 Nov 2026 18:02:27 +0530
X-Gm-Features: AclHuK8bA7MqXeZGxqXYrqnds0Ix4cpJDUtDlBd_HdFqpB9vGsOAl4E-mv5J_T8
Message-ID: <CAAhSdy1FxWYbiE=RVWTXSMvH10pgMvD242YUfKL2n2DDhghS9w@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD
 service group definitions
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_043246_184376_EB65C712 
X-CRM114-Status: GOOD (  17.26  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMjYsIDIwMjYgYXQgOTo0NOKAr1BNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBBZGQgbWVzc2FnZSBwcm90b2NvbCBk
ZWZpbml0aW9ucyBmb3IgdGhlIFJQTUkgUkVRVUVTVF9GT1JXQVJEIHNlcnZpY2UKPiBncm91cCAo
U0VSVklDRUdST1VQX0lEOiAweDAwMEQpLgo+Cj4gVGhlIGZvbGxvd2luZyBhcmUgaW50cm9kdWNl
ZDoKPgo+ICAgLSBlbnVtIHJwbWlfcmVxdWVzdF9mb3J3YXJkX3NlcnZpY2VfaWQ6IHNlcnZpY2Ug
SURzIGZvciB0aGUKPiAgICAgUkVRVUVTVF9GT1JXQVJEIHNlcnZpY2UgZ3JvdXA6Cj4gICAgICAg
LSBSRVFGV0RfRU5BQkxFX05PVElGSUNBVElPTiAgKDB4MDEpCj4gICAgICAgLSBSRVFGV0RfUkVU
UklFVkVfQ1VSUkVOVF9NRVNTQUdFICgweDAyKQo+ICAgICAgIC0gUkVRRldEX0NPTVBMRVRFX0NV
UlJFTlRfTUVTU0FHRSAoMHgwMykKPgo+ICAgLSBzdHJ1Y3QgcnBtaV9yZXF1ZXN0X2ZvcndhcmRf
cmVzcDogcmVzcG9uc2Ugc3RydWN0dXJlIGZvcgo+ICAgICBSRVFGV0RfUkVUUklFVkVfQ1VSUkVO
VF9NRVNTQUdFIChTRVJWSUNFX0lEIDB4MDIpIGNhcnJ5aW5nCj4gICAgIHN0YXR1cywgcmVtYWlu
aW5nIGJ5dGVzLCByZXR1cm5lZCBieXRlcyBhbmQgYSBmbGV4aWJsZSBhcnJheQo+ICAgICBtZW1i
ZXIgZm9yIHRoZSBpbmxpbmUgbWVzc2FnZSBkYXRhLgo+Cj4gICAtIHN0cnVjdCBycG1pX3JlcXVl
c3RfY29tcGxldGVfcmVzcDogcmVzcG9uc2Ugc3RydWN0dXJlIGZvcgo+ICAgICBSRVFGV0RfQ09N
UExFVEVfQ1VSUkVOVF9NRVNTQUdFIChTRVJWSUNFX0lEIDB4MDMpIGNhcnJ5aW5nCj4gICAgIHN0
YXR1cyBhbmQgdGhlIG51bWJlciBvZiBwZW5kaW5nIGZvcndhcmRlZCBtZXNzYWdlcy4KPgo+IFRo
ZXNlIGRlZmluaXRpb25zIGFyZSB1c2VkIGJ5IHRoZSBNUFhZIGJyaWRnZSBkcml2ZXIgdG8gaW1w
bGVtZW50Cj4gdGhlIFJQTUkgUkVRVUVTVF9GT1JXQVJEIHByb3RvY29sIGZvciBpbnRlci1kb21h
aW4gbWVzc2FnZSBwYXNzaW5nCj4gb3ZlciB0aGUgU0JJIE1QWFkgZXh0ZW5zaW9uLgo+Cj4gU2ln
bmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29t
PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
VGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21z
Z3Byb3QuaCB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9y
cG1pX21zZ3Byb3QuaCBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgK
PiBpbmRleCA3YWU0YWJlMC4uYzVkNTY0YWMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmlfdXRp
bHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaAo+ICsrKyBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxi
b3gvcnBtaV9tc2dwcm90LmgKPiBAQCAtMTA2NCw0ICsxMDY0LDI0IEBAIHN0cnVjdCBycG1pX2xv
Z2dpbmdfbG9nX2RhdGFfcmVzcCB7Cj4gICAgICAgICBzMzIgc3RhdHVzOwo+ICB9Owo+Cj4gKy8q
KiBSUE1JIFJFUVVFU1RfRk9SV0FSRCBTZXJ2aWNlR3JvdXAgU2VydmljZSBJRHMgKi8KPiArZW51
bSBycG1pX3JlcXVlc3RfZm9yd2FyZF9zZXJ2aWNlX2lkIHsKPiArICAgICAgIFJFUUZXRF9FTkFC
TEVfTk9USUZJQ0FUSU9OID0gMHgwMSwKPiArICAgICAgIFJFUUZXRF9SRVRSSUVWRV9DVVJSRU5U
X01FU1NBR0UgPSAweDAyLAo+ICsgICAgICAgUkVRRldEX0NPTVBMRVRFX0NVUlJFTlRfTUVTU0FH
RSwKPiArfTsKPiArCj4gK3N0cnVjdCBycG1pX3JlcXVlc3RfZm9yd2FyZF9yZXNwIHsKPiArICAg
ICAgIHUzMiBzdGF0dXM7Cj4gKyAgICAgICB1MzIgcmVtYWluaW5nOwo+ICsgICAgICAgdTMyIHJl
dHVybmVkOwo+ICsgICAgICAgdTggZGF0YVtdOwo+ICt9Owo+ICsKPiArLyoqIFJQTUkgTU0gU2Vy
dmljZUdyb3VwIENvbW11bmljYXRlIHJlc3BvbnNlIHN0cnVjdCAqLwo+ICtzdHJ1Y3QgcnBtaV9y
ZXF1ZXN0X2NvbXBsZXRlX3Jlc3Agewo+ICsgICAgICAgdTMyIHN0YXR1czsKPiArICAgICAgIHUz
MiBudW1fb2ZfbWVzc2FnZXM7Cj4gK307Cj4gKwo+ICAjZW5kaWYgLyogIV9fUlBNSV9NU0dQUk9U
X0hfXyAqLwo+IC0tCj4gMi40My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
